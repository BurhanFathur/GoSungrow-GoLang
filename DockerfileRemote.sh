#!/bin/bash

mkdir -p /usr/local/bin

wget -O /usr/local/bin/GoSungrow --header "PRIVATE-TOKEN: ${GO_REPO_TOKEN}" https://mickmake.io/api/v4/projects/docker%2Fsungro/repository/files/dist%2FGoSungrow_linux_amd64%2FGoSungrow/raw?ref=master
chmod a+x /usr/local/bin/GoSungrow

mkdir -p /root/.ssh
chmod 500 /root/.ssh

wget -O /root/.ssh/gosungro_rsa --header "PRIVATE-TOKEN: ${GO_REPO_TOKEN}" https://mickmake.io/api/v4/projects/docker%2Fsungro/repository/files/.ssh%2Fgosungro_rsa/raw?ref=master
wget -O /root/.ssh/gosungro_rsa.pub --header "PRIVATE-TOKEN: ${GO_REPO_TOKEN}" https://mickmake.io/api/v4/projects/docker%2Fsungro/repository/files/.ssh%2Fgosungro_rsa.pub/raw?ref=master

chmod 400 /root/.ssh/gosungro_rsa /root/.ssh/gosungro_rsa.pub

echo '00 07  *  *  *    /usr/local/bin/GoSungrow sync default' > /etc/crontabs/root

apk add --no-cache colordiff tzdata

