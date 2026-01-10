@echo off
title Full Archive Script Ver1.1.1
chcp 65001 > nul

set /p MODE="動作モード (1: フル, 2: 動画のみ, 3: メタデータのみ, 4: チャットのみ):  "

set /p URL="URL: "

IF "%MODE%"=="" (
    set MODE=1
)

IF /i {%MODE%}=={1} (goto :no1)
IF /i {%MODE%}=={2} (goto :no2)
IF /i {%MODE%}=={3} (goto :no3)
IF /i {%MODE%}=={4} (goto :no4)

echo "エラー: 動作モードの設定が正しくありません"
pause
exit

:no1
	start %~dp0\scripts\chat.bat "%URL%"
	start %~dp0\scripts\meta.bat "%URL%"
	start %~dp0\scripts\video.bat "%URL%"
	exit

:no2
	start %~dp0\scripts\video.bat "%URL%"
	exit

:no3
	start %~dp0\scripts\meta.bat "%URL%"
	exit

:no4
	start %~dp0\scripts\chat.bat "%URL%"
	exit
