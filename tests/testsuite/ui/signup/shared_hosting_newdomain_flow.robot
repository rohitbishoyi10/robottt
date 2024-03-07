*** Settings ***
Documentation       Signup for Bluehost basic hosting plan using new domain
Test Timeout        ${TEST_TIMEOUT}
Test Setup          Test Setup To Start Browser And To Change Preferred Currency  ${landingpage_url_category}
Test Teardown       Close All Browsers
Force Tags          hosting  sharedhosting  newdomain

Resource            ../../../../tests/keywords/ui/signup/bh_signup.robot
Resource            ../../../../tests/keywords/ui/bluerock/hosting_upgrade.robot
Resource            ../../../../tests/keywords/ui/cpanelmanager/cpanel_manager.robot

*** Test Cases ***
Test Case 1 : Buy Shared Basic Hosting Plan Test Case For New Domain Flow
   [Documentation]  This testcase is to check shared hosting basic plan flow with new domain
   [Tags]      valid
        Purchase Shared Hosting Plan With Select Domain Type  ${btn_shared_hosting_basic_plan_locator}  ${txt_new_domain_locator}  ${btn_new_domain_next_locator}  ${txt_new_domain_hfe_locator}  ${btn_new_domain_next_hfe_locator}

Test Case 2 : Buy Shared Plus Hosting Plan Test Case For New Domain Flow
   [Documentation]  This testcase is to check shared hosting plus plan flow with new domain
   [Tags]      valid
        Purchase Shared Hosting Plan With Select Domain Type  ${btn_shared_hosting_plus_plan_locator}    ${txt_new_domain_locator}  ${btn_new_domain_next_locator}  ${txt_new_domain_hfe_locator}  ${btn_new_domain_next_hfe_locator}

Test Case 3 : Buy Shared Choice Plus Hosting Plan Test Case For New Domain Flow
   [Documentation]  This testcase is to check shared hosting choice plus plan flow with new domain
   [Tags]      valid
        Purchase Shared Hosting Plan With Select Domain Type  ${btn_shared_hosting_choice_plus_plan_locator}    ${txt_new_domain_locator}  ${btn_new_domain_next_locator}  ${txt_new_domain_hfe_locator}  ${btn_new_domain_next_hfe_locator}

Test Case 4 : Buy Shared Pro Hosting Plan Test Case For New Domain Flow
   [Documentation]  This testcase is to check shared hosting pro plan flow with new domain
   [Tags]      valid
        Purchase Shared Hosting Plan With Select Domain Type  ${btn_shared_hosting_pro_plan_locator}    ${txt_new_domain_locator}  ${btn_new_domain_next_locator}  ${txt_new_domain_hfe_locator}  ${btn_new_domain_next_hfe_locator}

Test Case 5 : Validate More Information Links Under Package Extras
   [Documentation]  This testcase is to validate more informtion links under package extras
   [Tags]      valid   Moreinfo
        Validate More Information Links Under Package Extras In the Signup Flow      ${btn_shared_hosting_basic_plan_locator}    ${txt_new_domain_locator}   ${btn_new_domain_next_locator}   ${txt_new_domain_hfe_locator}    ${btn_new_domain_next_hfe_locator}
        Validate The Package Extras For The Addons

Test Case 6 : Validate Office Address In The Signup Success Page
   [Documentation]  This testcase is to validate office address in the Signup success page
   [Tags]      valid
        Purchase Shared Hosting Plan To Validate Office Address In Success Page   ${btn_shared_hosting_pro_plan_locator}    ${txt_new_domain_locator}  ${btn_new_domain_next_locator}  ${txt_new_domain_hfe_locator}  ${btn_new_domain_next_hfe_locator}

Test Case 7 : Validate Hosting Upgrade Flow
   [Documentation]  This testcase is to check upgrade flow of hosting
   [Tags]      valid
        Purchase Shared Hosting Plan With Select Domain Type  ${btn_shared_hosting_basic_plan_locator}  ${txt_new_domain_locator}  ${btn_new_domain_next_locator}  ${txt_new_domain_hfe_locator}  ${btn_new_domain_next_hfe_locator}
        Validate Hosting Upgrade

Test Case 8 : Validate Account Deletion From Service Monkey
   [Documentation]  This testcase is to validate account deletion from service monkey
   [Tags]      valid
        Purchase Shared Hosting Plan To Validate Office Address In Success Page   ${btn_shared_hosting_pro_plan_locator}    ${txt_new_domain_locator}  ${btn_new_domain_next_locator}  ${txt_new_domain_hfe_locator}  ${btn_new_domain_next_hfe_locator}
        Click On Service Monkey From Success Page And Validate
        Click On Cancel Link Under Service Monkey For Account Deletion And Validate