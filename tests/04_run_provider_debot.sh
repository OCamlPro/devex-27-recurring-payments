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

$FT account create RPSProvider --contract RPSProvider --keyfile "%{account:keyfile:user1}" --static-vars '{ "s_root": "%{account:address:RPSRoot}", "s_owner": "%{addr:zero}" }' -f

# $FT client -- debot fetch %{account:address:RPSProviderDebot}
$FT client -- debot invoke %{account:address:RPSProviderDebot} '%[account:in-message:RPSProviderDebot:0:init:{ "multisig": "%{account:address:user1}" }]'
