@ECHO OFF
ECHO "Create/Move folder Compressed"
FOR %%a IN (*.zip, *.rar, *.tar, *.apk, *ipa, *.7z) DO (
	IF NOT EXIST Compressed MKDIR Compressed
	echo "Move %%a"
	MOVE /Y "%%a" "Compressed"
)

ECHO "Create/Move folder Portable"
FOR %%a IN (*.exe, *.msi) DO (
	IF NOT EXIST "Portable" MKDIR "Portable"
	echo "Move %%a"
	MOVE /Y "%%a" "Portable"
)

ECHO "Create/Move folder Music"
FOR %%a IN (*.mp3) DO (
	IF NOT EXIST Music MKDIR Music
	echo "Move %%a"
	MOVE /Y "%%a" "Music"
)

ECHO "Create/Move folder Video"
FOR %%a IN (*.mp4, *.mkv) DO (
	IF NOT EXIST Video MKDIR Video
	echo "Move %%a"
	MOVE /Y "%%a" "Video"
)

ECHO "Create/Move folder Photo"
FOR %%a IN (*.jpg, *.png, *.gif, *.jpeg, *.bmp) DO (
	IF NOT EXIST Photo MKDIR Photo
	echo "Move %%a"
	MOVE /Y "%%a" "Photo"
)

ECHO "Create/Move folder Documents"
FOR %%a IN (*.txt, *.doc, *.ppt, *.xls, *.pdf, *.docx, *.pptx, *.xlsx, *.rtf) DO (
	IF NOT EXIST Documents MKDIR Documents
	echo "Move %%a"
	MOVE /Y "%%a" "Documents"
)
EXIT
