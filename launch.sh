#!/usr/bin/env nix-shell
#! nix-shell -i bash

echo Starting

waitress-serve --port 8081 --trusted-proxy-headers="x-forwarded-for x-forwarded-host x-forwarded-proto x-forwarded-port" --trusted-proxy="127.0.0.1" 'mcstatus_aas:app'
