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
${DELAY1}          1
${VALID USER}     valid
${VALID PASSWORD}    valid
${LOGIN URL}      http://${SERVER}
${WELCOME URL}    http://${SERVER}
${ERROR URL}      http://${SERVER}

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    KDdb
    Go To Login Page

Go To Login Page
    Set Selenium Speed    ${DELAY1}
    Click Element    //div[@class="ui inverted login button"]
    Set Selenium Speed    ${DELAY}

Input Username
    [Arguments]    ${usernamee}
    Input Text    username    ${usernamee}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Button    login_button

Add Rating
    Click Element    //a[@href="/shows"]
    Location Should Be    http://localhost:3000/shows
    Click Element    //a[@href="/shows/6"]
    Location Should Be    http://localhost:3000/shows/6
    Click Element    //a[@class="star star-5 icon"]

Initial Rating
    Title Should Be    KDdb
    Wait Until Page Contains   Your Rating: 5.0

Logout
    Click Element    //i[@class="dropdown icon"]
    Click Element    //a[@href="/logout"]

Logout Successfully
    Title Should Be    KDdb
    Wait Until Page Contains    Log In

Login
    Set Selenium Speed    ${DELAY1}
    Click Element    //div[@class="ui inverted login button"]
    Set Selenium Speed    ${DELAY}

Input Username1
    [Arguments]    ${usernamee1}
    Input Text    username    ${usernamee1}

Input Password1
    [Arguments]    ${password1}
    Input Text    password    ${password1}

Submit Credentials1
    Click Button    login_button

Shows
    Click Element    //a[@href="/shows"]
    Location Should Be    http://localhost:3000/shows
    Click Element    //a[@href="/shows/6"]
    Location Should Be    http://localhost:3000/shows/6
    Click Element    //a[@class="star star-1 icon"]
    New Rating

New Rating
    Title Should Be    KDdb
    Wait Until Page Contains    Your Rating: 1.0    
    Wait Until Page Contains    3.0
    Wait Until Page Contains    stars from 2 users
#robot -t "Valid Login" valid login.robot


