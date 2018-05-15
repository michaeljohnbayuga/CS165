*** Settings ***
Documentation     A test suite with a single test for the Rate feature.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Rate Test
    Open Browser To Login Page
    Input Username    admin
    Input Password    admin
    Submit Credentials
    Add Rating
    Initial Rating
    Logout
    Logout Successfully
    Login
    Input Username1    user
    Input Password1    password
    Submit Credentials1
    Shows
    [Teardown]    Close Browser