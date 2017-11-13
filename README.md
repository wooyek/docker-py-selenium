# Docker to run selenium tests from python

Test environment for Selenium tests driven by python scripts. Version 0.9.9

[![Docker Pulls](https://img.shields.io/docker/pulls/wooyek/py-selenium.svg)](https://hub.docker.com/r/wooyek/geodjango/)
[![Docker Stars](https://img.shields.io/docker/stars/wooyek/py-selenium.svg)](https://hub.docker.com/r/wooyek/py-selenium/)
[![Docker Automated build](https://img.shields.io/docker/automated/wooyek/py-selenium.svg)](https://hub.docker.com/r/wooyek/py-selenium/)

## BitBucket Pipelines support

You can use this as a test image with BitBucket Pipelines, an example:

```
image: wooyek/py-selenium

pipelines:
  default:
    - step:
      script:        
        # Pipelines overrides default docker entry point, we need to run it maually
        - py-selenium-entrypoint.sh  
        - python -m unittest discover -p "*_tests.py"
```
