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
${VALID USER}     valid
${VALID PASSWORD}    valid
<<<<<<< HEAD
${LOGIN URL}      http://${SERVER}
${WELCOME URL}    http://${SERVER}
${ERROR URL}      http://${SERVER}
=======
${LOGIN URL}      http://${SERVER}/shows
${WELCOME URL}    http://${SERVER}/shows
${ERROR URL}      http://${SERVER}/shows
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
    Go To Login Page

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
<<<<<<< HEAD
    Title Should Be    KDdb
    Wait Until Page Contains   Hi
=======
    Title Should Be    TV Tracker
    Wait Until Page Contains   You signed up successfully.
>>>>>>> 4780d5c0ad69ec455dddd7b78534b4aea004bfd7

#robot -t "Valid Login" valid login.robot


