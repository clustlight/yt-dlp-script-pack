@echo off
title Chat Downloader

yt-dlp %1 --skip-download --write-subs --sub-langs live_chat --console-title -P home:"outputs" -P temp:"..\temp" -o "%%(channel)s\%%(upload_date)s-[%%(title)s]-[%%(id)s].%%(ext)s"

exit