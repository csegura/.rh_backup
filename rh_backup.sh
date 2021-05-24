#!/bin/sh
RH_BACKUP_DIR="$HOME/.rh_backup"
BACKUP_DIR="$HOME/.rh_backup"

$RH_BACKUP_DIR/rh_backup_run.sh
#cd $BACKUP_DIR && git add -A && git commit -m "RH Backup on `date +'%Y-%m-%d %H:%M:%S'`" && git push
