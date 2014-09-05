#!/bin/bash

# Ansible managed 

DUMP_DIR="{{madek_root_dir}}/db/media_files/{{rails_env}}/backups"
DUMP_FILE="${DUMP_DIR}/madek-dump_$(date +%FT%T%Z).pgbin"
LINK="${DUMP_DIR}/latest.pgbin"
mkdir -p ${DUMP_DIR}
pg_dump -E utf-8 -x -F c -d madek_{{rails_env}} -f ${DUMP_FILE}
ln -s -f ${DUMP_FILE} ${LINK}
find ${DUMP_DIR} -name 'madek-dump*pgbin' -type f -mtime +10 -exec rm {} \;
