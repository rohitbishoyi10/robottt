*** Settings ***
Documentation       Signup for Bluehost WP Pro hosting plan using new domain
Test Setup          Test Setup To Start Browser And To Change Preferred Currency    ${landingpage_url_category}
Test Teardown       Close All Browsers
Force Tags          hosting  wppro  newdomain

Resource           ../../../../tests/keywords/ui/signup/bh_signup.robot

*** Test Cases ***
Test Case 1 : Buy WP Pro Hosting Plan Test Case For New Domain Flow For Build Plan
   [Documentation]  This testcase is to check the wp pro hosting for new domain flow for build plan
   [Tags]      valid
        Purchase WP Pro Hosting Plan With Select Domain Type      ${btn_wordpress_build_plan_locator}  ${txt_new_domain_locator}  ${btn_new_domain_next_locator}  ${txt_new_domain_hfe_locator}  ${btn_new_domain_next_hfe_locator}


Test Case 2 : Buy WP Pro Hosting Plan Test Case For New Domain Flow For Grow Plan
   [Documentation]  This testcase is to check the wp pro hosting for new domain flow for grow plan
   [Tags]      valid
        Purchase WP Pro Hosting Plan With Select Domain Type     ${btn_wordpress_grow_plan_locator}  ${txt_new_domain_locator}  ${btn_new_domain_next_locator}  ${txt_new_domain_hfe_locator}  ${btn_new_domain_next_hfe_locator}


Test Case 3 : Buy WP Pro Hosting Plan Test Case For New Domain Flow For Scale Plan
   [Documentation]  This testcase is to check the wp pro hosting for new domain flow for scale plan
   [Tags]      valid
        Purchase WP Pro Hosting Plan With Select Domain Type     ${btn_wordpress_scale_plan_locator}  ${txt_new_domain_locator}  ${btn_new_domain_next_locator}  ${txt_new_domain_hfe_locator}  ${btn_new_domain_next_hfe_locator}
