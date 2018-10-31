@echo off
setlocal enabledelayedexpansion
:: opens a maximized cmd window: open a second instance of this script with max enabled
:: and close the first non-maximized instance
if "%*" NEQ "setup" (
	start /max start.bat setup
	echo die
	exit
)

:: image popups can be annoying, give user option to turn it off.
:: generic prompt in a forever loop
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

:: enlarge cmd window to full screen if is not already
mode CON COLS=200 LINES=100
:: read & display the intro text
type ".\txt\intro.txt"
:: empty line after printing body of text
echo:

:: scan choice file for possible middle commands and paths
set cmd="FINDSTR /L "middle" .\txt\introC.txt"
FOR /F "tokens=1-2 delims= " %%x IN (' %cmd% ') DO (
	if not defined nextNode1		 (
		SET nextNode1=%%y
	) else (
		SET nextNode2=%%y
	)
)

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
