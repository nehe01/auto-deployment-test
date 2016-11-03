@echo off

REM ci-build SOLUTION BUILD_NUMBER

set SOLUTION=%1%
set BUILD_NUMBER=%2%
set OCTOPACK_PUBLISH_PACKAGE=%3%
set OCTOPUS_API_KEY=%4%
set REVISION=%time:~0,2%%time:~3,2%
set REVISION=%REVISION: =0%

set MAJOR_VERSION=1
set MINOR_VERSION=1

set VERSION_INFO="%MAJOR_VERSION%.%MINOR_VERSION%.*"

if %BUILD_NUMBER% GEQ 0 (
	REM AssemblyFileVersion("%date:~-4,4%.%date:~-7,2%%date:~-10,2%.%time:~0,2%%time:~3,2%.%time:~-5,2%")]
	set VERSION_INFO="%MAJOR_VERSION%.%MINOR_VERSION%.%BUILD_NUMBER%.%REVISION%"
)
echo
echo started build process for %SOLUTION% with version %VERSION_INFO%
echo
echo ------------------------------------------------------------------------
echo

if (%BUILD_NUMBER%) == () (
	echo build number param is missing
	goto build_fail
)

if NOT %BUILD_NUMBER% GEQ 0 (
	echo build number should be greate than ZEMO
	goto build_fail
)

call .\update-assembly-version.cmd %VERSION_INFO%
if %errorlevel% neq 0 goto build_fail

echo ------------------------------------------------------------------------
echo

call .\nuget-package-restore.cmd %SOLUTION%
echo error %ERRORLEVEL%
if %errorlevel% neq 0 goto build_fail

echo ------------------------------------------------------------------------
echo

call .\build.cmd %SOLUTION% %VERSION_INFO% %OCTOPACK_PUBLISH_PACKAGE% %OCTOPUS_API_KEY%
echo error %ERRORLEVEL%
if %errorlevel% neq 0 goto build_fail

echo ------------------------------------------------------------------------
echo

call .\build-package.cmd %VERSION_INFO%
if %errorlevel% neq 0 goto build_fail

echo ------------------------------------------------------------------------
echo

exit /b

:build_fail

echo ------------------------------------------------------------------------
echo ************************** [  BUILD FAILURE  ] *************************
echo ------------------------------------------------------------------------

exit /b %errorlevel%