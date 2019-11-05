#!/bin/bash

[ -z  "$PERIOD_SECONDS"   ] && PERIOD_SECONDS=3600

KEYTAB_FILE=/krb5/krb5.keytab


while [ ! -e $KEYTAB_FILE ]
do
  sleep 2
done
ls -l $KEYTAB_FILE

while true
do
# report to stdout the time the kinit was being run
echo "*** kinit at "+$(date -I)

# run kinit with passed options, note APPEND_OPTIONS allows for
# additional parameters to be configured. The verbose option is always set
kinit Administrator@EXAMPLE.COM -k -t $KEYTAB_FILE


# sleep for the defined period, then repeat
echo "*** Waiting for $PERIOD_SECONDS seconds"
sleep $PERIOD_SECONDS
done
