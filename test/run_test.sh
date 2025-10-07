#!/usr/bin/env bash

# set -e: exit asap if a command exits with a non-zero status
set -e

if [ "${VIDEO}" = "true" ]; then
  # backup
  stop-video || true
  mkdir -p /test/videos/bup/
  mv /videos/* /test/videos/bup/
fi

Selenium_test chrome
Selenium_test firefox
Selenium_test mobile_emulation

if [ "${VIDEO}" = "true" ]; then
  # restore backup
  mv /test/videos/bup/* /videos/
  start-video
fi
