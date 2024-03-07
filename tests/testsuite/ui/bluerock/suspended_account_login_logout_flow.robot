*** Settings ***
Documentation       Validate status of suspended/deactivated accounts
Test Setup          Login To Bluerock Panel And Verify Successful Login     ${bh_deactivated_login}     ${bh_login_password}
Test Teardown       Close All Browsers
Force Tags          ui  prod   valid   deactivated

Resource            ../../../../tests/keywords/ui/common.robot

*** Test Cases ***
Test Cases 1 : Testcase To Validate Status Of Suspended/Deactivated Accounts
    [Documentation]  This test case is to validate status of suspended/deactivated accounts
        Validate Deactivation Status Of The Accounts
