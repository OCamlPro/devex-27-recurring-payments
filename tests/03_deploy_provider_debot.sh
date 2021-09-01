#!/bin/bash

set -euo pipefail

. ./env.sh

$FT contract deploy RPSProviderDebot --sign $DEPLOYER --deployer $DEPLOYER --credit 1 '{}' -f || echo OK


$FT call RPSProviderDebot setABI --sign $DEPLOYER '{ "dabi": "%{hex:read:contract:abi:RPSProviderDebot}" }'
$FT call RPSProviderDebot setIcon --sign $DEPLOYER '{ "icon": "%{hex:string:data:image/png;base64,%{base64:file:../debot/RPSDebot.png}}" }'
$FT call RPSProviderDebot setRoot --sign $DEPLOYER '{ "root": "%{account:address:RPSRoot}" }'




