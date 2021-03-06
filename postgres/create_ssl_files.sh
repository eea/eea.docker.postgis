#!/bin/bash
set -e

mkdir -p /var/ssl
rm -f /var/ssl/*

echo "creating ssl certificates"

cp /ssl/server.crt /var/ssl/server.crt
cp /ssl/server.key /var/ssl/server.key
cp /ssl/chain.crt /var/ssl/root.crt

chown -R postgres.postgres /var/ssl
chmod 600 /var/ssl/*
