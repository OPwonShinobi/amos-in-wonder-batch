@echo off
:: this exe most likely exist on any windows machine but will check anyway 
if exist %SystemRoot%\System32\rundll32.exe (
	:: this is the default photo viewer in some Win7 installs, but isn't default in Win10
	:: it's still present altho hidden on most Win10 home editions
	if exist "%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll" (
		echo images works
		pause
		exit 
	)
)
echo PhotoViewer.dll missing, images won't work properly
pause
exit
