@echo off
chcp 65001 > nul

IF EXIST .\yt-dlp.exe (
    ECHO [Warning] 既にリソースがダウンロードされている可能性があります。セットアップを続行しますか？ [y/n]

    :LOOP
    CHOICE /C YN /N
    IF ERRORLEVEL 2 (
        echo [Info] セットアップをキャンセルしました。
        pause
        exit
    )
)

echo [Info] (1/3) ffmpegをダウンロードします
timeout 3
bitsadmin /transfer "ffmpeg" /priority FOREGROUND https://github.com/yt-dlp/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl-shared.zip %~dp0/ffmpeg-build.zip
timeout 1
echo [Info] (2/3) ffmpegを解凍します
call powershell -command "Expand-Archive ffmpeg-build.zip"
del /Q ffmpeg-build.zip

move .\ffmpeg-build\ffmpeg-master-latest-win64-gpl-shared\bin\* . > nul
rmdir /Q /S ffmpeg-build

echo [Info] (3/3) yt-dlp.exeをダウンロードします
timeout 3
bitsadmin /transfer "yt-dlp" /priority FOREGROUND https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe %~dp0/yt-dlp.exe


echo [Info] セットアップ完了
pause
exit
