*** Settings ***
Documentation     A test suite with a single test for the Review feature.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Review Test
    Open Browser To Login Page
    Input Username    user
    Input Password    password
    Submit Credentials
    Welcome Page Should Be Open
    Pre-Review
    Input Review    This is a test review.
    Remove Review
    Check Review
    [Teardown]    Close Browser
