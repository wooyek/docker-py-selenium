#!/usr/bin/env bash
echo "*** Setting up chromedriver path ***"
export PATH=$PATH:/usr/lib/chromium-browser/
echo $PATH
which chromedriver
chromedriver --version

echo "*** Running command passed down to docker ***"
exec "$@"

