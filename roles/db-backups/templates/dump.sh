#!/bin/bash

# Ansible managed 

DUMP_DIR="{{madek_root_dir}}/db/media_files/{{rails_env}}/backups"
DUMP_FILE_NAME="madek-dump_$(date +%FT%T%Z).pgbin"
DUMP_FILE="${DUMP_DIR}/${DUMP_FILE_NAME}"
LINK_NAME="latest.pgbin"
LINK="${DUMP_DIR}/${LINK_NAME}"
mkdir -p ${DUMP_DIR}
pg_dump -E utf-8 -x -F c -d madek_{{rails_env}} -f ${DUMP_FILE}
find ${DUMP_DIR} -name 'madek-dump*pgbin' -type f -mtime +10 -exec rm {} \;
cd ${DUMP_DIR} && ln -s -f ${DUMP_FILE_NAME} ${LINK_NAME}
