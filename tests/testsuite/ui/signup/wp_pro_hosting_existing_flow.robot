*** Settings ***
Documentation       Signup for a Bluehost WP Pro hosting plan
Test Setup          Test Setup To Start Browser And To Change Preferred Currency    ${landingpage_url_category}
Test Teardown       Close All Browsers
Force Tags          hosting  wppro  existingdomain

Resource           ../../../../tests/keywords/ui/signup/bh_signup.robot

*** Test Cases ***
Test Case 1 : Buy WP Pro Hosting Plan Test Case For Existing Flow For Build Plan
   [Documentation]  This testcase is to check the wp hosting existing build plan flow
   [Tags]      valid
        Purchase WP Pro Hosting Plan With Select Domain Type      ${btn_wordpress_build_plan_locator}    ${txt_existing_domain_locator}    ${btn_existing_domain_next_locator}  ${txt_new_domain_hfe_locator}  ${btn_new_domain_next_hfe_locator}


Test Case 2 : Buy WP Pro Hosting Plan Test Case For Existing Flow For Grow Plan
   [Documentation]  This testcase is to check the wp hosting existing grow plan flow
   [Tags]      valid
        Purchase WP Pro Hosting Plan With Select Domain Type      ${btn_wordpress_grow_plan_locator}   ${txt_existing_domain_locator}  ${btn_existing_domain_next_locator}    ${txt_new_domain_hfe_locator}  ${btn_new_domain_next_hfe_locator}


Test Case 3 : Buy WP Pro Hosting Plan Test Case For Existing Flow For Scale Plan
   [Documentation]  This testcase is to check the wp hosting existing scale plan flow
   [Tags]      valid
        Purchase WP Pro Hosting Plan With Select Domain Type      ${btn_wordpress_scale_plan_locator}   ${txt_existing_domain_locator}  ${btn_existing_domain_next_locator}    ${txt_new_domain_hfe_locator}  ${btn_new_domain_next_hfe_locator}
