#!/bin/bash
echo "Waiting for 45 seconds to let the exasol cluster go up"
sleep 45

echo "Connecting to EXASOL and preparing the DB"
./EXAplus-7.0.0/exaplus -c 127.0.0.1:8563 -u sys -p exasol -f exaplus.sql
echo "DONE"