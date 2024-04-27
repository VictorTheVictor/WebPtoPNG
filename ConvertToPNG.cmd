@echo off

REM Change the path between the quotations ("") to match your Image Magick path. If you don't have it, get it at https://imagemagick.org/script/download.php and the top most Windows download
set "im_path="C:\Program Files\ImageMagick\magick.exe""
if not exist %im_path% (
	echo Image Magick path not found. Open the script in Notepad/++ and change the im_path path.
	pause
	exit
)

set counter=0
REM set maxCounter = 99
set "image_path=%~1"
set "output_path=%~dpn1.png"

if not exist "%image_path%" (
	echo Please supply the .webp file. This is not meant to be run as a standalone script.
	pause
	exit
)

:loop
if exist "%output_path%" (
	goto counterTick
) else (
	goto processImage
)

exit
:counterTick
set /a counter+=1
set "output_path=%~dpn1_%counter%.png"
if %counter% LSS 99 (
	goto loop
) else (
	echo Maximum counter loops reached. If you want to change this behavior, edit the functions above this line in this script's file with Notepad/++
	pause
	exit
)

exit
:processImage
%im_path% "%image_path%" "%output_path%"
REM remove the "REM" from the next line if you want this script to delete the .webp file after creating the .png
REM del "%image_path%"

exit