*** Settings ***
Documentation       Signup for Bluehost freetrial plan using existing domain
Test Timeout        ${TEST_TIMEOUT}
Test Setup          Test Setup To Start Browser And Navigate To Free Trial Signup Page
Test Teardown       Close All Browsers
Force Tags          hosting  freetrial  existingdomain

Resource            ../../../../tests/keywords/ui/signup/bh_signup.robot

*** Test Cases ***
Test Cases 1 : Testcase To Verify Free Trial Hosting Plan For Existing Domain
    [Documentation]  This test case is to check the free trial hosting plan flow using existing domain
    [Tags]      valid
           Purchase Freetrial Hosting With Select Domain Flow Type        ${txt_existing_domain_locator}         ${btn_existing_domain_next_locator}