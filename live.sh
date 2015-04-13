#!/bin/bash

echo -n "Checking environment.. "

if [[ $STAGE == "live" && ! -f /.live ]]; then
    touch /.live
    echo "LIVE"

    rm -rf /etc/nullmailer && mv /etc/nullmailer.live /etc/nullmailer
    rsyslogd
    /etc/init.d/nullmailer start
else
    echo "not live (or already initialized)"
fi
