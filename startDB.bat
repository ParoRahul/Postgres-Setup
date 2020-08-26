set DATADIR=D:\database\pgdb\dbData
set LOGDIR=D:\database\pgdb\dbLog

call C:\Users\user\AppData\Roaming\pgsql\bin\pg_ctl.exe  start -D %DATADIR% -l %LOGDIR%