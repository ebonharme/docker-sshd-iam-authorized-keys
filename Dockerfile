FROM centos

RUN yum -y install openssh-server openssh-clients groff which rsyslog sudo cronie && \
    ssh-keygen -A && \
    curl -O https://bootstrap.pypa.io/get-pip.py && python get-pip.py && \
    pip install --upgrade awscli
COPY ./sshd_config /etc/ssh/sshd_config
COPY ./*.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/*.sh && ln -s /usr/local/bin/import_users.sh /etc/cron.hourly/

ENTRYPOINT ["docker-entrypoint.sh"]
