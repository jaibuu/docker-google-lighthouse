#!/bin/sh
set -e

CHROME_FLAGS=${CHROME_FLAGS:-"--headless --disable-gpu --no-sandbox"}

wget "$@" -O /home/chrome/urls

while IFS= read -r line || [ -n "$line" ]; do

    if [ "${line#http}" != "$line" ]; then
        echo "Peforming test for $line URL - "; lighthouse --enable-error-reporting --chrome-flags="${CHROME_FLAGS}" "$line" --output json --output html
    fi


done < /home/chrome/urls

exec "$@"
