*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${SERVER}         localhost:3000
${BROWSER}        chrome
${DELAY}          0
${DELAY1}         0.5
${VALID USER}     valid
${VALID PASSWORD}    valid
${LOGIN URL}      http://${SERVER}/
${WELCOME URL}    http://${SERVER}/
${ERROR URL}      http://${SERVER}/
${SIGNUP}    http://${SERVER}

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    KDdb
    Sign Up

Sign Up
    Click Element    xpath://div[@class="ui inverted login button"]
    Set Selenium Speed    ${DELAY1}

Sign Up Page Should Be Open
    Click Element    xpath://a[@class="ui pointer signup link"]
    Set Selenium Speed    ${DELAY}

Input Name
    [Arguments]    ${name}
    Input Text    id=user_name    ${name}

Input Username
    [Arguments]    ${username}
    Input Text    user_username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    user_password    ${password}

Input Password Confirmation
    [Arguments]    ${confirmpass}
    Input Text    user_password_confirmation    ${confirmpass}

Submit Credentials
    Click Button    xpath://button[.//text() = 'SIGN UP']

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}shows
    Title Should Be    KDdb

#robot -t "Valid Login" valid login.robot
