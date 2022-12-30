@echo off
title Metadata Downloader

yt-dlp %1 --skip-download --write-thumbnail --write-info-json --write-comments -P home:"outputs" -P temp:"..\temp" -o "%%(channel)s\%%(upload_date)s-[%%(title)s]-[%%(id)s].%%(ext)s"

exit