#!/bin/bash

. ./env.sh

$FT switch to testnet
$FT --switch sandbox1 node stop
$FT switch remove sandbox1

set -euo pipefail

$FT switch create sandbox1 --image ocamlpro/nil-local-node

$FT node start

echo Node is starting... waiting 10 seconds
sleep 10

$FT node give user0 user1 --amount 100000



