@echo off
setlocal enabledelayedexpansion
:: only load rest of script if called via another script; user shouldn't run this script directly
if "%*"=="" (
	exit
)

type ".\txt\outro.txt"

:foreverloop
set /p userInput=""
:: call module and pass in appropriate path as argument
if /i %userInput%==S (
	call start.bat %setup%
) else (
	if /i %userInput%==E (
		exit 0
	) else (
		echo "Only 2 paths are open before you, choose again."
		goto :foreverloop
	)
)

