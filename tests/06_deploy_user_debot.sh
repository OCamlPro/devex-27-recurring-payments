#!/bin/bash

set -euo pipefail

. ./env.sh

$FT contract deploy RPSUserDebot --sign $DEPLOYER --deployer $DEPLOYER --credit 1 '{}' -f || echo OK

$FT call RPSUserDebot setABI --sign $DEPLOYER '{ "dabi": "%{hex:read:contract:abi:RPSUserDebot}" }'
$FT call RPSUserDebot setIcon --sign $DEPLOYER '{ "icon": "%{hex:string:data:image/png;base64,%{base64:file:../debot/RPSDebot.png}}" }'
$FT call RPSUserDebot setRoot --sign $DEPLOYER '{ "root": "%{account:address:RPSRoot}" }'






