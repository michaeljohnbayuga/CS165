*** Settings ***
Documentation     A test suite with a single test for the Favorite feature.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Favorite Test
    Open Browser To Login Page
    Input Username    user
    Input Password    password
    Submit Credentials
    Welcome Page Should Be Open
    Pre-Favorites
    Add Favorites
    Post-Favorites
    Remove Favorites
    Check Favorites
    [Teardown]    Close Browser
