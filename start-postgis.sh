#!/bin/bash

chown -R postgres:postgres /snapshot
chmod -R 0700 /snapshot
ls -lAF
su postgres -c "whoami"
su postgres -c "/usr/lib/postgresql/9.5/bin/postgres -D conf"
#su postgres -c "psql compose -c 'ALTER EXTENSION postgis UPDATE;'"
