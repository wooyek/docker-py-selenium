#!/usr/bin/env bash
echo "==============================================="
echo "Docker image wooyek/py-selenium version: 0.9.5"
echo "==============================================="
echo "------> Setting up chromedriver path"
export PATH=$PATH:/usr/lib/chromium-browser/
echo $PATH
which chromedriver
chromedriver --version

echo "------> Running command passed down to docker ***"
exec "$@"

