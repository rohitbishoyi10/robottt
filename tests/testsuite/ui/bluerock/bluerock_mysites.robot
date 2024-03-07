*** Settings ***
Documentation       Validate mysites section from Bluerock panel after login to account
Test Timeout        ${TEST_TIMEOUT}
Test Setup          Login To Bluerock Panel And Verify Successful Login      ${bh_login_domain}     ${bh_login_password}
#Test Teardown       Logout from Bluerock cPanel
Force Tags          ui  prod   critical    mysites

Resource            ../../../../tests/keywords/ui/bluerock/bluerock_mysites.robot

*** Test Cases ***
Test Cases 1 : Testcase To Create Website In Mysites Section
    [Documentation]  This test case is to create a website in mysites section
    [Tags]                 mysites     valid
        Navigate To Mysite Page And Validate
        Creation Of Site Under Mysites Section

#Test Cases 2 : Testcase To Delete Existing Website In Mysites Section
#    [Documentation]  This test case is to delete the website in mysites section
#    [Tags]                 mysites     valid
#        Navigate To Mysite Page And Validate
#        Delete Website In Mysites Section
#
#Test Cases 3 : Testcase To Verify Overview, Marketing Center, Users And Backups Sections In Mysites Section
#    [Documentation]  This test case is to verify overview, marketing center, users and backups section in mysites section
#    [Tags]                 mysites     valid     managewpsite
#        Navigate To Mysite Page And Validate
#        Creation Of Site Under Mysites Section
#        Verify Overview Section In Mysites Section
#        Verify Marketing Center In Mysites Section
#        Verify Users Section In Mysites Section
#        Verify Backups Section In Mysites Section
#
#Test Cases 4 : Testcase To Verify Performance, Plugins, Settings And Security Sections In Mysites Section
#    [Documentation]  This test case is to verify performance, plugins, settings and security in mysites section
#    [Tags]                 mysites     valid     managewpsite
#        Navigate To Mysite Page And Validate
#        Verify Performance Section In Mysites Section
#        Verify Plugins Section In Mysites Section
#        Verify Settings Section In Mysites Section
#        Verify Security Section In Mysites Section