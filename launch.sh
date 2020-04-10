#!/usr/bin/env nix-shell
#! nix-shell -i bash

echo Starting

waitress-serve 'mcstatus_aas:app'
