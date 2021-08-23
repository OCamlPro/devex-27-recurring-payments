#!/bin/bash

set -euo pipefail

. ./env.sh

$FT contract deploy RPSRoot --sign user0 --deployer user0 --credit 100 '{}' -f





