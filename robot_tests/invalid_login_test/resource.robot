*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${SERVER}         localhost:3000
${BROWSER}        Chrome
${DELAY}          0
${VALID USER}     valid
${VALID PASSWORD}    valid
${LOGIN URL}      http://${SERVER}/shows
${WELCOME URL}    http://${SERVER}/shows
${ERROR URL}      http://${SERVER}/shows

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    TV Tracker

Go To Login Page
    Click Element    xpath://div[@class="ui inverted login button"]

Input Username
    [Arguments]    ${usernamee}
    Input Text    username    ${usernamee}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Button    login_button

Welcome Page Should Be Open
    Title Should Be    TV Tracker
    Wait Until Page Contains   Welcome,
