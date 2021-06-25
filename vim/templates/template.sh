#!/usr/bin/env bash

set -euo pipefail

if [ $# -eq 0 ]; then
  printf "  Name of script
  Parameters required...
  Provide info here\n"
  exit 64
fi
