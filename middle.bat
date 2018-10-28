@echo off
setlocal enabledelayedexpansion
:: should only open if called
if "%*"=="" (
	exit
) else (
	set currentNode=%*
)
::unset vars, seems to carry over from start.bat
SET "nextNode1="
SET "nextNode2="

type ".\txt\%currentNode%.txt"
:: scan choice file for possible middle commands and paths
set cmd="findstr /l "middle" .\txt\%currentNode%C.txt"
for /f "tokens=1-2 delims= " %%x in (' %cmd% ') do (
	if not defined nextNode1 (
		SET nextNode1=%%y
	) else (
		SET nextNode2=%%y
	)
)

:: scan choice file for possible end command and path
set cmd="findstr /l "end" .\txt\%currentNode%C.txt"
for /f "tokens=1-2 delims= " %%x in (' %cmd% ') do (
	call end.bat %currentNode%
	exit
)

:: if popups are enabled, display images with formatting
if /i "%imagesOn%"=="TRUE" (
	:: scan choice file for possible images to display
	set cmd="findstr /l "img" .\txt\%currentNode%C.txt"
	set currentDirPath="cd"
	for /f "tokens=1-3 delims= " %%x in (' !cmd! ') do (
		for /f "tokens=* delims= " %%a in (' !currentDirPath! ') do (
			set fullFilePath=%%a\img\%%z
		)
		:: start the img with Photo viewer (needs a windowed GUI as well as can take file arguments)
		start /min openImg !fullFilePath!
		:: close the cmds used to open images
		cmdow openImg /cls
		for /l %%i in (1, 1, 25) do (
			ping 120.0.0.1 -n 1 -w > nul
		)
		if /i "%%y"=="left" (
			cmdow "%%z - Windows Photo Viewer" /res /siz 650 750 /mov 0 0 /act
		)
		if /i "%%y"=="right" (
			cmdow "%%z - Windows Photo Viewer" /res /siz 650 750 /mov 700 0 /act
		)
	)
) 

::empty line after printing body of text
echo:

:foreverloop
set /p userInput=""
:: call module and pass in appropriate path as argument
if /i %userInput%==%nextNode1% (
	call middle.bat %nextNode1%
) else (
	if /i %userInput%==%nextNode2% (
		call middle.bat %nextNode2%
	) else (
		echo "Only 2 paths are open before you, choose again."
		goto :foreverloop
	)
)

