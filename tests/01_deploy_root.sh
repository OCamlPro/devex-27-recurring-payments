#!/bin/bash

set -euo pipefail

. ./env.sh

$FT contract deploy RPSRoot --sign $DEPLOYER --deployer $DEPLOYER --credit $ROOT_CREDIT '{}' -f





