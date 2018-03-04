#!/bin/bash

# get the configuration
. /etc/configBackup.conf

cp "$1" ${BACKUPDIR}

cd ${BACKUPDIR}
git add .
git commit -m "$COMMITMSG"
git push origin printer
