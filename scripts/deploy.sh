#!/bin/bash

SOURCE="/home/deploy/ShipIt-Sprint/site"
DEST="/var/www/shipit-sprint/site"

echo "Starting ShipIt Sprint deployment..."

if [ ! -d "$SOURCE" ]; then
    echo "Source directory not found!"
    exit 1
fi

sudo rsync -av --delete "$SOURCE/" "$DEST/"

if [ $? -eq 0 ]; then
    echo "Deployment successful!"
else
    echo "Deployment failed!"
    exit 1
fi
