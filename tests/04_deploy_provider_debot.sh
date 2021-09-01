#!/bin/bash

set -euo pipefail

. ./env.sh

$FT contract deploy RPSProviderDebot --sign user0 --deployer user0 --credit 1 '{}' -f


$FT call RPSProviderDebot setABI --sign user0 '{ "dabi": "%{hex:read:contract:abi:RPSProviderDebot}" }'
$FT call RPSProviderDebot setIcon --sign user0 '{ "icon": "%{hex:string:data:image/png;base64,%{base64:file:../debot/RPSDebot.png}}" }'
$FT call RPSProviderDebot setRoot --sign user0 '{ "root": "%{account:address:RPSRoot}" }'




