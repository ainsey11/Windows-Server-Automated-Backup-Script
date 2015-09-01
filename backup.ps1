Import-Module ServerManager
Add-WindowsFeature Backup-Features -IncludeAllSubFeature

# Copies the backup folder to destination location specified to archvice the systemstate backup.
$Source = Get-Item (“\\a11-dc-1\SystemStateBackup$”)

wbadmin start systemstatebackup -BackupTarget:$source -quiet  > \\a11-dfs-1\Backup$\%computername%\backuplog.txt


# Set up variables
$SmtpServer = "mailserver"
$SmtpPort = 25
$FromEmail = "DC.Backups@mail.domain.co.uk"
$ToEmail = "DC.Backups@mail.domain.co.uk"
$OutputFile = "\\a11-dfs-1\Backup$\%computername%\backuplog.txt"

# Create backup results file
#add-pssnapin windows.serverbackup
#$NextBackup = Get-Date (Get-WBSummary | select "NextBackupTime" | ft -hide | out-string)
#$LastBackup = (Get-Date $NextBackup) - (New-TimeSpan -day 1)
#Get-WinEvent -LogName "Microsoft-Windows-Backup" | Where {$_.timecreated -ge $LastBackup} | Sort-Object TimeCreated | Format-Table TimeCreated, Message -AutoSize -Wrap | Out-File $OutputFile

# Construct and send email
$SmtpClient = new-object system.net.mail.smtpClient
$Msg = new-object Net.Mail.MailMessage
$SmtpClient.host = $SmtpServer
$SmtpClient.Port = $SmtpPort
$computer = gc env:computername
$Msg.From = $FromEmail
$Msg.To.Add($ToEmail)
$Msg.Subject = "## Backup Complete on " +$Computer +" ##"
$Msg.Body = "The backup for " +$Computer+" has completed. Please see the attached file for backup results."
$Msg.Attachments.Add($OutputFile)
$SmtpClient.Send($Msg)