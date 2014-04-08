#!/bin/bash

case $1 in
    config)
        echo 'graph_title RTMP Clients'
        echo 'graph_vlabel Clients'
        echo 'offrecord_clients.label Offrecord Clients'
        echo 'record_clients.label Record Clients'
        ;;
    *)
        NCLIENTS=`curl -s http://localhost:8080/stat | xpath -q -e '//live/nclients' | grep nclients | sed 's/.*\([0-9]\+\).*/\1/'`
        echo -n 'offrecord_clients.value '
        echo $NCLIENTS | cut -f 1 -d ' '
        echo -n 'record_clients.value '
        echo $NCLIENTS | cut -f 2 -d ' '
esac
