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
<<<<<<< HEAD
${LOGIN URL}      http://${SERVER}/
${WELCOME URL}    http://${SERVER}/
${ERROR URL}      http://${SERVER}/
${SIGNUP}    http://${SERVER}
=======
${LOGIN URL}      http://${SERVER}/shows
${WELCOME URL}    http://${SERVER}/shows
${ERROR URL}      http://${SERVER}/shows
${SIGNUP}    http://${SERVER}/users/sign_up
>>>>>>> 4780d5c0ad69ec455dddd7b78534b4aea004bfd7

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
<<<<<<< HEAD
    Title Should Be    KDdb
=======
    Title Should Be    TV Tracker
>>>>>>> 4780d5c0ad69ec455dddd7b78534b4aea004bfd7
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
<<<<<<< HEAD
    Title Should Be    KDdb
=======
    Title Should Be    TV Tracker
>>>>>>> 4780d5c0ad69ec455dddd7b78534b4aea004bfd7

#robot -t "Valid Login" valid login.robot
