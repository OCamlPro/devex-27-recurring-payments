#!/bin/bash

set -euo pipefail

. ./env.sh

$FT call RPSProvider addService --sign $PROVIDER '{ "service": { "name": "%{hex:string:Minute Service}", "description": "", "period": "60", "token_root": "%{addr:zero}", "period_cost": "1000000000" }, "callback": "%{addr:zero}" }'
