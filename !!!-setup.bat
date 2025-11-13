@echo off
chcp 65001 > nul

where curl > nul 2>&1
set "curlExists=%errorlevel%"

mkdir bin
cd bin

IF exist .\yt-dlp.exe (
    echo [Warning] 既にリソースがダウンロードされている可能性があります。セットアップを続行しますか？ [y/n]

    :loop
    choice /C YN /N
    IF errorlevel 2 (
        echo [Info] セットアップをキャンセルしました。
        pause
        exit
    )
)

echo [Info] yt-dlpのセットアップを開始します
timeout 3

echo [Info] (1/5) ffmpegをダウンロードします

if %curlExists% equ 0 (
    curl -L -o %~dp0/bin/ffmpeg-build.zip https://github.com/yt-dlp/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl-shared.zip
) else (
    bitsadmin /transfer "ffmpeg" /priority FOREGROUND https://github.com/yt-dlp/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl-shared.zip %~dp0/bin/ffmpeg-build.zip
)

echo [Info] (2/5) ffmpegを解凍します
call powershell -command "Expand-Archive ffmpeg-build.zip"
del /Q ffmpeg-build.zip

move .\ffmpeg-build\ffmpeg-master-latest-win64-gpl-shared\bin\* . > nul
rmdir /Q /S ffmpeg-build

echo [Info] (3/5) denoをダウンロードします

if %curlExists% equ 0 (
    curl -L -o %~dp0/bin/deno.zip https://github.com/denoland/deno/releases/latest/download/deno-x86_64-pc-windows-msvc.zip
) else (
    bitsadmin /transfer "deno" /priority FOREGROUND https://github.com/denoland/deno/releases/latest/download/deno-x86_64-pc-windows-msvc.zip %~dp0/bin/deno.zip
)


echo [Info] (4/5) denoを解凍します
call powershell -command "Expand-Archive deno.zip"
del /Q deno.zip

move .\deno\* . > nul
rmdir /Q /S deno

echo [Info] (5/5) yt-dlp.exeをダウンロードします

if %curlExists% equ 0 (
    curl -L -o %~dp0/bin/yt-dlp.exe https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe
) else (
    bitsadmin /transfer "yt-dlp" /priority FOREGROUND https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe %~dp0/bin/yt-dlp.exe
)


echo [Info] セットアップ完了
pause
exit
