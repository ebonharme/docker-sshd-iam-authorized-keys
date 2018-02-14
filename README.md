# Docker SSHd AWS IAM user Authorized Keys

A project demonstrating the use of AWS IAM for ssh login into a docker container, not necessarity running on EC2.

Sets up sshd daemon to authenticate and authorise against AWS IAM user database using ssh public key, creates/deletes local users to match IAM users and keeps updated against IAM on the hour using cron. Logs using rsyslogd

## Usage

```shell
cp .env.dist .env
vi .env  # Set up appropriate values
docker-compose up -d
```

Test with:

```shell
  docker-compose exec sshd bash
  sudo -su nobody
  /usr/local/bin/authorized_keys_command.sh <iam_username>
`
```

Ensure you have uploaded a suible ssh key for a user in the IAM_AUTHORIZED_GROUPS group and:

```shell
ssh -i <private_key> -p 10022 <iam_user>@localhost
```

## To do

Verify functionaliry of assumed role.

## Thanks

<https://cloudonaut.io/manage-aws-ec2-ssh-access-with-iam/>
