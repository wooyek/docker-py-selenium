# coding=utf-8

import logging

import pytest
from selenium import webdriver
from selenium.webdriver.chrome.options import Options


def setup_chrome():
    chrome_options = Options()
    chrome_options.add_argument("--disable-search-geolocation-disclosure")
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--start-maximized")

    # executable_path = "/usr/lib/chromium-browser/chromedriver"
    # executable_path = '/usr/local/bin/chromedriver'
    executable_path = 'chromedriver'

    driver = webdriver.Chrome(
        executable_path=executable_path,
        chrome_options=chrome_options
    )

    return driver


def create_driver(request):
    chrome = setup_chrome()
    request.node._driver = chrome
    chrome.set_window_position(0, 0)
    chrome.set_window_size(1920, 1080)
    chrome.accept_next_alert = True
    return chrome


@pytest.fixture(scope='session')
def browser(request, display):
    """Logged in user session for brian@niepodam.pl """
    driver = create_driver(request)
    yield driver
    logging.debug("Quiting driver: %s", driver)
    driver.quit()


@pytest.fixture(scope='session')
def display(request):
    """Logged in user session for brian@niepodam.pl """
    from pyvirtualdisplay import Display
    display = Display(visible=0, size=(1920, 1080))
    display.start()


def test_google(browser):
    browser.get("http://google.com")
