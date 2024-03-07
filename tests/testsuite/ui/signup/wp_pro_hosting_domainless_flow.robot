*** Settings ***
Documentation       Signup for a Bluehost WP Pro hosting plan
Test Setup          Test Setup To Start Browser And To Change Preferred Currency    ${landingpage_url_category}
Test Teardown       Close All Browsers

Resource           ../../../../tests/keywords/ui/signup/bh_signup.robot

*** Test Cases ***
Test Case 1 : Buy WP Pro Hosting Plan Test Case For Domainless Flow For Build Plan
   [Documentation]  This testcase is to check the wp hosting domainless build plan flow
   [Tags]      valid  hosting  wppro  domainless
       Purchase WP Pro Hosting Plan With Domainless Flow   ${btn_wordpress_build_plan_locator}


Test Case 2 : Buy WP Pro Hosting Plan Test Case For Domainless Flow For Grow Plan
   [Documentation]  This testcase is to check the wp hosting domainless grow plan flow
   [Tags]      valid  hosting  wppro  domainless
       Purchase WP Pro Hosting Plan With Domainless Flow     ${btn_wordpress_grow_plan_locator}


Test Case 3 : Buy WP Pro Hosting Plan Test Case For Domainless Flow For Scale Plan
   [Documentation]  This testcase is to check the wp hosting domainless scale plan flow
   [Tags]      valid  hosting  wppro  domainless
       Purchase WP Pro Hosting Plan With Domainless Flow     ${btn_wordpress_scale_plan_locator}