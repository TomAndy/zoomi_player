#!/usr/bin/env python

from __future__ import print_function
from selenium import webdriver
from selenium.webdriver.common.keys import Keys


class login(object):
    def enter_credentials(self, email, password):
        driver = webdriver.Firefox()
        elem = driver.find_element_by_id("auth-email")
        elem.send_keys(email)
        elem = driver.find_element_by_id("auth-password")
        elem.send_keys(password)
        elem.send_keys(Keys.RETURN)
        driver.quit()