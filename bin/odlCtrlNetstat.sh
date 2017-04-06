#!/bin/bash

netstat -lnp | grep -E "java|:66[35]3|:5005" --color=always
uptime