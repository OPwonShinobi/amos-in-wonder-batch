@echo off
setlocal enabledelayedexpansion
::.\img\eyes.png
set currentDirPath="cd"
for /f "tokens=* delims= " %%x in (' !currentDirPath! ') do (
	set fullFilePath=%%x\img\eyes.png
)
echo %fullFilePath%
@echo on
rundll32 "%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll", ImageView_Fullscreen %fullFilePath%
@echo off

rem for /l %%i in (1, 1, 25) do (
rem 	ping 120.0.0.1 -n 1 -w > nul
rem )
rem echo done!
rem cmdow "eyes.png - Windows Photo Viewer" /res /mov 700 0 /siz 650 750 /ren "eyes.png" /act
rem cmdow "eyes.png - Windows Photo Viewer" /res /mov 0 0 /siz 650 750 /ren "eyes.png" /act