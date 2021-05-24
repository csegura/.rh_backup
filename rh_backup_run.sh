#!/bin/bash
DATE=$(date +%d-%m-%Y)
RH_BACKUP_DIR="$HOME/.rh_backup"
BACKUP_DIR="$HOME/.rh_backups"

# Compress
tar -zcvpf $BACKUP_DIR/backup-$DATE.tar.gz --files-from $RH_BACKUP_DIR/rh_backup_include --exclude-from  $RH_BACKUP_DIR/rh_backup_exclude

# Delete files older than 7 days
find $BACKUP_DIR/* -mtime +7 -exec git rm {} \;