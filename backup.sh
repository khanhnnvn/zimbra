#khanhnn
#email: khanhnnvn@gmail.com
today=$(date +"%d-%m-%Y")
firstday=$(date --date="4 days ago" +"%d-%m-%Y")
backup_dir=/opt/backup/zimbra
echo "Backup started at `date`."
echo "Stopping the Zimbra services..."
/etc/init.d/zimbra stop
echo "Check file backup to day"
        if [ -f zimbra-backup-$today.tar.gz ]
        then
        rm -rf zimbra-backup-$today.tar.gz && echo "Dang xoa ban trung lap ..."
        else
                echo "Khong co ban trung lap nao"
        fi
echo "Tien hanh backup"
tar zcvf $backup_dir/zimbra-backup-$today.tar.gz /opt/zimbra/ 2&> /dev/null
echo "backup thanh cong"
echo "Starting the Zimbra services..."
echo "Started at `date`."
/etc/init.d/zimbra start
echo "Go to backup folder"
cd /opt/backup/zimbra
echo "List file backup zimbra will be delete"
#ls -al zimbra-backup-$firstday.tar.gz
if [ -f zimbra-backup-$firstday.tar.gz ]
then
rm -rf zimbra-backup-$firstday.tar.gz
echo "Da xoa phien ban cu"
else
echo "Khong ton tai file nao"
fi
echo "Zimbra backed up to $backup_dir/zimbra-backup-$today.tar.gz"
echo "Backup ended at `date`."
