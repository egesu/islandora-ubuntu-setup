#!/bin/bash


MYSQL=`which mysql`
$MYSQL -uroot -p$DB_ROOT_PASSWORD -e "$SQL"

# Add a mysql backup script

#if [ ! -d /root/bin ]; then
#    mkdir -p /root/bin
#fi

#echo -e '#!/bin/bash\n#\n# Dumps all MySQL databases and removes backups older than 1 week\n# With optional scp to another host\n\nBackupFolder=/dbbackups\nMySQLUser=root\nMySQLPass=PASSWORD\n# These next few are just used for scp, which is optional if DO_SCP != yes\nDO_SCP=no\nREMOVE_LOCAL_COPY=no\nFOLDER=dbBACK/mysql-newdb\nBACKUP_USER=backupuser\nBACKUP_HOST=backuppass\n\nDATE=$(date +%Y%m%d)\nOLDDATE=$(date +%Y%m%d -d ' 7 days ago')\n\nif [ ! -d "$BackupFolder" ]; then\n        mkdir -p "$BackupFolder"\n        if [ $? -gt 0 ]; then\n                echo "ERROR: Could not create $BackupFolder"\n                exit 1\n        fi\nfi\n\nfor dbname in $(mysql --user="$MySQLUser" --password="$MySQLPass" -Bse "show databases"); do\n  rm -f "$BackupFolder/$dbname-$OLDDATE.bz2"\n  DumpName="$BackupFolder/$dbname-$DATE.bz2"\n  mysqldump --user="$MySQLUser" --password="$MySQLPass" --opt "$dbname" | bzip2 -9 >"$DumpName"\n  if [ $? -gt 0 ]; then\n        echo "Backup of $dbname failed! (mysqldump)"\n  else\n        if [ "$DO_SCP" == 'yes' ]; then\n            scp -B -o StrictHostKeyChecking=no "$DumpName" "$BACKUP_USER"@"$BACKUP_HOST":"$FOLDER/"\n            if [ $? -gt 0 ]; then\n                echo "Backup of $dbname failed! (scp)"\n            fi\n            if [ "$REMOVE_LOCAL_COPY" == 'yes' ]; then\n                rm -f "$DumpName"\n            fi\n        fi\n  fi\ndone\n' > /root/bin/mysqlBackup.sh && chmod a+x

#sed -i "s|PASSWORD|$DB_ROOT_PASSWORD|g" /root/bin/mysqlBackup.sh
