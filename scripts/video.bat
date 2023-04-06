@echo off
title Video Downloader

.\bin\yt-dlp %1 --live-from-start -N 3 --audio-multistreams --video-multistreams --console-title -P home:"outputs" -P temp:"..\temp" -o "%%(channel)s\%%(upload_date)s-[%%(title)s]-[%%(id)s].%%(ext)s"

exit