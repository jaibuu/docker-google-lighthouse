#!/bin/sh

CHROME_FLAGS=${CHROME_FLAGS:-"--headless --disable-gpu --no-sandbox"}

while IFS= read -r line || [ -n "$line" ]; do
  lighthouse --enable-error-reporting --chrome-flags="${CHROME_FLAGS}" "$line" --output json --output html
done </home/chrome/urls

