*** Settings ***
Documentation       Validate Cpanel Manager From Icluster
Test Timeout        ${TEST_TIMEOUT}
Test Setup          Login To Icluster And Verify Successful Login
Force Tags          ui  prod   CPM

Resource            ../../../../tests/keywords/ui/cpanelmanager/cpanel_manager.robot

*** Test Cases ***
Test Case 1 : Validate Icluster In CPM
    [Documentation]     This testcase is to validate icluster in CPM
    [Tags]      valid
        Validate Cpanel Manager