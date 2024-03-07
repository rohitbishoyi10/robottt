*** Settings ***
Documentation       Validate Account Center Section
Test Timeout        ${TEST_TIMEOUT}
Test Setup          Login To Bluerock Panel And Verify Successful Login  ${bh_login_domain}  ${bh_login_password}
Test Teardown       Logout from Bluerock cPanel
Force Tags          ui  prod    valid   critical    accountcenter

Resource            ../../../../tests/keywords/ui/bluerock/account_center.robot

*** Test Cases ***
Test Case 1 : Account Center Validation
   [Documentation]  This testcase is to validate account center
        Account Center Validation