FROM ubuntu:16.04

MAINTAINER Janusz Skonieczny @wooyek
LABEL version="0.9.1"

# http://stackoverflow.com/a/27931669/260480
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8 \
    LANGUAGE en_US:en \ 
    LC_ALL en_US.UTF-8 \
    PYTHONIOENCODING=utf-8 \


# Install tooling for test debuging and libraries needed by geodjango.
RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y git unzip nano wget sudo curl build-essential \
    python python-dev python-pip python-virtualenv \
    python3 python3-dev python3-pip python3-venv \
    python-pip chromium-chromedriver xvfb && \
    python -m pip install pip -U && \
    python3 -m pip install pip -U && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    pip install selenium pyvirtualdisplay invoke pytest envparse tox coverage pylint pathlib -U && \
    pip3 install selenium pyvirtualdisplay invoke pytest envparse tox coverage pylint -U

COPY py-selenium-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/py-selenium-entrypoint.sh
ENTRYPOINT ["py-selenium-entrypoint.sh"]
