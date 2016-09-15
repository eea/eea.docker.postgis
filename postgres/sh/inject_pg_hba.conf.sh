#!/bin/bash
set -e

rm -f /var/lib/postgresql/data/pg_hba.conf
#cp /pg_hba.conf /var/lib/postgresql/data/pg_hba.conf

echo "$PG_HBA" >> /var/lib/postgresql/data/pg_hba.conf
