# PrinterScripts

This will be the repository of scripts I expect to use with my printers.  So far there's
just the one.

## configurationBackup.sh
This script is designed to be called from [incron](http://inotify.aiken.cz/?section=incron&page=about).
It's purpose is to copy the passed file to the backup directory and use git to check the
changed file into a git repository.  

This ensures that the latest version of the configuration file is off the printer as well 
as provide a way back to a previously working configuration.  

#### Dependencies:
* Incron installed.  [walkthrough](https://www.howtoforge.com/tutorial/trigger-commands-on-file-or-directory-changes-with-incron/)
* Directory to copy the configuration files to that can be controlled with git.
	* Be sure git is configured to be able to push the changes to the server without requiring login.
	* I use /usr/local/src/configBackup/<printerName> for mine at the moment.
* Directory to house the script
	* I use `/usr/local/src/configBackup/PrinterScripts`

#### Configuration
1. Use `incrontab -e` to edit the crontab for the current user.  I use root.
2. Add entries for the files you want to backup:
```
/etc/redeem/local.cfg IN_CLOSE_WRITE /usr/local/src/configBackup/PrinterScripts/configurationBackup.sh $@
/home/octo/.octoprint/config.yaml IN_CLOSE_WRITE /usr/local/src/configBackup/PrinterScripts/configurationBackup.sh $@
/home/octo/.octoprint/printerProfiles/_default.profile IN_CLOSE_WRITE /usr/local/src/configBackup/PrinterScripts/configurationBackup.sh $@
```
3. Save the file.  You should see a message in the syslog that the table has changed and it's reloading.

