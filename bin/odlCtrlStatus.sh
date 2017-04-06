#!/bin/bash

odlPid=$($(dirname $(readlink -f "$0"))/odlCtrlFindPid.sh)
if (( $? == 0 )); then
    echo -n "${odlPid}"
    # jetty listening on 8181
    ports=$(netstat -lnpt 2> /dev/null| grep -c -E ':8181 .+ LISTEN .+java')
    for (( i=0; i<${ports}; i++ )); do
        echo -n '^'
    done

    # karaf listening on 8101
    ports=$(netstat -lnpt 2> /dev/null| grep -c -E ':8101 .+ LISTEN .+java')
    for (( i=0; i<${ports}; i++ )); do
        echo -n 'k'
    done

    # ofjava listening on 6633/6653
    ports=$(netstat -lnpt 2> /dev/null| grep -c -E ':66[53]3 .+ LISTEN .+java')
    for (( i=0; i<${ports}; i++ )); do
        echo -n '+'
    done

    # sxp listening on 64999
    ports=$(netstat -lnpt 2> /dev/null| grep -c -E ':64999 .+ LISTEN .+java')
    for (( i=0; i<${ports}; i++ )); do
        echo -n 's'
    done
fi
