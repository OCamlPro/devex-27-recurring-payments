#!/bin/bash

set -euo pipefail

. ./env.sh

$FT multisig transfer 50 --from $TESTUSER --to RPSRoot creditBalance '{ "pubkey": "0x%{account:pubkey:%{env:TESTUSER}}" }'

$FT call RPSRoot --sign $TESTUSER deployUser

$FT account create RPSUser --contract RPSUser --keyfile "%{account:keyfile:%{env:TESTUSER}}" --static-vars '{ "s_root": "%{account:address:RPSRoot}", "s_owner": "%{addr:zero}" }' -f
