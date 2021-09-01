#!/bin/bash

set -euo pipefail

. ./env.sh

$FT call RPSRoot setUserCode '{ "user_code": "%{get-code:contract:tvc:RPSUser}" }'

$FT call RPSRoot setProviderCode '{ "provider_code": "%{get-code:contract:tvc:RPSProvider}" }'





