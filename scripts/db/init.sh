#!/bin/bash

# Extend the location of mysql command in path
export PATH=$PATH:/usr/local/mysql/bin/
# Execute the SQL file in $2 db via $1 user
mysql -u $1 -p $2 < ./scripts/db/init.sql