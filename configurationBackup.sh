#!/bin/bash

# get the configuration
. /etc/configBackup.conf

for aFile in ${FILES[@]};
	cp ${aFile} ${BACKUPDIR}
done
cd ${BACKUPDIR}
git add .
git commit -m "$COMMITMSG"
git push origin printer
