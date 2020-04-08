#!/usr/bin/env nix-shell
#! nix-shell -p "python3.withPackages (p: with p; [ flask waitress nur.repos.jakobrs.mcstatus ])" -i bash

echo Starting

waitress-serve 'mcstatus_aas:app'
