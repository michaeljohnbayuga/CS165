*** Settings ***
Documentation     A test suite containing tests related to invalid signup.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Sign Up Page Should Be Open
Test Template     Login With Invalid Credentials Should Fail
Resource          resource.robot

*** Test Cases ***            NAME            USERNAME            PASSWORD            PASSWORD CONFIRM
1    Enrico    Enrico    password    password
2    Bryan Tull    Bryan Tull    password    password
3    Rajwanul Kabir    Rajwanul Kabir    password    password
4    Judith    Judith    password    password
5    Jim    Jim    password    password
6    Pasek    Pasek    password    password
7    Prathnat    Prathnat    password    password
8    Talon Jensen    Talon Jensen    password    password
9    Maggie    Maggie    password    password
10    Sharon    Sharon    password    password
11    Alex    Alex    password    password
12    Alexis    Alexis    password    password
13    Jefferson    Jefferson    password    password
14    Ashwini    Ashwini    password    password    
15    Phoenix    Phoenix    password    password

*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]    ${name}    ${username}    ${password}    ${confirmpass}
    Input Name    ${name}
    Input Username    ${username}
    Input Password    ${password}
    Input Password Confirmation    ${confirmpass}
    Submit Credentials
    Login Should Have Failed

Login Should Have Failed
    #Location Should Be    ${ERROR URL}/sign_up
    Location Should Be    ${ERROR URL}shows
    #Wait Until Page Contains   Error
    Sign Up

#add password length
