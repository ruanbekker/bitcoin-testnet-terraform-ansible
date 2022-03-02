#!/usr/bin/env bash
transaction_id=${1}
wallet_name=${2}

# writing to log
echo "[$(date +%FT%T)] type:WalletNotify event for ${transaction_id} ${wallet_name}" >> /var/log/bitcoin/wallet-notify.log