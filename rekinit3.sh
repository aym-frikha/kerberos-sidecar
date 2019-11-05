#!/bin/bash

[ -z  "$PERIOD_SECONDS"   ] && PERIOD_SECONDS=3600

CREDENTIALS_FILE=/dev/shm/creds



while true
do

   while [ ! -e $CREDENTIALS_FILE ]
   do
     echo "Credential file is not present"
     sleep 2
   done

   USER=`cat $CREDENTIALS_FILE | sed -n '1p'`
    
   PASSWORD=`cat $CREDENTIALS_FILE | sed -n '2p'`

   # report to stdout the time the kinit was being run
   echo "*** kinit at "+$(date -I)

   # run kinit with passed options, note APPEND_OPTIONS allows for
   # additional parameters to be configured. The verbose option is always set
   echo '$PASSWORD'|  kinit $USER


   # sleep for the defined period, then repeat
   echo "*** Waiting for $PERIOD_SECONDS seconds"
   sleep $PERIOD_SECONDS
done
