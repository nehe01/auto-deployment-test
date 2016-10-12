@echo off

set solution=%1%
set nuget_exe=.\src\.nuget\nuget.exe
set nuget_params=restore -verbosity quiet 

echo restoring nuget packages... .. .
%nuget_exe% %nuget_params% %solution%
echo done