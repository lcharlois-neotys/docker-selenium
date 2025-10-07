# Selenium-test [![Build Status](https://travis-ci.org/elgalu/Selenium-test.svg?branch=master)](https://travis-ci.org/elgalu/Selenium-test)

Hello world Selenium test.

If you want to see this running inside a docker container visit [Selenium-test-dockerized][] or scroll down to the *Docker* section.

## Requisistes
Add `sudo` only if you get permission denied.

    pip install --upgrade -r requirements.txt

It needs a Selenium server, for example [docker-Selenium][]

    docker run -d --name=mySelenium elgalu/Selenium:latest
    docker exec mySelenium wait_all_done 30s
    export SELENIUM_HUB_HOST=$(docker inspect -f='{{.NetworkSettings.IPAddress}}' mySelenium)
    export SELENIUM_HUB_PORT=24444

## Run

    python python_test.py

Sample output

    Will connect to Selenium at http://172.17.0.6:24444/wd/hub
    Opening page http://www.google.com/adwords
    Current title: Google AdWords | Pay-per-Click-Onlinewerbung auf Google (PPC)
    Asserting 'Google AdWords' in driver.title
    Opening page http://www.python.org
    Asserting 'Python' in driver.title
    Finding element by name: q
    Sending keys 'pycon'
    Sending RETURN key
    Ensure no results were found
    Close driver and clean up
    All done. SUCCESS!

## Docker
### Build

    docker build -t elgalu/Selenium-test .

### Run

    export SELENIUM_HUB_HOST=$(docker inspect -f='{{.NetworkSettings.IPAddress}}' mySelenium)
    docker run --rm --name=test1 -ti -e SELENIUM_HUB_HOST elgalu/Selenium-test


[Selenium-test-dockerized]: https://github.com/elgalu/Selenium-test-dockerized
[docker-Selenium]: https://github.com/elgalu/docker-Selenium
