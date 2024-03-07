*** Settings ***
Documentation       Signup for Bluehost woocommerce hosting plan using domainless flow
Test Timeout        ${TEST_TIMEOUT}
Test Setup          Test Setup To Start Browser And To Change Preferred Currency  ${landingpage_url_category}
Test Teardown       Close All Browsers
Force Tags          hosting  woocommercehosting  domainless

Resource            ../../../../tests/keywords/ui/signup/bh_signup.robot

*** Test Cases ***
Test Case 1 : Buy Woocommerce Single Store Hosting Plan Test Case For Domainless Flow
   [Documentation]  This testcase is to check woocommerce hosting single store plan flow with domainless flow
   [Tags]      valid
        Purchase Woocommerce Hosting Plan With Domainless Flow  ${btn_woocommerce_single_store_plan_locator}

Test Case 2 : Buy Woocommerce Multiple Store Hosting Plan Test Case For Domainless Flow
   [Documentation]  This testcase is to check woocommerce hosting multiple store plan flow with domainless flow
   [Tags]      valid
        Purchase Woocommerce Hosting Plan With Domainless Flow  ${btn_woocommerce_multiple_store_plan_locator}