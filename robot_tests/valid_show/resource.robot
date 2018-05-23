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

Add Show
    Click Element    //a[@href="/shows/new"]
    Location Should Be    http://localhost:3000/shows/new
    Wait Until Page Contains    Add Show

Input Code
    [Arguments]    ${code}
    Input Text    show_code    ${code}

Input Network
    [Arguments]    ${network}
    Input Text    show_network    ${network}

Input Name
    [Arguments]    ${name}
    Input Text    show_name    ${name}

Input Start Year
    [Arguments]    ${start}
    Input Text    show_start_year    ${start}

Input End Year
    [Arguments]    ${end}
    Input Text    show_end_year    ${end}

Input Casts
    [Arguments]    ${casts}
    Input Text    show_casts    ${casts}

Input Director
    [Arguments]    ${director}
    Input Text    show_director    ${director}

Input Language
    [Arguments]    ${lang}
    Input Text    show_language    ${lang}

Input Runtime
    [Arguments]    ${runtime}
    Input Text    show_runtime    ${runtime}

Input Synopsis
    [Arguments]    ${synopsis}
    Input Text    show_synopsis    ${synopsis}

Submit
    Click Element    //button[@class="ui blue button submit-button"]
    Wait Until Page Contains    has been created!
    
Show Confirmation
    Set Selenium Timeout    3

Delete Show
    Click Element    //a[@class="ui compact blue button"]
    Click Element    //a[@class="ui red button"]
    Wait Until Page Contains    has been deleted.



#robot -t "Valid Login" valid login.robot


