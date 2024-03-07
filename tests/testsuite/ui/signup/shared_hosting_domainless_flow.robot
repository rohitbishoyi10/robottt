*** Settings ***
Documentation       Signup for a Bluehost Shared hosting plan with domain later option
Test Setup          Test Setup To Start Browser And To Change Preferred Currency    ${landingpage_url_category}
Test Teardown       Close All Browsers
Force Tags          hosting  sharedhosting  domainless

Resource            ../../../../tests/keywords/ui/signup/bh_signup.robot

*** Test Cases ***
Test Case 1 : Buy standard Basic Hosting Plan Test Case for domainless flow
   [Documentation]  This testcase is to check the shared hosting domainless basic plan flow
        Purchase Shared Hosting Plan With Domainless Flow    ${btn_shared_hosting_basic_plan_locator}


Test Case 2 : Buy Shared Plus Hosting Plan Test Case For Domainless Flow
   [Documentation]  This testcase is to check the shared hosting domainless plus plan flow
   [Tags]      valid
        Purchase Shared Hosting Plan With Domainless Flow   ${btn_shared_hosting_plus_plan_locator}

Test Case 3 : Buy Shared Choice Plus Hosting Plan Test Case For Domainless Flow
   [Documentation]  This testcase is to check the shared hosting domainless choice plus plan flow
   [Tags]      valid
        Purchase Shared Hosting Plan With Domainless Flow   ${btn_shared_hosting_choice_plus_plan_locator}

Test Case 4 : Buy Shared Pro Hosting Plan Test Case For Domainless Flow
   [Documentation]  This testcase is to check the shared hosting domainless pro plan flow
   [Tags]      valid
        Purchase Shared Hosting Plan With Domainless Flow  ${btn_shared_hosting_pro_plan_locator}