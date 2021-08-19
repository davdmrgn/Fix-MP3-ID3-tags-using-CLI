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

### Find Low Bitrate MP3s and Search Deezer for Replacements

This will look for files with a bitrate lower than the value specified, search Deezer for the track, and if available it will add it to a text file with the URL to the Deezer song found. This will not always work as it relies on your track names to be set correctly and used as search terms in Deezer. Sometimes Deezer will have instrumentals or other versions, so I split out the URI to look for those specifically, based on how I label my tracks (for example, my songs are typically tagged like this `Artist - Title (Inst)`).

> A 128 kbps bitrate is low, but if you have a lot of files with a low bitrate it's best to start low then creep higher. Otherwise you'll get hundreds of files to download/review/replace/etc.

```powershell
$BitrateMinimum = 128
foreach ($file in (Get-ChildItem -Recurse -File "*.mp3")) {
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
      ($rest.data | Sort-Object rank).link | Out-File ~/Music/LowBitrateDownloads.txt -Append
    } else {
      Write-Host " NOT FOUND" -ForegroundColor:Red
    }
  }
}
```

### File names to match song names

I like my file names to match my song names (`Artist - Title (Version).mp3`). One time I goofed editing files in Serato, selected hundreds of files and change the artist on all of them by accident. I was on the road, so I didn't have my backup, but I was able to use an iTunes script to change my artist tag by using the file name. It saved me a few times, so I've been doing that ever since.

- Everything renamed is saved to the variable `$RenameFiles` so I can export to a .csv or review later in case something goes wrong (just as a precaution while I verify this works)
  ```powershell
  $RenameFiles = @()
  foreach ($file in (Get-ChildItem -Recurse -File "*.mp3")) {
    $id3 = eyeD3 $file
    $artist = (($id3 | Select-String "artist") -split "artist: ")[1] -replace ":|\/","-"
    $title = (($id3 | Select-String "title") -split "title: ")[1] -replace ":|\/","-"
    if ($file.Name -ne "$artist - $title$($file.Extension)") {
      Write-Host "Rename: $($file.Name) ==> $artist - $title$($file.Extension)" -ForegroundColor:Cyan
      "Rename: $($file.Name) ==> $artist - $title$($file.Extension)" | Out-File ~/Music/RenameFiles$(Get-Date yyyyMMdd-HHmm).txt -Append
      $RenameFiles += $file
      $file | Rename-Item -NewName "$artist - $title$($file.Extension)"
    }
  }
  ```

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
foreach ($file in (Get-ChildItem -Recurse -File "*.mp3")) {
  $id3 = eyeD3 $file -v
  $RelativeVolumeFrame = $id3 | Select-String "RVA" | ? { $_ -match "RAVD|RVA2" }
  if ($RelativeVolumeFrame.count -eq 0) {
    Write-Host "Modifying: $file" -ForegroundColor White -BackgroundColor DarkBlue
    $db = if ($file.Name -cmatch "Inst|Acap") {
      4
    } else {
      6
    }
    ~/Library/Music/Scripts/MP3gain/aacgain -r -f -d $db -c $file | Out-File ~/Music/MP3gain.log -Append
  }
}
```
