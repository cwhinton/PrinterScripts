# PrinterScripts

This will be the repository of scripts I expect to use with my printers.  So far there's
just the one.

## configurationBackup.sh
This script is designed to be called from [incron](http://inotify.aiken.cz/?section=incron&page=about).
It's purpose is to copy the passed file to the backup directory and use git to check the
changed file into a git repository.  

This ensures that the latest version of the configuration file is off the printer as well 
as provide a way back to a previously working configuration.  

Dependencies:
* Incron installed.  [walkthrough](https://www.howtoforge.com/tutorial/trigger-commands-on-file-or-directory-changes-with-incron/)
