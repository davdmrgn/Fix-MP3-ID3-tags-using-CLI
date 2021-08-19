FasdUAS 1.101.10   ��   ��    k             l      ��  ��   1+ MP3gain
written by David Morgan (DeezNotes)
http://www.deeznotes.com

This script is using aacgain version 1.7.0 pulled from MacMP3gain.

Checking aacgain command line against MP3gain for Windows, 
I have found the following correlations with the "-d" flag:
	6 = 95.5
	4 = 92.5
	2 = 91.0
	0 = 89.5
     � 	 	V   M P 3 g a i n 
 w r i t t e n   b y   D a v i d   M o r g a n   ( D e e z N o t e s ) 
 h t t p : / / w w w . d e e z n o t e s . c o m 
 
 T h i s   s c r i p t   i s   u s i n g   a a c g a i n   v e r s i o n   1 . 7 . 0   p u l l e d   f r o m   M a c M P 3 g a i n . 
 
 C h e c k i n g   a a c g a i n   c o m m a n d   l i n e   a g a i n s t   M P 3 g a i n   f o r   W i n d o w s ,   
 I   h a v e   f o u n d   t h e   f o l l o w i n g   c o r r e l a t i o n s   w i t h   t h e   " - d "   f l a g : 
 	 6   =   9 5 . 5 
 	 4   =   9 2 . 5 
 	 2   =   9 1 . 0 
 	 0   =   8 9 . 5 
   
  
 l     ��������  ��  ��        j     �� �� 0 mytitle myTitle  m        �    M P 3 g a i n      j    �� �� 0 	dboptions 	dbOptions  J           m       �   
 9 7   d b      m       �   
 9 5   d b      m       �     
 9 3   d b   ! " ! m     # # � $ $ 
 9 1   d b "  % & % m     ' ' � ( ( 
 8 9   d b &  ) * ) m    	 + + � , ,  U n d o   c h a n g e s *  -�� - m   	 
 . . � / /  C h e c k   t a g   i n f o��     0 1 0 j    �� 2�� 0 dbvalue dbValue 2 J     3 3  4 5 4 m    ����  5  6 7 6 m    ����  7  8 9 8 m    ����  9  : ; : m    ����  ;  <�� < m    ����  ��   1  = > = l     ��������  ��  ��   >  ? @ ? l   \ A���� A O    \ B C B k   [ D D  E F E Z   S G H�� I G >   
 J K J 1    ��
�� 
sele K J    	����   H k   ) L L  M N M l   �� O P��   O = 7Enable indexing so things stay in order when processing    P � Q Q n E n a b l e   i n d e x i n g   s o   t h i n g s   s t a y   i n   o r d e r   w h e n   p r o c e s s i n g N  R S R r     T U T 1    ��
�� 
pFix U o      ���� 	0 oldfi   S  V W V r     X Y X m    ��
�� boovtrue Y 1    ��
�� 
pFix W  Z [ Z l   ��������  ��  ��   [  \ ] \ l   �� ^ _��   ^ / )Grab the selected tracks and count 'em up    _ � ` ` R G r a b   t h e   s e l e c t e d   t r a c k s   a n d   c o u n t   ' e m   u p ]  a b a r    # c d c l   ! e���� e e    ! f f c    ! g h g n     i j i 1    ��
�� 
sele j 4   �� k
�� 
cwin k m    ����  h m     ��
�� 
list��  ��   d o      ����  0 trackselection trackSelection b  l m l r   $ + n o n I  $ )�� p��
�� .corecnte****       **** p o   $ %����  0 trackselection trackSelection��   o o      ���� 0 
trackcount 
trackCount m  q r q l  , ,��������  ��  ��   r  s t s l  , ,�� u v��   u / )Display first dialog and show track count    v � w w R D i s p l a y   f i r s t   d i a l o g   a n d   s h o w   t r a c k   c o u n t t  x y x r   , / z { z m   , - | | � } }  s { o      ���� 0 s   y  ~  ~ Z  0 = � ����� � =  0 3 � � � o   0 1���� 0 
trackcount 
trackCount � m   1 2����  � r   6 9 � � � m   6 7 � � � � �   � o      ���� 0 s  ��  ��     � � � I  > n�� � �
�� .sysodlogaskr        TEXT � b   > K � � � b   > C � � � b   > A � � � m   > ? � � � � � < C h a n g e   t h e   g a i n   o f   y o u r   f i l e s . � o   ? @��
�� 
ret  � o   A B��
�� 
ret  � l  C J ����� � b   C J � � � b   C H � � � b   C F � � � o   C D���� 0 
trackcount 
trackCount � m   D E � � � � �    t r a c k � o   F G���� 0 s   � m   H I � � � � �    s e l e c t e d .��  ��   � �� � �
�� 
btns � J   N V � �  � � � m   N Q � � � � �  C a n c e l �  ��� � m   Q T � � � � �  C o n t i n u e��   � �� � �
�� 
dflt � m   Y Z����  � �� � �
�� 
appr � o   ] b���� 0 mytitle myTitle � �� ���
�� 
givu � m   e h���� ��   �  � � � Z  o � � ����� � =  o x � � � n   o v � � � 1   r v��
�� 
gavu � 1   o r��
�� 
rslt � m   v w��
�� boovtrue � L   { }����  ��  ��   �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   �  Choose your db level    � � � � ( C h o o s e   y o u r   d b   l e v e l �  � � � t   �' � � � k   �& � �  � � � r   � � � � � c   � � � � � l  � � ����� � I  � ��� � �
�� .gtqpchltns    @   @ ns   � o   � ����� 0 	dboptions 	dbOptions � �� � �
�� 
prmp � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � m   � � � � � � �  G u i d e :   � o   � ���
�� 
ret  � m   � � � � � � � , "   9 5   d b :   v o c a l   t r a c k s   � o   � ���
�� 
ret  � m   � � � � � � � * "   9 3   d b :   i n s t   +   a c a p   � o   � ���
�� 
ret  � o   � ���
�� 
ret  � m   � � � � � � � * S e l e c t   y o u r   d b   l e v e l : � �� � �
�� 
inSL � J   � � � �  ��� � m   � � � � � � � 
 9 5   d b��   � �� ���
�� 
appr � o   � ����� 0 mytitle myTitle��  ��  ��   � m   � ���
�� 
TEXT � o      ���� 0 dblevel dbLevel �  � � � l  � � � � � � Z  � � � ����� � =  � � � � � o   � ����� 0 dblevel dbLevel � m   � ���
�� boovfals � L   � �����  ��  ��   � B <This probably has no effect since a default option is chosen    � � � � x T h i s   p r o b a b l y   h a s   n o   e f f e c t   s i n c e   a   d e f a u l t   o p t i o n   i s   c h o s e n �  � � � Z   � � ����� � =  � � � � � o   � ����� 0 dblevel dbLevel � n   � � � � � 4   � ��� �
�� 
cobj � m   � �����  � o   � ����� 0 	dboptions 	dbOptions � k   � � �  � � � r   � �   n   � � 4   � ���
�� 
cobj m   � �����  o   � ����� 0 dbvalue dbValue o      ���� 0 db   � �� O  � n  �	 I   ���
���� 0 dogain doGain
  o   � ����� 0 
trackcount 
trackCount  o   � �����  0 trackselection trackSelection �� o   � ����� 0 db  ��  ��  	  f   � �  f   � ���  ��  ��   �  Z  :���� =  o  
���� 0 dblevel dbLevel n  
 4  ��
�� 
cobj m  ����  o  
���� 0 	dboptions 	dbOptions k  6  r  & n  " 4  "�� 
�� 
cobj  m   !����  o  ���� 0 dbvalue dbValue o      ���� 0 db   !��! O '6"#" n +5$%$ I  ,5�&�~� 0 dogain doGain& '(' o  ,-�}�} 0 
trackcount 
trackCount( )*) o  -.�|�|  0 trackselection trackSelection* +�{+ o  .1�z�z 0 db  �{  �~  %  f  +,#  f  '(��  ��  ��   ,-, Z  ;n./�y�x. = ;I010 o  ;>�w�w 0 dblevel dbLevel1 n  >H232 4  CH�v4
�v 
cobj4 m  FG�u�u 3 o  >C�t�t 0 	dboptions 	dbOptions/ k  Lj55 676 r  LZ898 n  LV:;: 4  QV�s<
�s 
cobj< m  TU�r�r ; o  LQ�q�q 0 dbvalue dbValue9 o      �p�p 0 db  7 =�o= O [j>?> n _i@A@ I  `i�nB�m�n 0 dogain doGainB CDC o  `a�l�l 0 
trackcount 
trackCountD EFE o  ab�k�k  0 trackselection trackSelectionF G�jG o  be�i�i 0 db  �j  �m  A  f  _`?  f  [\�o  �y  �x  - HIH Z  o�JK�h�gJ = oLML o  or�f�f 0 dblevel dbLevelM n  r~NON 4  w~�eP
�e 
cobjP m  z}�d�d O o  rw�c�c 0 	dboptions 	dbOptionsK k  ��QQ RSR r  ��TUT n  ��VWV 4  ���bX
�b 
cobjX m  ���a�a W o  ���`�` 0 dbvalue dbValueU o      �_�_ 0 db  S Y�^Y O ��Z[Z n ��\]\ I  ���]^�\�] 0 dogain doGain^ _`_ o  ���[�[ 0 
trackcount 
trackCount` aba o  ���Z�Z  0 trackselection trackSelectionb c�Yc o  ���X�X 0 db  �Y  �\  ]  f  ��[  f  ���^  �h  �g  I ded Z  ��fg�W�Vf = ��hih o  ���U�U 0 dblevel dbLeveli n  ��jkj 4  ���Tl
�T 
cobjl m  ���S�S k o  ���R�R 0 	dboptions 	dbOptionsg k  ��mm non r  ��pqp n  ��rsr 4  ���Qt
�Q 
cobjt m  ���P�P s o  ���O�O 0 dbvalue dbValueq o      �N�N 0 db  o u�Mu O ��vwv n ��xyx I  ���Lz�K�L 0 dogain doGainz {|{ o  ���J�J 0 
trackcount 
trackCount| }~} o  ���I�I  0 trackselection trackSelection~ �H o  ���G�G 0 db  �H  �K  y  f  ��w  f  ���M  �W  �V  e ��� Z  ����F�E� = ����� o  ���D�D 0 dblevel dbLevel� n  ����� 4  ���C�
�C 
cobj� m  ���B�B � o  ���A�A 0 	dboptions 	dbOptions� O ����� n ����� I  ���@��?�@ 0 undogain undoGain� ��� o  ���>�> 0 
trackcount 
trackCount� ��=� o  ���<�<  0 trackselection trackSelection�=  �?  �  f  ���  f  ���F  �E  � ��;� Z  &���:�9� = ��� o  �8�8 0 dblevel dbLevel� n  ��� 4  �7�
�7 
cobj� m  �6�6 � o  �5�5 0 	dboptions 	dbOptions� O "��� n !��� I  !�4��3�4 0 	checkgain 	checkGain� ��� o  �2�2 0 
trackcount 
trackCount� ��1� o  �0�0  0 trackselection trackSelection�1  �3  �  f  �  f  �:  �9  �;   � m   � ��/�/  � ��.� l ((�-�,�+�-  �,  �+  �.  ��   I k  ,S�� ��� l ,,�*���*  � - 'Show an error if no tracks are selected   � ��� N S h o w   a n   e r r o r   i f   n o   t r a c k s   a r e   s e l e c t e d� ��)� I ,S�(��
�( .sysodlogaskr        TEXT� m  ,/�� ��� & N o   t r a c k s   s e l e c t e d .� �'��
�' 
btns� J  27�� ��&� m  25�� ���  C a n c e l�&  � �%��
�% 
dflt� m  :;�$�$ � �#��
�# 
appr� o  >C�"�" 0 mytitle myTitle� �!��
�! 
disp� m  FG� �  � ���
� 
givu� m  JM�� �  �)   F ��� l TT����  �  �  � ��� r  TY��� o  TU�� 	0 oldfi  � 1  UX�
� 
pFix� ��� l ZZ����  �  �  �   C m     ��|                                                                                      @ alis      macOS                          BD ����	Music.app                                                      ����            ����  
 cu             Applications   /:System:Applications:Music.app/   	 M u s i c . a p p    m a c O S  System/Applications/Music.app   / ��  ��  ��   @ ��� l     ����  �  �  � ��� l     ����  �  �  � ��� i    ��� I      ���� 0 dogain doGain� ��� o      �� 0 
trackcount 
trackCount� ��� o      �
�
  0 trackselection trackSelection� ��	� o      �� 0 db  �	  �  � O     ���� k    ��� ��� l   ����  �  Confirm before running.   � ��� . C o n f i r m   b e f o r e   r u n n i n g .� ��� I   ���
� .sysodlogaskr        TEXT� m    �� ���  R e a d y ?� ���
� 
appr� o    �� 0 mytitle myTitle� ���
� 
givu� m    �� �  � ��� Z    0���� � =   ��� n    ��� 1    ��
�� 
bhit� l   ������ 1    ��
�� 
rslt��  ��  � m    �� ���  O K� r    ��� c    ��� m    �� ���    - c  � m    ��
�� 
ctxt� o      ���� 0 dbclip dbClip� ��� =  " '��� n   " %��� 1   # %��
�� 
bhit� l  " #������ 1   " #��
�� 
rslt��  ��  � m   % &�� ���  C a n c e l� ���� L   * ,����  ��  �   � ��� l  1 1��������  ��  ��  � � � l  1 1����    Do work son    �  D o   w o r k   s o n   I  1 6����
�� .sysoexecTEXT���     TEXT m   1 2 � 8 e c h o     > >   ~ / M u s i c / M P 3 g a i n . l o g��   	
	 I  7 <����
�� .sysoexecTEXT���     TEXT m   7 8 � p e c h o   - - - - - - - - - - - - - - - - - - - - - - - - - - - -   > >   ~ / M u s i c / M P 3 g a i n . l o g��  
  I  = D����
�� .sysoexecTEXT���     TEXT m   = @ � 6 d a t e   > >   ~ / M u s i c / M P 3 g a i n . l o g��    I  E L����
�� .sysoexecTEXT���     TEXT m   E H � p e c h o   - - - - - - - - - - - - - - - - - - - - - - - - - - - -   > >   ~ / M u s i c / M P 3 g a i n . l o g��    l  M M��������  ��  ��    Y   M ����� k   W �  !  r   W d"#" l  W b$����$ e   W b%% n   W b&'& 1   ] a��
�� 
pLoc' n   W ]()( 4   X ]��*
�� 
cobj* o   [ \���� 0 i  ) o   W X����  0 trackselection trackSelection��  ��  # o      ���� 0 	ilocation 	iLocation! +,+ r   e r-.- l  e p/����/ e   e p00 n   e p121 1   k o��
�� 
pnam2 n   e k343 4   f k��5
�� 
cobj5 o   i j���� 0 i  4 o   e f����  0 trackselection trackSelection��  ��  . o      ���� 0 iname iName, 676 r   s z898 I  s x��:��
�� .sysonfo4asfe        file: o   s t���� 0 	ilocation 	iLocation��  9 o      ���� 0 	trackinfo 	trackInfo7 ;<; r   { �=>= c   { �?@? n   { �ABA 1   | ���
�� 
nmxtB o   { |���� 0 	trackinfo 	trackInfo@ m   � ���
�� 
TEXT> o      ����  0 trackextension trackExtension< CDC l  � ���������  ��  ��  D EFE r   � �GHG n   � �IJI 1   � ���
�� 
psxpJ o   � ����� 0 	ilocation 	iLocationH o      ����  0 trackposixpath trackPosixPathF KLK r   � �MNM n   � �OPO 1   � ���
�� 
strqP o   � �����  0 trackposixpath trackPosixPathN o      ���� ,0 trackposixpathquoted trackPosixPathQuotedL QRQ l  � ���������  ��  ��  R STS r   � �UVU b   � �WXW b   � �YZY b   � �[\[ b   � �]^] m   � �__ �`` b ~ / L i b r a r y / M u s i c / S c r i p t s / M P 3 g a i n / a a c g a i n   - r   - f   - d  ^ o   � ����� 0 db  \ o   � ����� 0 dbclip dbClipZ o   � ����� ,0 trackposixpathquoted trackPosixPathQuotedX m   � �aa �bb .   > >   ~ / M u s i c / M P 3 g a i n . l o gV o      ���� 0 
mp3gaincmd 
mp3gainCmdT cdc l  � ���������  ��  ��  d efe l  � ���������  ��  ��  f ghg I  � ���i��
�� .sysoexecTEXT���     TEXTi o   � ����� 0 
mp3gaincmd 
mp3gainCmd��  h j��j l  � ���������  ��  ��  ��  �� 0 i   m   P Q����  o   Q R���� 0 
trackcount 
trackCount��   klk l  � ���������  ��  ��  l mnm l  � ���op��  o  display completion dialog   p �qq 2 d i s p l a y   c o m p l e t i o n   d i a l o gn r��r I  � ���st
�� .sysodlogaskr        TEXTs m   � �uu �vv . N o r m a l i z a t i o n   c o m p l e t e .t ��wx
�� 
apprw o   � ����� 0 mytitle myTitlex ��yz
�� 
dispy m   � ����� z ��{|
�� 
btns{ J   � �}} ~��~ m   � � ���  O K��  | �����
�� 
dflt� m   � ��� ���  O K��  ��  � m     ��|                                                                                      @ alis      macOS                          BD ����	Music.app                                                      ����            ����  
 cu             Applications   /:System:Applications:Music.app/   	 M u s i c . a p p    m a c O S  System/Applications/Music.app   / ��  � ��� l     ��������  ��  ��  � ��� i    ��� I      ������� 0 undogain undoGain� ��� o      ���� 0 
trackcount 
trackCount� ���� o      ����  0 trackselection trackSelection��  ��  � O     ���� k    ��� ��� I   ����
�� .sysodlogaskr        TEXT� m    �� ���  U n d o   c h a n g e s ?� ����
�� 
dflt� m    ���� � ����
�� 
disp� m    	����  � �����
�� 
appr� o   
 ���� 0 mytitle myTitle��  � ��� Z    v������� =   ��� n    ��� 1    ��
�� 
bhit� l   ������ 1    ��
�� 
rslt��  ��  � m    �� ���  O K� Y    r�������� k   & m�� ��� r   & /��� l  & -������ e   & -�� n   & -��� 1   * ,��
�� 
pLoc� n   & *��� 4   ' *���
�� 
cobj� o   ( )���� 0 i  � o   & '����  0 trackselection trackSelection��  ��  � o      ���� 0 	ilocation 	iLocation� ��� r   0 9��� l  0 7����� e   0 7�� n   0 7��� 1   4 6�~
�~ 
pnam� n   0 4��� 4   1 4�}�
�} 
cobj� o   2 3�|�| 0 i  � o   0 1�{�{  0 trackselection trackSelection��  �  � o      �z�z 0 iname iName� ��� r   : A��� I  : ?�y��x
�y .sysonfo4asfe        file� o   : ;�w�w 0 	ilocation 	iLocation�x  � o      �v�v 0 	trackinfo 	trackInfo� ��� r   B I��� c   B G��� n   B E��� 1   C E�u
�u 
nmxt� o   B C�t�t 0 	trackinfo 	trackInfo� m   E F�s
�s 
TEXT� o      �r�r  0 trackextension trackExtension� ��� l  J J�q�p�o�q  �p  �o  � ��� r   J Q��� n   J O��� 1   K O�n
�n 
psxp� o   J K�m�m 0 	ilocation 	iLocation� o      �l�l  0 trackposixpath trackPosixPath� ��� r   R Y��� n   R W��� 1   S W�k
�k 
strq� o   R S�j�j  0 trackposixpath trackPosixPath� o      �i�i ,0 trackposixpathquoted trackPosixPathQuoted� ��� l  Z Z�h�g�f�h  �g  �f  � ��� r   Z e��� b   Z c��� b   Z _��� m   Z ]�� ��� V ~ / L i b r a r y / M u s i c / S c r i p t s / M P 3 g a i n / a a c g a i n   - u  � o   ] ^�e�e ,0 trackposixpathquoted trackPosixPathQuoted� m   _ b�� ��� .   > >   ~ / M u s i c / M P 3 g a i n . l o g� o      �d�d 0 mp3gainundo mp3gainUndo� ��� l  f f�c�b�a�c  �b  �a  � ��� I  f k�`��_
�` .sysoexecTEXT���     TEXT� o   f g�^�^ 0 mp3gainundo mp3gainUndo�_  � ��]� l  l l�\�[�Z�\  �[  �Z  �]  �� 0 i  � m     �Y�Y � o     !�X�X 0 
trackcount 
trackCount��  ��  ��  � ��� l  w w�W�V�U�W  �V  �U  � ��� l  w w�T���T  �  display completion dialog   � ��� 2 d i s p l a y   c o m p l e t i o n   d i a l o g� ��S� I  w ��R��
�R .sysodlogaskr        TEXT� m   w z�� ��� @ M P 3 g a i n   u n d o   o p e r a t i o n   c o m p l e t e .� �Q��
�Q 
appr� o   { ��P�P 0 mytitle myTitle� �O� 
�O 
disp� m   � ��N�N   �M
�M 
btns J   � � �L m   � � �  O K�L   �K�J
�K 
dflt m   � � �		  O K�J  �S  � m     

|                                                                                      @ alis      macOS                          BD ����	Music.app                                                      ����            ����  
 cu             Applications   /:System:Applications:Music.app/   	 M u s i c . a p p    m a c O S  System/Applications/Music.app   / ��  �  l     �I�H�G�I  �H  �G    i    " I      �F�E�F 0 	checkgain 	checkGain  o      �D�D 0 
trackcount 
trackCount �C o      �B�B  0 trackselection trackSelection�C  �E   O     � k    �  I   �A
�A .sysodlogaskr        TEXT m     � . C h e c k   s t o r e d   g a i n   i n f o ? �@
�@ 
dflt m    �?�?  �> !
�> 
disp  m    	�=�=  ! �<"�;
�< 
appr" o   
 �:�: 0 mytitle myTitle�;   #$# Z    z%&�9�8% =   '(' n    )*) 1    �7
�7 
bhit* l   +�6�5+ 1    �4
�4 
rslt�6  �5  ( m    ,, �--  O K& k    v.. /0/ m    11 �22 @ $ n u l l   >   ~ / M u s i c / M P 3 g a i n C h e c k . l o g0 3�33 Y    v4�256�14 k   ( q77 898 r   ( 1:;: l  ( /<�0�/< e   ( /== n   ( />?> 1   , .�.
�. 
pLoc? n   ( ,@A@ 4   ) ,�-B
�- 
cobjB o   * +�,�, 0 i  A o   ( )�+�+  0 trackselection trackSelection�0  �/  ; o      �*�* 0 	ilocation 	iLocation9 CDC r   2 ;EFE l  2 9G�)�(G e   2 9HH n   2 9IJI 1   6 8�'
�' 
pnamJ n   2 6KLK 4   3 6�&M
�& 
cobjM o   4 5�%�% 0 i  L o   2 3�$�$  0 trackselection trackSelection�)  �(  F o      �#�# 0 iname iNameD NON r   < CPQP I  < A�"R�!
�" .sysonfo4asfe        fileR o   < =� �  0 	ilocation 	iLocation�!  Q o      �� 0 	trackinfo 	trackInfoO STS r   D MUVU c   D KWXW n   D GYZY 1   E G�
� 
nmxtZ o   D E�� 0 	trackinfo 	trackInfoX m   G J�
� 
TEXTV o      ��  0 trackextension trackExtensionT [\[ l  N N����  �  �  \ ]^] r   N U_`_ n   N Saba 1   O S�
� 
psxpb o   N O�� 0 	ilocation 	iLocation` o      ��  0 trackposixpath trackPosixPath^ cdc r   V ]efe n   V [ghg 1   W [�
� 
strqh o   V W��  0 trackposixpath trackPosixPathf o      �� ,0 trackposixpathquoted trackPosixPathQuotedd iji l  ^ ^����  �  �  j klk r   ^ imnm b   ^ gopo b   ^ cqrq m   ^ ass �tt Z ~ / L i b r a r y / M u s i c / S c r i p t s / M P 3 g a i n / a a c g a i n   - s   c  r o   a b�� ,0 trackposixpathquoted trackPosixPathQuotedp m   c fuu �vv 8   > >   ~ / M u s i c / M P 3 g a i n C h e c k . l o gn o      �� 0 mp3gaincheck mp3gainCheckl wxw l  j j���
�  �  �
  x yzy I  j o�	{�
�	 .sysoexecTEXT���     TEXT{ o   j k�� 0 mp3gaincheck mp3gainCheck�  z |�| l  p p����  �  �  �  �2 0 i  5 m   ! "�� 6 o   " #�� 0 
trackcount 
trackCount�1  �3  �9  �8  $ }~} l  { {� �����   ��  ��  ~ � l  { {������  �  display completion dialog   � ��� 2 d i s p l a y   c o m p l e t i o n   d i a l o g� ���� I  { �����
�� .sysodlogaskr        TEXT� m   { ~�� ��� x M P 3 g a i n   c h e c k   o p e r a t i o n   c o m p l e t e .   T h e   l o g   f i l e   i s   i n   ~ / M u s i c� ����
�� 
appr� o    ����� 0 mytitle myTitle� ����
�� 
disp� m   � ����� � ����
�� 
btns� J   � ��� ���� m   � ��� ���  O K��  � �����
�� 
dflt� m   � ��� ���  O K��  ��   m     ��|                                                                                      @ alis      macOS                          BD ����	Music.app                                                      ����            ����  
 cu             Applications   /:System:Applications:Music.app/   	 M u s i c . a p p    m a c O S  System/Applications/Music.app   / ��   ��� l     ��������  ��  ��  � ���� l     ��������  ��  ��  ��       	��� ��������  � ���������������� 0 mytitle myTitle�� 0 	dboptions 	dbOptions�� 0 dbvalue dbValue�� 0 dogain doGain�� 0 undogain undoGain�� 0 	checkgain 	checkGain
�� .aevtoappnull  �   � ****� ����� �      # ' + .� ����� �  ������������ �� �� �� ��  � ������������� 0 dogain doGain�� ����� �  �������� 0 
trackcount 
trackCount��  0 trackselection trackSelection�� 0 db  ��  � �������������������������� 0 
trackcount 
trackCount��  0 trackselection trackSelection�� 0 db  �� 0 dbclip dbClip�� 0 i  �� 0 	ilocation 	iLocation�� 0 iname iName�� 0 	trackinfo 	trackInfo��  0 trackextension trackExtension��  0 trackposixpath trackPosixPath�� ,0 trackposixpathquoted trackPosixPathQuoted�� 0 
mp3gaincmd 
mp3gainCmd� #���������������������������������������_au���������
�� 
appr
�� 
givu�� �� 
�� .sysodlogaskr        TEXT
�� 
rslt
�� 
bhit
�� 
ctxt
�� .sysoexecTEXT���     TEXT
�� 
cobj
�� 
pLoc
�� 
pnam
�� .sysonfo4asfe        file
�� 
nmxt
�� 
TEXT
�� 
psxp
�� 
strq
�� 
disp
�� 
btns
�� 
dflt�� �� �� ���b   ��� O��,�  
��&E�Y ��,�  hY hO�j O�j Oa j Oa j O ek�kh �a �/a ,EE�O�a �/a ,EE�O�j E�O�a ,a &E�O�a ,E�O�a ,E�Oa �%�%�%a %E�O�j OP[OY��Oa �b   a ka a kva  a !a " U� ������������� 0 undogain undoGain�� ����� �  ������ 0 
trackcount 
trackCount��  0 trackselection trackSelection��  � 
���������������������� 0 
trackcount 
trackCount��  0 trackselection trackSelection�� 0 i  �� 0 	ilocation 	iLocation�� 0 iname iName�� 0 	trackinfo 	trackInfo��  0 trackextension trackExtension��  0 trackposixpath trackPosixPath�� ,0 trackposixpathquoted trackPosixPathQuoted�� 0 mp3gainundo mp3gainUndo� 
�����������������������������������������
�� 
dflt
�� 
disp
�� 
appr�� 
�� .sysodlogaskr        TEXT
�� 
rslt
�� 
bhit
�� 
cobj
�� 
pLoc
�� 
pnam
�� .sysonfo4asfe        file
�� 
nmxt
�� 
TEXT
�� 
psxp
�� 
strq
�� .sysoexecTEXT���     TEXT
�� 
btns�� �� �� ���l�j�b   � O��,�  [ Uk�kh ��/�,EE�O��/�,EE�O�j E�O��,�&E�O�a ,E�O�a ,E�Oa �%a %E�O�j OP[OY��Y hOa �b   �ka a kv�a a  U� ������������ 0 	checkgain 	checkGain�� ����� �  ������ 0 
trackcount 
trackCount��  0 trackselection trackSelection��  � 
���������������������� 0 
trackcount 
trackCount��  0 trackselection trackSelection�� 0 i  �� 0 	ilocation 	iLocation�� 0 iname iName�� 0 	trackinfo 	trackInfo��  0 trackextension trackExtension��  0 trackposixpath trackPosixPath�� ,0 trackposixpathquoted trackPosixPathQuoted�� 0 mp3gaincheck mp3gainCheck� ���~�}�|�{�z�y,1�x�w�v�u�t�s�r�qsu�p��o���n
� 
dflt
�~ 
disp
�} 
appr�| 
�{ .sysodlogaskr        TEXT
�z 
rslt
�y 
bhit
�x 
cobj
�w 
pLoc
�v 
pnam
�u .sysonfo4asfe        file
�t 
nmxt
�s 
TEXT
�r 
psxp
�q 
strq
�p .sysoexecTEXT���     TEXT
�o 
btns�n �� �� ���l�j�b   � O��,�  _�O Wk�kh ��/�,EE�O��/�,EE�O�j E�O��,a &E�O�a ,E�O�a ,E�Oa �%a %E�O�j OP[OY��Y hOa �b   �ka a kv�a a  U� �m��l�k���j
�m .aevtoappnull  �   � ****� k    \��  ?�i�i  �l  �k  �  � 2��h�g�f�e�d�c�b�a |�` � ��_ � ��^ � ��]�\�[�Z�Y�X�W�V�U � � � ��T ��S�R�Q�P�O�N�M�L�K�J�I�H���G�F
�h 
sele
�g 
pFix�f 	0 oldfi  
�e 
cwin
�d 
list�c  0 trackselection trackSelection
�b .corecnte****       ****�a 0 
trackcount 
trackCount�` 0 s  
�_ 
ret 
�^ 
btns
�] 
dflt
�\ 
appr
�[ 
givu�Z �Y 
�X .sysodlogaskr        TEXT
�W 
rslt
�V 
gavu
�U 
prmp
�T 
inSL�S 
�R .gtqpchltns    @   @ ns  
�Q 
TEXT�P 0 dblevel dbLevel
�O 
cobj�N 0 db  �M 0 dogain doGain�L �K �J 0 undogain undoGain�I �H 0 	checkgain 	checkGain
�G 
disp�F 
�j]�Y*�,jv!*�,E�Oe*�,FO*�k/�,�&E�O�j E�O�E�O�k  �E�Y hO��%�%��%�%�%%a a a lva la b   a a a  O_ a ,e  hY hOa nb  a a �%a %�%a %�%�%a %a  a !kva b   a " #a $&E` %O_ %f  hY hO_ %b  a &k/  #b  a &k/E` 'O) )��_ 'm+ (UY hO_ %b  a &l/  #b  a &l/E` 'O) )��_ 'm+ (UY hO_ %b  a &m/  #b  a &m/E` 'O) )��_ 'm+ (UY hO_ %b  a &a )/  %b  a &a )/E` 'O) )��_ 'm+ (UY hO_ %b  a &a */  %b  a &a )/E` 'O) )��_ 'm+ (UY hO_ %b  a &a "/  ) 	)��l+ +UY hO_ %b  a &a ,/  ) 	)��l+ -UY hoOPY )a .a a /kva ka b   a 0la a *a 1 O�*�,FOPUascr  ��ޭ