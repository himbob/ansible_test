#!/bin/bash
if [ $# -eq 0 ]
  then
    echo "No user name arguments supplied: server_prep.sh <username> <key>"
    exit
fi
USER_SSHKEY=$2
USER_USERNAME=$1
echo "$USER_USERNAME"
# get system up to date
apt-get update && apt-get upgrade -y

# change hostname from Linode default
#echo $USER_HOSTNAME > /etc/hostname
#hostname -F /etc/hostname

# add hostname to hosts file so sudo doesn't break
#echo -e "\n$(system_primary_ip)" >> /etc/hosts

# add a non-root user

# add user non-interactively
# TODO: fix default shell
useradd -d "/home/$USER_USERNAME" -m $USER_USERNAME
# add user to correct Ubuntu groups for SSH and sudo
usermod -a -G sudo,ssh $USER_USERNAME
# remove requirement for password to sudo
echo "\n$USER_USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# install SSH key and fix permissions on user SSH keys
USER_HOME="/home/$USER_USERNAME"
mkdir "$USER_HOME/.ssh"
echo $USER_SSHKEY > "$USER_HOME/.ssh/authorized_keys"
chmod 600 "$USER_HOME/.ssh/"
chmod 700 "$USER_HOME/.ssh"
chown -R $USER_USERNAME:$USER_USERNAME "$USER_HOME/.ssh" 

# secure SSH from root login
#sed -e 's/^.*PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config | tee /etc/ssh/sshd_config
#sed -e 's/^.*PasswordAuthentication.*$/PasswordAuthentication no/g' /etc/ssh/sshd_config | tee /etc/ssh/sshd_config

# TODO: add iptables configuration
