@echo off
:: only load rest of script if called via another script; user shouldn't run this script directly
:: originally, clicking this script directly will open Windows Photo Viewer with image that never finish loading
if "%*"=="" (
	exit
)

:: rename this window so it can be closed in another script
title openImg
:: thanks to Neutron16 for the solution https://www.sevenforums.com/software/180378-where-windows-photo-viewer-default-location.html
%SystemRoot%\System32\rundll32.exe "%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll", ImageView_Fullscreen %1
