:hey welcome to my crappy programming i really REALLY suck at programming so uh enjoy this spagetti
@echo off
:start
clear
title youtube-dl
echo youtube-dl wizard
echo welcome lets get downloading!
echo ---options---
echo 1: download a youtube video from URL
echo 2: download a youtube video from URL with standard video quality
echo 3: download audio only from youtube (good for music)
echo 4: download by searching
echo 5: update youtube-dl
echo 6: type your own command for youtube-dl
echo 7: credits
set /p a=Option: 
if %a%==1 goto download
if %a%==2 goto standarddownload
if %a%==3 goto downloadaudio
if %a%==4 goto downloadbutsearch
if %a%==5 goto update
if %a%==6 goto command
if %a%==7 goto credits
goto start

:download
clear
title youtube-dl download
echo what is the URL of the youtube video?
set /p v=URL: 
clear
echo starting download!
yt-dlp -f bestvideo+bestaudio --add-metadata --write-sub --sub-format srt --ignore-config --console-title --ffmpeg-location D:\apps\ffmpeg\bin\ %v%
echo opening explorer...
%SystemRoot%\explorer.exe %~dp0
echo download is (probably) complete!
pause
exit

:downloadbutsearch
title youtube-dl search
clear
echo what do you want to search?
set /p s=search query: 
echo starting download!
yt-dlp -f bestvideo+bestaudio --add-metadata --write-sub --sub-format srt --ignore-config --console-title --ffmpeg-location D:\apps\ffmpeg\bin\ ytsearch:%s%
echo opening explorer...
%SystemRoot%\explorer.exe %~dp0
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
yt-dlp -U
echo youube-dl has (probably) updated!
pause
exit

:standarddownload
clear
title youtube-dl standard download
echo NOTICE: you have selected to download the video in a lower quality
echo i do reccomend that you select one in the main menu
echo i only reccomend to use this option if you have data limits or other reasons
echo press any key to continue downloading with this option
echo or close and reopen the app to select the other option
echo note: subtitles are not downloaded with this option
pause>NUL
clear
echo what is the URL of the youtube video?
set /p v=URL: 
clear
echo starting download!
yt-dlp -f --console-title --ignore-config %v%
echo opening explorer...
%SystemRoot%\explorer.exe %~dp0
echo download is (probably) complete!
pause
exit

:downloadaudio
clear
title youtube-dl audio download
echo select audio format
echo 1: mp3
echo 2: eBic high end audiophile sound format (FLAC)
echo NOTE: youtube compresses audio to death the FLAC version is there for fun
set /p a=Option: 
if %a%==1 goto downloadaudiowithboringsoundformatbleh
if %a%==2 goto downloadaudioflac
goto downloadaudio

:downloadaudiowithboringsoundformatbleh
clear
echo what is the URL of the youtube video?
set /p v=URL: 
clear
echo starting download!
yt-dlp -f bestaudio --add-metadata --metadata-from-title "%(artist)s - %(title)s" --write-sub --sub-format srt --ignore-config --console-title --ffmpeg-location D:\apps\ffmpeg\bin\ --extract-audio --audio-format mp3 %v%
echo opening explorer...
%SystemRoot%\explorer.exe %~dp0
echo download is (probably) complete!
pause
exit

:downloadaudioflac
clear
echo what is the URL of the youtube video?
set /p v=URL: 
clear
echo starting download!
yt-dlp -f bestaudio --add-metadata --metadata-from-title "%(artist)s - %(title)s" --write-sub --sub-format srt --ignore-config --console-title --ffmpeg-location D:\apps\ffmpeg\bin\ --extract-audio --audio-format flac --audio-quality 0 %v%
echo opening explorer...
%SystemRoot%\explorer.exe %~dp0
echo download is (probably) complete!
pause
exit

:command
clear
title youtube-dl cmd
echo youtube-dl command line
echo welcome to the youtube-dl command line!
echo you are able to type in any command for youtube-dl
echo please type in any command below:
set /p c=command: youtube-dl 
yt-dlp %c%
echo command ended
pause
exit

:credits
clear
echo ---CREDITS---
echo Main developer: 
echo Crazynoob458
echo Contributors:
echo none
echo thanks to the developers and contributors of youtube-dl
echo without their work this batch file would have not existed
echo press any key to return to the main menu
pause>NUL
goto start
