#!/bin/bash

LOG_FILE="/var/log/nginx/access.log"

echo "================================"
echo " ShipIt Sprint Traffic Report"
echo "================================"

echo "Date: $(date)"
echo ""

echo "Total Requests:"
sudo wc -l < "$LOG_FILE"

echo ""
echo "Top 5 Requested Pages:"
sudo awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5

echo ""
echo "Top 5 Visitor IP Addresses:"
sudo awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5

echo "================================"
