@echo off
:start
title youtube-dl
echo youtube-dl wizard
echo welcome lets get downloading!
echo ---options---
echo 1: download a youtube video
echo 2: update youtube-dl
set /p a=Option: 
if %a%==1 goto download
if %a%==2 goto update
goto start

:download
clear
title youtube-dl download
echo what is the URL of the youtube video?
set /p v=URL: 
clear
echo starting download!
youtube-dl -f bestvideo+bestaudio --console-title --ffmpeg-location D:\apps\ffmpeg\bin\ %v%
echo download is (probably) complete!
pause
exit

:update
clear
title youtube-dl update
echo update youtube-dl? (y n)
set /p u=Option: 
if %u%==y goto update2
if %u%==n goto start
goto update

:update2
youtube-dl -U
echo youube-dl has (probably) updated!
pause
exit