*** Settings ***
Documentation     A test suite with a single test for valid addition and deletion of a show.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Addition and Deletion of a Show
    Open Browser To Login Page
    Input Username    admin
    Input Password    admin
    Submit Credentials
    Welcome Page Should Be Open
    Add Show
    Input Code    TestCode
    Input Network    TestNetwork
    Input Name    TestName
    Input Start Year    2016
    Input End Year    2016
    Input Casts    TestCasts
    Input Director    TestDirector
    Input Language    Korean
    Input Runtime    60 mins
    Input Synopsis    TestSynopsis
    Submit
    Show Confirmation
    Delete Show
    [Teardown]    Close Browser
