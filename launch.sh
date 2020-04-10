#!/usr/bin/env nix-shell
#! nix-shell -i bash

echo Starting

waitress-serve \
  --listen "127.0.0.1:8081" \
  --trusted-proxy "127.0.0.1" --trusted-proxy-headers "x-forwarded-for x-forwarded-host x-forwarded-proto x-forwarded-port" \
  'mcstatus_aas:app'
