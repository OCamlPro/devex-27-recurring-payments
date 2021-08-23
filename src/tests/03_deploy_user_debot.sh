#!/bin/bash

set -euo pipefail

. ./env.sh

$FT contract deploy RPSUserDebot --sign user0 --deployer user0 --credit 1 '{}' -f

$FT call RPSUserDebot setABI --sign user0 '{ "dabi": "%{hex:read:contract:abi:RPSUserDebot}" }'
$FT call RPSUserDebot setIcon --sign user0 '{ "icon": "%{hex:string:data:image/png;base64,%{base64:file:../debot/RPSDebot.png}}" }'





