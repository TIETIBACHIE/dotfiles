#!/bin/bash
ueberzugpp layer --no-stdin --silent --use-escape-codes --pid-file /tmp/ueberzugpp-$$.pid &
export UB_SOCKET=/tmp/ueberzugpp-$$
sleep 0.5
lf "$@"
ueberzugpp cmd exit -s "$UB_SOCKET" 2>/dev/null
