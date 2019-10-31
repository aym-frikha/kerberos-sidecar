#Download base image ubuntu 18.04
FROM ubuntu:18.04

# Update Ubuntu Software repository
RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt install  -y krb5-user libpam-krb5 && \
mkdir /krb5 && chmod 755 /krb5

# add resources, the kinit script and the default krb5 configuration
ADD rekinit.sh /
ADD krb5.conf /etc/krb5.conf

# configure the exported volumes
# /krb5 - default keytab location
# /dev/shm - shared memory location used to write token cache
# /etc/krb5.conf.d - directory for additional kerberos configuration
VOLUME ["/krb5","/dev/shm","/etc/krb5.conf.d"]
ENTRYPOINT ["/rekinit.sh"]
