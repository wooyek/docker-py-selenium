#!/usr/bin/env bash
echo "==============================================="
echo "Docker image wooyek/py-selenium version: 0.9.6"
echo "==============================================="

echo "------> Setting up chromedriver path"
export PATH=$PATH:/usr/lib/chromium-browser/
echo $PATH
which chromedriver
chromedriver --version
dpkg -s chromium-chromedriver

echo "------> Python 2 info"
which python2
python2 -V
pip2 list

echo "------> Python 3 info"
which python3
python3 -V
pip3 list

echo "------> Running command passed down to docker"
exec "$@"

