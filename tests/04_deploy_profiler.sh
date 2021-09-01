#!/bin/bash

set -euo pipefail

. ./env.sh


$FT multisig transfer 3 --from $PROVIDER --to RPSRoot creditBalance '{ "pubkey": "0x%{account:pubkey:%{env:PROVIDER}}" }'

$FT call RPSRoot --sign $PROVIDER deployProvider 


$FT account create RPSProvider --contract RPSProvider --keyfile "%{account:keyfile:%{env:PROVIDER}}" --static-vars '{ "s_root": "%{account:address:RPSRoot}", "s_owner": "%{addr:zero}" }' -f
