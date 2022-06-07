@echo off
IF "%1"=="import" SET type=1
IF "%1"=="export" SET type=2

IF %type%==1 (
    IF NOT EXIST dbDump/kanboardExport.sql (
        ECHO Brak pliku do importu
        goto END
    )
    Echo Rozpoczecie importu bazy
    cmd.exe /c "docker exec -i kanboard_db mysql -uroot -psecret kanboard < dbDump/kanboardExport.sql"
    goto END
)
IF %type%==2 (
    Echo Rozpoczecie eksportu bazy
    cmd.exe /c "docker exec -i kanboard_db mysqldump -uroot -psecret kanboard > dbDump/kanboardExport.sql"
    goto END
)
:END
Echo Zakonczono komende