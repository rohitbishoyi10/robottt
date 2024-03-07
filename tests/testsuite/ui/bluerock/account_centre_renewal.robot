*** Settings ***
Documentation       Validate Renewal from Account Centre
Test Timeout        ${TEST_TIMEOUT}
Suite Setup         Suite Setup For Product Purchase
Test Setup          Login To Bluerock Panel And Verify Successful Login   ${SUITE_RANDOM_DOMAIN_NAME}    ${SUITE_RANDOM_HOSTING_PASSWORD_VARIABLE}
Test Teardown       Logout from Bluerock cPanel
Force Tags          ui  prod    valid   critical    renewal

Resource            ../../../../tests/keywords/ui/bluerock/account_centre_renewal.robot
Resource            ../../../../tests/keywords/ui/bluerock/product_purchase.robot

*** Test Cases ***
Test Case 1 : Validate Renewal From Bluerock Panel
    [Documentation]     This testcase is used to validated renewal from bluerock page
    [Tags]      valid
        Validate Account Centre Renewal Flow
        Enter The Card Details And Verify The Renewal Is Successful