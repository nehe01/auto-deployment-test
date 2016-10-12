@echo off
rem ********************************************************
rem: help link http://www.dotnetperls.com/7-zip-examples
rem ********************************************************

set VERSION_INFO=%1%

set SEVEN_ZIP=C:\tools\library\7za\7za.exe a -t7z -mx=9 
set BUILD=.\build\
set ARTIFACT=.\artifact\

if exist %ARTIFACT% (
	echo deleting old build artifacts if any		
	del /q %ARTIFACT%*.7z
	echo done
)

echo -------------------------------------------------------------------------
echo packaging service... .. .
set service_build=%BUILD%SampleService\*.*
set service_artifact=%ARTIFACT%sample-service-%VERSION_INFO%.7z

%SEVEN_ZIP% %service_artifact% %service_build%
echo -------------------------------------------------------------------------

