#!/bin/bash

echo ${MAILNAME:-"example.jp"} > /etc/mailname
if [ ! -z "$MAILHOST" ]; then
  sed -i "s/172.17.41.1/$MAILHOST/" /etc/quickml/quickmlrc
fi
if [ ! -z "$CONFIRM_ML_CREATION" ]; then
  sed -i "s/\(^.*:confirm_ml_creation => \)false\(.*\)$/\1true\2/" /etc/quickml/quickmlrc
fi

mkdir /var/lib/quickml
chown list:list /var/lib/quickml

