@echo off
setlocal enabledelayedexpansion
:: this exe most likely exist on any windows machine but will check anyway 
if exist %SystemRoot%\System32\rundll32.exe (
	rem this is the default photo viewer in some Win7 installs, but isn't default in Win10
	rem it's still present altho hidden on most Win10 home editions
	if exist "%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll" (
		echo images works
		:: if called from script, return status instead of pausing
		if "%1" NEQ "" (
			echo defined
			set "%1=TRUE"
		) else (
			pause
		)
		goto :eof
	)
)
:: if called from script, return status instead of pausing
echo PhotoViewer.dll missing, images won't work properly
if "%1" NEQ "" (
	set "%1=FALSE"
) else (
	pause
)