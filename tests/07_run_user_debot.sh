#!/bin/bash

set -euo pipefail

. ./env.sh

echo 'Root address:'
ft -q output '%{account:address:RPSRoot}'
echo 'Passphrase:'
ft -q output '%{account:passphrase:user1}'
echo 'Pubkey:'
ft -q output '0x%{account:pubkey:user1}'
echo 'Multisig:'
ft -q output '%{account:address:user1}'


$FT account create RPSUser --contract RPSUser --keyfile "%{account:keyfile:user1}" --static-vars '{ "s_root": "%{account:address:RPSRoot}", "s_owner": "%{addr:zero}" }' -f

$FT client -- debot invoke %{account:address:RPSUserDebot} '%[account:in-message:RPSUserDebot:0:init:{ "multisig": "%{account:address:user1}" }]'
