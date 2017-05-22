
*** Settings ***
Library             OperatingSystem
Library             Selenium2Library
Library             d:/My/Projects/Zoomi/autotests/src/login.py

Suite Setup         Close browser
#Suite Teardown      Close browser


*** Variables ***
${EMAIL}                    tombelak30@gmail.com
${PASSWORD}                 12345678
${URL}                      https://player-v2.dev.zoomiinc.com/
${BROWSER}                  firefox
${URL_AFTER_LOGIN}          https://player-v2.dev.zoomiinc.com/#course


*** Keywords ***
Login into site
    enter credentials   ${EMAIL}    ${PASSWORD}


*** Test Cases ***
User can log in
    open browser    ${URL}   ${browser}
    wait until page contains element  auth-email
    input text      auth-email    ${EMAIL}
    input password  auth-password    ${PASSWORD}
    click button    auth-sign-in
    wait until page contains element  container-course  40s
    ${current_url}=     get location
    should be equal  ${current_url}     ${URL_AFTER_LOGIN}
    maximize browser window
    wait until page contains element  xpath=//div[contains(text(), 'Tom')]    40s
    click element  xpath=//div[contains(text(), 'Tom')]
    wait until page contains element  xpath=.//*[@id='user-menu']/div/div[2]
    click element  xpath=.//*[@id='user-menu']/div/div[2]
    wait until page contains element  auth-email    40s
    close browser









