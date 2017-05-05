#!/bin/bash

/tools/wait-for-it.sh gate-go:8080 -t 20 --  nginx -g "daemon off;"

