#!/usr/bin/env bash
blockhash_id=${1}

# writing to log
echo "[$(date +%FT%T)] type:BlockNotify event for ${blockhash_id}" >> /var/log/bitcoin/block-notify.log