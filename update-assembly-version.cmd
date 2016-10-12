@echo off

REM update-assembly-version.cmd VERSION_INFO 
REM VERSION_INFO=1.0.0.0

set VERSION_INFO=%1%

set VERSION_FILE=.\VersionInfo.cs

if exist %VERSION_FILE% (
	echo Deleting %VERSION_FILE% ... .. .
	del /q %VERSION_FILE%
	echo done
)

echo Assembly Version : %VERSION_INFO%
echo Writing to %VERSION_FILE%

echo using System.Reflection; >> %VERSION_FILE%
echo [assembly: AssemblyVersion(%VERSION_INFO%)] >> %VERSION_FILE%
echo [assembly: AssemblyFileVersion(%VERSION_INFO%)] >> %VERSION_FILE%

echo done