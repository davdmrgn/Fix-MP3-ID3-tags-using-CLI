# Fix MP3 ID3 Tags using CLI

Using Python and PowerShell to fix MP3 tags and miscellaneous things.

## Requirements

I used [Homebrew](https://brew.sh/) to install most of these.

- Python
  - [pip](https://docs.brew.sh/Homebrew-and-Python)
  - [eyeD3](https://eyed3.readthedocs.io/en/latest/installation.html)
- [PowerShell Core](https://formulae.brew.sh/cask/powershell) (because I don't know Python)

### Additional Software

- MP3gain (also known as [AACgain](http://aacgain.altosdesign.com/)) - added to this repo _(includes an AppleScript used in Music on macOS)_
  > I've been using this for many years to level my MP3s, so I continue to use it even though Serato supports it natively now.

## Code Examples

- Open PowerShell
- Change to the directory where your MP3s are
  ```powershell
  cd ~/Music/Crates
  ```
- Set `$files` variable to files to be processed
  ```powershell
  $files = Get-ChildItem -Recurse *.mp3
  $files = Get-ChildItem -Recurse *.mp3 | ? { $_.LastAccessTime -gt (Get-Date).AddHours(-36) }
  ```

### Replace double quotes with 2 single quotes in file name (eyeD3 cannot read files with double quotes)

```powershell
foreach ($file in $files) {
  $artist = $file.Name.Split(" - ")[0]
  $title = $file.Name.Split(" - ")[1]
  $file | Rename-Item -NewName ($artist.Replace("`"","'") + " - " + $title.Replace("`"","''"))
}
```

### Bulk Fix Tags

```powershell
foreach ($file in $files) {
  $id3 = eyeD3 $file
  $artist = (($id3 | Select-String "artist") -split "artist: ")[1] -replace ":|\/","-"
  $title = (($id3 | Select-String "title") -split "title: ")[1] -replace ":|\/","-"

  $NewArtist = $artist.Replace("`"","'").Replace(" Feat. ",", ")
  $NewTitle = $title.Replace("`"","''").Replace("Instrumental","Inst").Replace("Acapella","Acap")

  if ($artist -ne $NewArtist -or $title -ne $NewTitle) {
    Start-Sleep 1
    Write-Host "$($file.FullName): $artist - $title ==> $NewArtist - $NewTitle" -ForegroundColor Cyan
    eyeD3 $file -a $NewArtist -t $NewTitle
  }
}
```

Once done, use Finder to look for files modified. Drag into a temp Serato create and rescan those files ID3 tags to update them.

### Find Low Bitrate MP3s and Search Deezer for Replacements

This will look for files with a bitrate lower than the value specified, search Deezer for the track, and if available it will add it to a text file with the URL to the Deezer song found. This will not always work as it relies on your track names to be set correctly and used as search terms in Deezer. Sometimes Deezer will have instrumentals or other versions, so I split out the URI to look for those specifically, based on how I label my tracks (for example, my songs are typically tagged like this `Artist - Title (Inst)`).

> A 128 kbps bitrate is low, but if you have a lot of files with a low bitrate it's best to start low then creep higher. Otherwise you'll get hundreds of files to download/review/replace/etc.

```powershell
$BitrateMinimum = 128
foreach ($file in $files) {
  $id3 = eyeD3 $file
  $bitrate = (($id3 | Select-String "kb/s") -split "\[ |kb")[1].Replace("~",$null)
  if ($bitrate -le $BitrateMinimum) {
    Write-Host $file -NoNewline
    Write-Host " $bitrate" -ForegroundColor:Yellow -NoNewline
    $artist = (($id3 | Select-String "artist") -split "artist: ")[1]
    $title = (($id3 | Select-String "title") -split "title: | \(")[1]
    if ($file -match "Inst") {
      $URI = "https://api.deezer.com/search?q=artist:`'$($artist.ToLower())`' track:`'$($title.ToLower()) instrumental`'"
    } else {
      $URI = "https://api.deezer.com/search?q=artist:`'$($artist.ToLower())`' track:`'$($title.ToLower())`'"
    }
    $rest = Invoke-RestMethod -Uri $URI
    if ($rest.data.count -gt 0) {
      $result = ($rest.data | Sort-Object rank)[0]
      Write-Host " FOUND: $($result.artist.name) - $($result.title)" -ForegroundColor:Green
      ($rest.data | Sort-Object rank).link | Out-File ~/Music/downloadLinks.txt -Append
    } else {
      Write-Host " NOT FOUND" -ForegroundColor:Red
    }
  }
}
```

### Rename Files to Match Song Names

I like my file names to match my song names (`Artist - Title (Version).mp3`). One time I goofed editing files in Serato, selected hundreds of files and change the artist on all of them by accident. I was on the road, so I didn't have my backup, but I was able to use an iTunes script to change my artist tag by using the file name. It saved me a few times, so I've been doing that ever since.

```powershell
foreach ($file in $files) {
  $id3 = eyeD3 $file
  $a = (($id3 | Select-String "artist") -split "artist: ")[1] -replace "\/|\\","-"
  $t = (($id3 | Select-String "title") -split "title: ")[1] -replace "\/|\\","-"
  $1 = $file.Name.Split(" - ")[0]
  $2 = ($file.Name.Split(" - ")[1..3] -join " - ").Replace($file.Extension,$null)
  if ($id3.length -gt 0 -or $a.length -gt 0 -or $t.length -gt 0) {
    if ($a -ne $1 -or $t -ne $2) {
      eyeD3 $file --rename '$artist - $title' -Q
    }
  }
}
```

###  Set ID3 tags to _Artist_ - _Title_

```powershell
foreach ($file in $files) {
  $id3 = eyeD3 $file
  $a = (($id3 | Select-String "artist") -split "artist: ")[1] -replace "\/|\\","-"
  $t = (($id3 | Select-String "title") -split "title: ")[1] -replace "\/|\\","-"
  $1 = $file.Name.Split(" - ")[0]
  $2 = ($file.Name.Split(" - ")[1..3] -join " - ").Replace($file.Extension,$null)
  if ($1 -ne $a -or $2 -ne $t) {
    eyeD3 $file -a $1 -t $2 -Q
  }
}
```
#### With progress indicator

```powershell
$FixFiles = @()
$RenamedFiles = @()
for ($i=0; $i -lt $files.count; $i++) {
  $file = $files[$i]
  $id3 = eyeD3 $file
  Write-Progress -Activity $file.FullName -Status "$([math]::Round($i/$files.count*100))% Complete ~ File $i of $($files.count) ~ Renamed: $($RenamedFiles.count) ~ Errors: $($FixFiles.count)" -PercentComplete ($i/$files.count*100)
  $a = (($id3 | Select-String "artist") -split "artist: ")[1] -replace "\/|\\","-"
  $t = (($id3 | Select-String "title") -split "title: ")[1] -replace "\/|\\","-"
  if ($id3.length -gt 0 -or $a.length -gt 0 -or $t.length -gt 0) {
    if ($a -ne $file.Name.Split(" - ")[0] -or $t -ne ($file.Name.Split(" - ")[1..3] -join " - ").Replace($file.Extension,$null)) {
      eyeD3 $file --rename '$artist - $title' -Q
      $RenamedFiles += $file.FullName
    }
  } else {
    $FixFiles += $file
  }
}
```

Everything renamed is saved to the variable `$RenameFiles` so I can export to a .csv or review later in case something goes wrong. Files with problems are saved to `$FixFiles`.

### Run MP3gain on Files Without the ReplayGain Tag

Info on [ReplayGain](https://en.wikipedia.org/wiki/ReplayGain) algorithm. This code will output MP3gain changes into a log file in your `~/Music` directory. I keep track of this for unknown reasons. Normal tracks work best at 95 db (value of 6). Instrumentals, Accapellas, or bass-heavy tracks do better at 93 db (value of 4). Every now and then there's the anomaly, but that's few and far between. When that happens I usually use the macOS app _Music_ (formerly _iTunes_) to make adjustments.

| db Level | AACgain Value |
| -------- | ------------- |
| 97 db    | 8             |
| 95 db    | 6             |
| 93 db    | 4             |
| 91 db    | 2             |
| 89 db    | 0             |

```powershell
foreach ($file in $files) {
  $id3 = eyeD3 $file -v
  $RelativeVolumeFrame = $id3 | Select-String "RVA" | ? { $_ -match "RAVD|RVA2" }
  if ($RelativeVolumeFrame.count -eq 0) {
    Write-Host "Modifying: $file" -ForegroundColor Cyan
    $db = if ($file.Name -cmatch "Inst|Acap") {
      4
    } else {
      6
    }
    ~/Library/Music/Scripts/MP3gain/aacgain -r -f -d $db -c $file | Out-File ~/Music/MP3gain.log -Append
  }
}
```

### Get Song Year From Deezer

This filter is set to only get tracks that have a special comment I have set which don't have a year tag. Uncomment the `$prompt` block to have the option to set the year. The index of each song is displayed in brackets, so the `$i` start index can be adjusted to skip a batch of songs if needed.

```powershell
for ($i=0; $i -lt $files.count; $i++) {
  $file = $files[$i]
  $id3 = eyeD3 $file
  $color = $id3 | Select-String -Pattern "^\|(Red|Blue|Green|Yellow|Pink)"
  $recording_date = $id3 | Select-String "recording date"
  if ($color.length -gt 0 -and $recording_date.length -eq 0) {
    $artist = (($id3 | Select-String "artist") -split "artist: ")[1]
    $title = (($id3 | Select-String "title") -split "title: | \(")[1]
    $URI = "https://api.deezer.com/search?q=artist:`'$($artist.ToLower())`' track:`'$($title.ToLower())`'"
    $rest = Invoke-RestMethod -Uri $URI
    if ($rest.data.count -gt 0) {
      $results = $rest.data | ? { $_.artist.name -notmatch "various" } | Sort-Object rank
      Write-Host "$($results.count) results: $artist - $title   [$i]"
      if ($results.count -gt 0) {
        $albums = $results.album
        $albumdata = @()
        foreach ($album in $albums) {
          $albumdata += Invoke-RestMethod -Uri "https://api.deezer.com/album/$($album.id)"
        }
        $albumresults = $albumdata | ? { $_.artist.name -notmatch "Various" } | Sort-Object release_date | Select-Object -First 3
        foreach ($albumresult in $albumresults) {
          $albumartist = $albumresult.artist.name
          $albumtitle = $albumresult.title
          $albumrelease = $albumresult.release_date
          Write-Host "   $albumrelease - $albumartist - $albumtitle"
        }  <#
        $year = ($albumrelease -split "-")[0]
        $prompt = Read-Host -Prompt "Press Y to set year to $year. Enter to skip or manually enter year"
        switch ($prompt) {
          { $_ -match "y" } { eyeD3 $file --recording-date $year -Q }
          { $_ -match "^\d{4}$" } { eyeD3 $file --recording-date $prompt -Q }
          default { Write-Host "Skip" -ForegroundColor Cyan }
        }  #>
      }
    }
  }
}
```
