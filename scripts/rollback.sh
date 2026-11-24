#!/bin/bash

BACKUP_DIR="/home/deploy/backups"
SITE_DIR="/var/www/shipit-sprint/site"
LATEST_BACKUP=$(ls -1t "$BACKUP_DIR"/website-*.tar.gz 2>/dev/null | head -n 1)

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo."
    exit 1
fi

if [ -z "$LATEST_BACKUP" ]; then
    echo "No backup found!"
    exit 1
fi

TEMP_DIR=$(mktemp -d)

echo "Restoring from: $LATEST_BACKUP"

if tar -xzf "$LATEST_BACKUP" -C "$TEMP_DIR"; then
    mv "$SITE_DIR" "${SITE_DIR}-before-rollback-$(date +%Y%m%d%H%M%S)"
    mv "$TEMP_DIR" "$SITE_DIR"
    chown -R www-data:www-data "$SITE_DIR"

    echo "Rollback successful!"
else
    echo "Rollback failed!"
    rm -rf "$TEMP_DIR"
    exit 1
fi
