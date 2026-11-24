#!/bin/bash

echo "================================"
echo "     ShipIt Sprint Status"
echo "================================"

echo "Date: $(date)"
echo ""

echo "Nginx Status:"
systemctl is-active nginx

echo ""
echo "Node.js API Status:"
systemctl is-active shipit-sprint-api

echo ""
echo "Website Status:"
curl -k -s -o /dev/null -w "%{http_code}\n" https://shipit-sprint.duckdns.org

echo "================================"
