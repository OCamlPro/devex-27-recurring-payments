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


$FT call RPSProviderDebot addService --sign user0 '{ "service": "12", "callback": 0 }'