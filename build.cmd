@echo off

set solution=%1%
set VERSION_INFO=%2%
set OCTOPACK_PUBLISH_PACKAGE=%3%
set OCTOPUS_API_KEY=%4%

set FrameworkVersion=v4.0.30319
set FrameworkDir=%SystemRoot%\Microsoft.NET\Framework

if exist "%SystemRoot%\Microsoft.NET\Framework64" (
  set FrameworkDir=%SystemRoot%\Microsoft.NET\Framework64
)

set msbuild_exe="%FrameworkDir%\%FrameworkVersion%\msbuild.exe"
set msbuild_params=/p:Configuration=Release /t:Clean;Rebuild /verbosity:normal /nologo 

echo build the solution... .. .
%msbuild_exe% %msbuildparams% %solution% /p:RunOctoPack=true /p:OctoPackPackageVersion=%VERSION_INFO% /p:OctoPackPublishPackageToHttp=%OCTOPACK_PUBLISH_PACKAGE% /p:OctoPackPublishApiKey=%OCTOPUS_API_KEY%