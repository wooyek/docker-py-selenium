#!/usr/bin/env bash
export PATH=$PATH:/usr/lib/chromium-browser/
echo $PATH

echo "*** Running command passed down to docker ***"
exec "$@"

