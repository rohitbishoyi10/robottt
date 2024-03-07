*** Settings ***
Documentation       Testcase to validate cookies
Test Timeout        ${TEST_TIMEOUT}
Test Setup          Start Browser    ${PROD_AFF_PROMO_URL}   ${BROWSER}
Test Teardown       Close All Browsers
Force Tags          affiliates  prod    ui  valid    bhcom

Resource            ../../../../tests/keywords/ui/affiliates/validate-pb-impacttracker-cookies.robot

*** Test Cases ***
Test Case 1 : Validate Pb And Impact_tracker Cookies
    [Documentation]     Testcase to validate the cookies like 'pb' and 'impact_tracker'
        Access BH Affiliate Promotion Link And Validate Cookies
