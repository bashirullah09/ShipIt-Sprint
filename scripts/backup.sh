#!/bin/bash

SOURCE="/var/www/shipit-sprint/site"
BACKUP_DIR="/home/deploy/backups"
DATE=$(date +%Y-%m-%d_%H-%M-%S)

BACKUP_FILE="$BACKUP_DIR/website-$DATE.tar.gz"

echo "Starting ShipIt Sprint backup..."

tar -czf "$BACKUP_FILE" -C "$SOURCE" .

if [ $? -eq 0 ]; then
    echo "Backup successful!"
    echo "Backup saved at: $BACKUP_FILE"
else
    echo "Backup failed!"
    exit 1
fi

echo "Keeping latest 5 backups..."

ls -1t "$BACKUP_DIR"/website-*.tar.gz 2>/dev/null | tail -n +6 | xargs -r rm --

echo "Backup process completed."
