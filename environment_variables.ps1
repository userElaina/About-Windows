echo "Please run this script in PowerShell as Administrator."
[Environment]::SetEnvironmentVariable('JAVA_TOOL_OPTIONS', "-Duser.language=en -Dfile.encoding=UTF-8",'Machine');
[Environment]::SetEnvironmentVariable('OPENCV_PATH', "$Env:MY_PATH\OpenCV460",'Machine');
$oldPath = [Environment]::GetEnvironmentVariable('PATH', 'Machine');
$newPath = "$Env:MY_PATH\cmake\bin;$Env:MY_PATH\ffmpeg\bin;$Env:MY_PATH\GnuWin;$Env:MY_PATH\ImageMagick;$Env:MY_PATH\LLVM\bin;$Env:MY_PATH\Lua\bin;$Env:MY_PATH\myself;$Env:MY_PATH\Pandoc;$Env:OPENCV_PATH\x64\mingw\bin"
[Environment]::SetEnvironmentVariable('PATH', "$oldPath;$newPath",'Machine');
pause
