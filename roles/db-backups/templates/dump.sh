#!/bin/bash

# Ansible managed 

DUMP_DIR="{{madek_root_dir}}/db/media_files/{{rails_env}}/backups"
DUMP_FILE_NAME="madek-dump_$(date +%FT%T%Z).pgbin"
DUMP_FILE="${DUMP_DIR}/${DUMP_FILE_NAME}"
LINK_NAME="latest.pgbin"
LINK="${DUMP_DIR}/${LINK_NAME}"
mkdir -p ${DUMP_DIR}
pg_dump -F c -x -O -f ${DUMP_FILE} madek_{{rails_env}} 
find ${DUMP_DIR} -name 'madek-dump*pgbin' -type f -mtime +10 -exec rm {} \;
cd ${DUMP_DIR} && ln -s -f ${DUMP_FILE_NAME} ${LINK_NAME}
