*** Settings ***
Documentation       Signup for a Bluehost basic hosting plan using existing domain
Test Timeout        ${TEST_TIMEOUT}
Test Setup          Test Setup To Start Browser And To Change Preferred Currency  ${landingpage_url_category}
Test Teardown       Close All Browsers
Force Tags          hosting  sharedhosting  existingdomain

Resource            ../../../../tests/keywords/ui/signup/bh_signup.robot

*** Test Cases ***
Test Case 1 : Buy Shared Basic Hosting Plan Test Case For Existing Domain Flow
   [Documentation]  This testcase is to check shared hosting basic plan flow with existing domain
   [Tags]      valid
        Purchase Shared Hosting Plan With Select Domain Type  ${btn_shared_hosting_basic_plan_locator}  ${txt_existing_domain_locator}  ${btn_existing_domain_next_locator}  ${txt_existing_domain_hfe_locator}  ${btn_existing_domain_next_hfe_locator}

Test Case 2 : Buy Shared Plus Hosting Plan Test Case For Existing Domain Flow
   [Documentation]  This testcase is to check shared hosting plus plan flow with existing domain
   [Tags]      valid
        Purchase Shared Hosting Plan With Select Domain Type  ${btn_shared_hosting_plus_plan_locator}  ${txt_existing_domain_locator}  ${btn_existing_domain_next_locator}  ${txt_existing_domain_hfe_locator}  ${btn_existing_domain_next_hfe_locator}

Test Case 3 : Buy Shared Choice Plus Hosting Plan Test Case For Existing Domain Flow
   [Documentation]  This testcase is to check shared hosting choice plus plan flow with existing domain
   [Tags]      valid
        Purchase Shared Hosting Plan With Select Domain Type  ${btn_shared_hosting_choice_plus_plan_locator}  ${txt_existing_domain_locator}  ${btn_existing_domain_next_locator}  ${txt_existing_domain_hfe_locator}  ${btn_existing_domain_next_hfe_locator}

Test Case 4 : Buy Shared Pro Hosting Plan Test Case For Existing Domain Flow
   [Documentation]  This testcase is to check shared hosting pro plan flow with existing domain
   [Tags]      valid
        Purchase Shared Hosting Plan With Select Domain Type  ${btn_shared_hosting_pro_plan_locator}  ${txt_existing_domain_locator}  ${btn_existing_domain_next_locator}  ${txt_existing_domain_hfe_locator}  ${btn_existing_domain_next_hfe_locator}
