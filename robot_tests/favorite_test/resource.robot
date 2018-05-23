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
    #Wait Until Element Is Visible    login_button    timeout=10
    Click Element    //div[@class="ui inverted login button"]

Input Username
    [Arguments]    ${usernamee}
    Input Text    username    ${usernamee}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Button    login_button

Welcome Page Should Be Open
    Title Should Be    KDdb
    Wait Until Page Contains   Hi

Pre-Favorites
    Click Element    //a[@href="/trackers"]
    Location Should Be    http://localhost:3000/trackers
    Wait Until Page Contains    No shows found.

Add Favorites
    Click Element    //a[@href="/shows"]
    Location Should Be    http://localhost:3000/shows
    Wait Until Page Contains    A Korean Oddysey
    Click Element    //a[@href="/shows/5"]
    Location Should Be    http://localhost:3000/shows/5
    Wait Until Page Contains    Add to favorites
    Click Element    //a[@href="/favorite_shows?show_id=5"]
    Wait Until Page Contains    Remove from favorites

Post-Favorites
    Click Element    //a[@href="/trackers"]
    Location Should Be    http://localhost:3000/trackers
    Wait Until Page Contains    Full House

Remove Favorites
    Click Element    //a[@href="/shows/5"]
    Location Should Be    http://localhost:3000/shows/5
    Wait Until Page Contains    Remove from favorites
    Click Element    //a[@href="/favorite_shows/5"]
    Wait Until Page Contains    Add to favorites

Check Favorites
    Click Element    //a[@href="/trackers"]
    Location Should Be    http://localhost:3000/trackers
    Wait Until Page Contains    No shows found.

#robot -t "Valid Login" valid login.robot


