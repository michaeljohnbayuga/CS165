*** Settings ***
Documentation     A test suite containing tests related to invalid login.
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
Password Mismatch             valid           valid               password            drowssap
Name only                     neym            ${EMPTY}            ${EMPTY}            ${EMPTY}
Username only                 ${EMPTY}        neym                ${EMPTY}            ${EMPTY}
Password only                 ${EMPTY}        ${EMPTY}            password            ${EMPTY}
Confirm password only         ${EMPTY}        ${EMPTY}            ${EMPTY}            password
Nothing at all                ${EMPTY}        ${EMPTY}            ${EMPTY}            ${EMPTY}

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
    Location Should Be    ${ERROR URL}
    Wait Until Page Contains   Error
    Sign Up

#add password length
