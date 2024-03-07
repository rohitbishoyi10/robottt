*** Settings ***
Documentation       Create New Subdomain AND Delete Existing Subdomian
Test Timeout        ${TEST_TIMEOUT}
Test Setup          Login With Bluehost Credentials
Test Teardown       Logout from Bluerock cPanel
Force Tags          ui  prod    valid   critical    advancedsection

Resource            ../../../../tests/keywords/sub_domain.robot

*** Test Cases ***
Test Case 1 : Create New Subdomain
   [Documentation]  This testcase is to create subdomain
        Run Keyword If AD User Login Page Appears
        Create Subdomain

Test Case 2 : Delete Existing Subdomian
   [Documentation]  This testcase is to Delete subdomain
        Run Keyword If AD User Login Page Appears
        Delete Subdomain