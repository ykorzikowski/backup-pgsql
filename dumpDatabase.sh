#!/bin/bash

DUMP_FILE_NAME="${FILE_NAME_PREFIX}backupOn`date +%Y-%m-%d-%H-%M`.dump"
echo "Creating dump: $DUMP_FILE_NAME"

cd /pg_backup

pg_dump -C -w -b -F c > "$DUMP_FILE_NAME"

if [ $? -ne 0 ]; then
  rm "$DUMP_FILE_NAME"
  echo "Back up not created, check db connection settings"
  exit 1
fi

echo 'Successfully Backed Up'
exit 0
