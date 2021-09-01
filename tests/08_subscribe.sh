#!/bin/bash

set -euo pipefail

. ./env.sh

$FT call RPSUser subscribe '{ "provider": "%{account:address:RPSProvider}", "serv_id": "0", "periods": "10", "callback" : "%{addr:zero}" }' --wait

