CLS
@ECHO off
COLOR 70
MODE CON COLS=70 LINES=20
IF /I "%1" == "" (
    SET NoBackup=/passive /norestart
    SET NoBackup_Comment=^(�N�ƥ��t����^)
) ELSE (
    IF /I "%1" == "/NoBackup" (
        SET NoBackup=/passive /norestart /nobackup
	SET NoBackup_Comment=^(���ƥ��t����^)
           ) ELSE (
              IF /I "%1" == "/?" GOTO help
              IF /I "%1" == "/help" GOTO help
        ECHO �L�Ī��Ѽ� - "%1".
	ECHO.
	GOTO Help
    )
)
ECHO.
ECHO ------------------------------------------------------------------
ECHO   �H�U�N�۰ʦw�˪��n�� (Update to 2012/01)
ECHO   1. Windows XP SP3 ���᪺�Ҧ��ץ���%NoBackup_Comment%
ECHO   2. Windows Internet Explorer 8 ���᪺�Ҧ��ץ���%NoBackup_Comment%
ECHO   3. Windows Media Player 11 ���᪺�Ҧ��ץ���%NoBackup_Comment%
ECHO.
ECHO                                           ��s����G2012/02/28
ECHO ------------------------------------------------------------------
ECHO.
ECHO   1. ���b�w�� Windows XP SP3 ���᪺�Ҧ��ץ��ɡA�еy��...
ECHO      �u���b�w�� HotFix Type 1�A�еy��...
FOR %%i in (wxpsp3\hotfix1\Windows*.exe) do start /wait %%i %NoBackup%
ECHO      �u���b�w�� HotFix Type 2�A�еy��...
FOR %%i in (wxpsp3\hotfix2\*.exe) do start /wait %%i /Q:U /R:N
ECHO      �u���b�w�� HotFix Type 3�A�еy��...
FOR %%i in (wxpsp3\hotfix3\*.exe) do start /wait %%i %NoBackup%
FOR %%i in (wxpsp3\hotfix3\*.msi) do start /wait %%i /passive /norestart
ECHO      �u���b�w�� HotFix Type 4�A�еy��...
FOR %%i in (wxpsp3\hotfix4\*.exe) do start /wait %%i /Q
ECHO      �u���b�w�� Microsoft Update ����A�еy��...
xcopy wxpsp3\hotfix5\muweb.dll %SystemRoot%\System32\ /y > nul
start /wait regsvr32 /s muweb.dll
start /wait wxpsp3\hotfix5\wuSETup.exe /quiet /norestart
ECHO      �w�˧����C
ECHO.
ECHO   2. ���b�w�� Windows Internet Explorer 8 ���᪺�Ҧ��ץ��ɡA�еy��..
ECHO      �u���b�w�� HotFix Type 1�A�еy��...
FOR %%i in (ie8\hotfix1\*.exe) do start /wait %%i %NoBackup%
ECHO      �u���b�w�� HotFix Type 2�A�еy��...
FOR %%i in (ie8\hotfix2\*.exe) do start /wait %%i %NoBackup%
ECHO      �u���b�w�� HotFix Type 3�A�еy��...
FOR %%i in (ie8\hotfix3\*.exe) do start /wait %%i %NoBackup%
ECHO      �w�˧����C
ECHO.
ECHO   2. ���b�w�� Windows Media Player 11 ���᪺�Ҧ��ץ��ɡA�еy��..
ECHO      �u���b�w�� HotFix Type 1�A�еy��...
FOR %%i in (wmp11\hotfix1\*.exe) do start /wait %%i %NoBackup%
ECHO      �u���b�w�� HotFix Type 2�A�еy��...
FOR %%i in (wmp11\hotfix2\*.exe) do start /wait %%i %NoBackup%
ECHO      �w�˧����C
ECHO.
GOTO End

:Help
ECHO.
ECHO HOTFIX [/NoBackup ^| /Help]
ECHO.
ECHO    hotfix.cmd �i�ΰѼơG
ECHO      �L              �w�˭ץ��ɮɡA�N�ƥ��t���ɮסA�i�Ѳ����ץ��ɡC
ECHO      /NoBackup       �w�˭ץ��ɮɡA���ƥ��t���ɮסA���i�����ץ��ɡC
ECHO      /Help           ��ܥ�������T�C
ECHO.
ECHO.
ECHO    �Ы����N�����������C
PAUSE
GOTO end

:End
EXIT

