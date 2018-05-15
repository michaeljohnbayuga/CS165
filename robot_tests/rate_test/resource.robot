*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${SERVER}         localhost:3000
${BROWSER}        firefox
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
    Click Element    xpath://div[@class="ui inverted login button"]
    Set Selenium Speed    ${DELAY}

Input Username
    [Arguments]    ${usernamee}
    Input Text    username    ${usernamee}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Button    login_button

Add Show
    Click Element    (//a[@class="white_text"])[2]

Input Code
    [Arguments]    ${code}
    Input Text    show_code    ${code}

Input Name
    [Arguments]    ${name}
    Input Text    show_name    ${name}

Input Network
    [Arguments]    ${network}
    Input Text    show_network    ${network}

Input Start Year
    [Arguments]    ${startyear}
    Input Text    show_start_year    ${startyear}

Input End Year
    [Arguments]    ${endyear}
    Input Text    show_end_year    ${endyear}

Submit
    Click Button    (//button[@class="ui green button submit-button"])

Successful Creation
    Title Should Be    KDdb
    Wait Until Page Contains   has been created!

Add Rating
    Click Element    (//i[@class="red minus circle large icon"])[5]

Initial Rating
    Title Should Be    KDdb
    Wait Until Page Contains   Community Average Rating: 5.0

Logout
    Click Element    (//i[@class="dropdown icon"])
    Click Element    (//a[@class="item"])[2]

Logout Successfully
    Title Should Be    KDdb
    Wait Until Page Contains    Log In

Login
    Set Selenium Speed    ${DELAY1}
    Click Element    xpath://div[@class="ui inverted login button"]
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
    Click Element    (//a[@class="white_text"])
    Wait Until Page Contains    FPJAPFF
    Select Show

Select Show
    Click Element    (//a[@href="/shows/4"])
    Wait Until Page Contains    Community Average Rating
    New Rating

New Rating
    Click Element    (//i[@class="red minus circle large icon"])[1]
    Wait Until Page Contains    Community Average Rating: 3.0
#robot -t "Valid Login" valid login.robot


