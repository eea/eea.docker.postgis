#!/bin/bash
set -e

sh /create_ssl_files.sh

exec /docker-entrypoint.sh "$@"
