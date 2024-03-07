*** Settings ***
Documentation       Validate Advanced section from Bluerock panel after login to account
Test Timeout        ${TEST_TIMEOUT}
Test Setup          Login To Bluerock Panel And Verify Successful Login  ${bh_login_domain}  ${bh_login_password}
Test Teardown       Logout from Bluerock cPanel
Force Tags          ui  prod   critical    advancedsection

Resource            ../../../../tests/keywords/ui/bluerock/advanced-section.robot

*** Test Cases ***
Test Case 1 : Validate Email Section In Advance Section
    [Documentation]     This testcase is used to validated email section is loading from advance section
    [Tags]      valid
        Validate Advanced Section in Bluerock Panel
        Validate Email fields inside Advanced Section

Test Case 2 : Validate File Manager Section In Advance Section
    [Documentation]     This testcase is used to validated file manager section is loading from advance section
    [Tags]      valid
        Validate Advanced Section in Bluerock Panel
        Validate FIle Manager fields inside Advanced Section

Test Case 3 : Validate Database Fields Section In Advance Section
    [Documentation]     This testcase is used to validated database fields section is loading from advance section
    [Tags]      valid
        Validate Advanced Section in Bluerock Panel
        Validate Database fields inside Advanced Section

Test Case 4 : Validate Metrics Fields Section In Advance Section
    [Documentation]     This testcase is used to validated metrics fields section is loading from advance section
    [Tags]      valid
        Validate Advanced Section in Bluerock Panel
        Validate Metrics fields inside Advanced Section