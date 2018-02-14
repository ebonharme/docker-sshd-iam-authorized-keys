#!/bin/bash

# Start logging
/usr/sbin/rsyslogd

# Import IAM users
import_users.sh

set -e

# Set up env vars for authorized_keys_command.sh

echo export IAM_AUTHORIZED_GROUPS="${IAM_AUTHORIZED_GROUPS}" > /etc/aws-ec2-ssh.conf
echo export LOCAL_MARKER_GROUP="${LOCAL_MARKER_GROUP}" >> /etc/aws-ec2-ssh.conf
echo export LOCAL_GROUPS="${LOCAL_GROUPS}" >> /etc/aws-ec2-ssh.conf
echo export SUDOERS_GROUPS="${SUDOERS_GROUPS}" >> /etc/aws-ec2-ssh.conf
echo export ASSUMEROLE="${ASSUMEROLE}" >> /etc/aws-ec2-ssh.conf
echo export DONOTSYNC=${DONOTSYNC=0} >> /etc/aws-ec2-ssh.conf
echo export AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}" >> /etc/aws-ec2-ssh.conf
echo export AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}" >> /etc/aws-ec2-ssh.conf
echo export AWS_DEFAULT_REGION=eu-west-1 >> /etc/aws-ec2-ssh.conf

# Start cron daemon
/usr/sbin/crond

# Start ssh daemon with any flags (e.g. -d) passed as a docker command

exec /usr/sbin/sshd -D $@
