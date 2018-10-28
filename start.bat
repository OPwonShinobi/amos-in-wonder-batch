@echo off
setlocal enabledelayedexpansion
:: change 
if "%*" NEQ "setup" (
	start /max start.bat setup
	echo die
	exit
)

:: popups can get annoying, deal with this first with infinite loop
:ImageDisplayPrompt
set /p userInput="Would you like to enable popups(images) for this adventure? [Y/N]"
if /i "%userInput%"=="y" (
	set imagesOn=TRUE
) else (
	if /i "%userInput%"=="n" (
		set imagesOn=FALSE
	) else (
		goto :ImageDisplayPrompt
	)
)

mode CON COLS=750 LINES=100
type ".\txt\intro.txt"

:: scan choice file for possible middle commands and paths
set cmd="FINDSTR /L "middle" .\txt\introC.txt"
FOR /F "tokens=1-2 delims= " %%x IN (' %cmd% ') DO (
	if not defined nextNode1		 (
		SET nextNode1=%%y
	) else (
		SET nextNode2=%%y
	)
)

:: empty line after printing body of text
echo:

:PathSelectPrompt
set /p userInput=""
:: call module and pass in appropriate path as argument
if /i %userInput%==%nextNode1% (
	call middle.bat %nextNode1%
	exit
) else (
	if /i %userInput%==%nextNode2% (
		call middle.bat %nextNode2%
		exit
	) else (
		echo "Only 2 paths are open before you, choose again."
		goto :PathSelectPrompt
	)
)
