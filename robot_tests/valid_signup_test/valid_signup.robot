*** Settings ***
Documentation     A test suite with a single test for valid signup.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Signup
    Open Browser To Login Page
    Sign Up
    Sign Up Page Should Be Open
    Input Name    nameko
    Input Username    namek
    Input Password    password
    Input Password Confirmation    password
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Close Browser
