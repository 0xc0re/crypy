@echo off
setx GPU_FORCE_64BIT_PTR 0
setx GPU_MAX_HEAP_SIZE 100
setx GPU_USE_SYNC_OBJECTS 1
setx GPU_MAX_ALLOC_PERCENT 100
setx GPU_SINGLE_ALLOC_PERCENT 100

set "miner_address=YOUR_ETHEREUM_ADDRESS"
set "worker_name=ANY_WORKER_NAME"

REM primary and backup pools (ssl)
set "primary_pool=us1.ethermine.org:5555"
set "backup_pool=us2.ethermine.org:5555"

REM Report hashrate to pool, verbosity level 3, display every 5 seconds, enable hardware monitoring
set "options=-R -v 3 --display-interval 5 --HWMON 1"

set executable=%~dp0\nsfminer.exe
set commandline= %options% -P stratum1+ssl://%miner_address%.%worker_name%@%primary_pool% -P stratum1+ssl://%miner_address%.%worker_name%@%backup_pool%

%executable% %commandline%
