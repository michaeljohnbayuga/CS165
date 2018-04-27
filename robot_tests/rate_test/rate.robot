*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    admin
    Input Password    admin
    Submit Credentials
    Add Show
    Input Code    cody
    Input Name    FPJAPFF
    Input Network    ABSGMA
    Input Start Year    2014
    Input End Year    2054
    Submit
    Successful Creation
    Add Rating
    Initial Rating
    Logout
    Logout Successfully
    Login
    Input Username1    usernamee
    Input Password1    password
    Submit Credentials1
    Shows
    [Teardown]    Close Browser