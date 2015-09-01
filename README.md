# Ainsey11 Windows Server Backup Script

This script runs windows server bacup to create a system state backup and e-mail you upon finish
# Features
  - E-mail Notification
  - No 3rd party tools used
  - Magic

# Configuration
Set the variables within the script to match your infrastructure. 
  - $source = location to save the backup
  - $logfile = location to save the logfile to, also used to e-mail the results
  - $smtpserver = mail server
  - $smtpport = mail server port
  - $fromemail = e-mail address notification is sent from
  - $toemail = e-mail address notification is sent to

# Installation
Place the backup.ps1 file into C:\Backup  (if folder does not exist, create it)
Open Task scheduler on the server / device to be backed up
Right click and select Import
browse to the "Scheduled Task Settings.xml" File
Adjust as required
right click and run for a trial

##### Disclaimer
I have created this script to aid people to take backups of systems. I will not be held responsible for any data loss or damage caused by this script.Always test scrips in a non-production environment and make sure that you're happy before running on a live system. This is a standard disclaimer I use on all my code.

Thanks!!

Ainsey11
