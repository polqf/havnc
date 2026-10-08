#!/bin/bash

mkdir -p /data/google-chrome

# Remove stale Chromium singleton locks
rm -f \
  /data/google-chrome/SingletonLock \
  /data/google-chrome/SingletonCookie \
  /data/google-chrome/SingletonSocket

touch "/data/google-chrome/First Run"

exec chromium \
  --kiosk \
  --no-sandbox \
  --test-type \
  --no-first-run \
  --disable-dev-shm-usage \
  --disable-gpu \
  --start-maximized \
  --noerrdialogs \
  --user-data-dir=/data/google-chrome \
  "$(jq --raw-output '.url' /data/options.json)"
