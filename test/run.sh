#!/bin/bash

set -ev

CURRENT_DIR="$(dirname "$(readlink -f "$0")")"

sqlplus ${DB_USER}/${DB_PASS} @${CURRENT_DIR}/run.sql
