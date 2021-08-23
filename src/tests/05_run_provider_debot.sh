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


#$FT client -- debot fetch %{account:address:RPSProviderDebot}
$FT client -- debot invoke %{account:address:RPSProviderDebot} '%[account:in-message:RPSProviderDebot:0:init:{ "root": "%{account:address:RPSRoot}", "multisig": "%{account:address:user1}" }]'

