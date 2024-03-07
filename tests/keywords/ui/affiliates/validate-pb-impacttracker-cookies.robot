*** Settings ***
Resource        ../../../../tests/keywords/ui/common.robot
Variables       ../../../../tests/locators/ui/affiliates/validate-pb-impacttracker-cookies.py
Variables       ../../../../tests/variables/ui/affiliates/validate-pb-impacttracker-cookies.py

*** Keywords ***
Access BH Affiliate Promotion Link And Validate Cookies
    [Documentation]     Access affiliate promo link in browser, open developer tools and validate cookies
        Wait Until Page Contains Element        ${drpdown_wordpress_locator}        timeout=${EXPLICIT_TIMEOUT}
        ${cookies}=     Get Cookies
        Should Contain      ${cookies}        ${IMPACT_TRACKER_COOKIE}
        Should Contain      ${cookies}        ${PB_COOKIE}
