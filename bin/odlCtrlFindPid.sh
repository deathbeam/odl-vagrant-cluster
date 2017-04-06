#!/bin/bash

odlPid=$(pgrep -f 'java.+org.(eclipse.equinox.launcher.Main|apache.karaf)')
if (( $? != 0 )); then
    echo "n/a" >&2
    exit 1
fi
echo "${odlPid}"
