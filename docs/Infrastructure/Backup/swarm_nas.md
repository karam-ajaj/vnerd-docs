---
comments: true
---

# Swarm files Backup (NAS)

## backup location on NAS:
/share/files/bkp/swarm-bkp

## Instructions:
#### 1. Generate ssh key to autontiacate with nas01 without password
on local machin (pxsw01)
```
ssh-keygen
```
#### 2. copy id to nas01
```
ssh-copy-id -i ~/.ssh/id_rsa.pub -p 1234 admin@10.10.10.210
```
#### 3. use rsync to copy files one time
```
rsync -arvz -e 'ssh -p 1234' /swarm/ admin@10.10.10.210:/share/files/bkp/swarm-bkp/
```
#### 4. create a script to be added to the cronjob
This script use rsync to copy the files via ssh to NAS01 and then run again to check the files status
It creates a message to be send to a discord channel using a webhook
```
root@pxsw01:~# cat backup-script.sh
#!/bin/bash

rsync -arvz -e 'ssh -p 1234' /swarm/ admin@10.10.10.210:/share/files/bkp/swarm-bkp/

## check difference between folders
# diff <(ssh -p 1234 admin@10.10.10.210 ls -R /share/files/bkp/swarm-bkp) <(ls -R /swarm)
diff=$(rsync --dry-run -arvz -e 'ssh -p 1234' /swarm/ admin@10.10.10.210:/share/files/bkp/swarm-bkp/)
line=$(echo -e "\n")
message="rsync backup from pxsw01 to nas01 is done!"
result="$message$line$diff"

## format to parse to curl
## echo Sending message: $message
msg_content=\"$result\"

## discord webhook
url='https://discordapp.com/api/webhooks/1318572325590798386/eL78nqy0O8h2CZQ0oKh8tnM00CqROXr1-2jpkHmrQeoQVwQQQP3KaSGpSgIAdspJeMR
b'
curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_content}" $url
```

#### 5. edit permissions and test run
```
root@pxsw01:~# chmod +x backup-script.sh
root@pxsw01:~# ./backup-script.sh
```
#### 6. install crontab
```
root@pxsw01:~# apt-get install cron
```
#### 7. create a cronjob, it will be scheduled everyday at 03:00
```
root@pxsw01:~# crontab -e

append the following
0 03 * * * /backup-script.sh

list cronjobs
crontab -l
```