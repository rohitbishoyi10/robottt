*** Settings ***
Documentation       Validate domains under mydomains section in marketplace
Test Setup          Login To Bluerock Panel And Verify Successful Login     ${bh_domain_login_cred}     ${bh_login_password}
Test Teardown       Logout from Bluerock cPanel
Force Tags          ui  prod   valid   critical    domainpurchase

Resource            ../../../../tests/keywords/ui/bluerock/domains_section.robot

*** Test Cases ***
Test Case 1 : To Check The Domain Purchase From Mydomains Page
    [Documentation]  This test case is to check domain purchase from mydomains section
       Validate Domain Purchase Through Bluerock Panel        ${txt_domain_search_box_locator}

Test Case 2 : To Check The Domain Purchase From Mydomains Page For .Org Extension
    [Documentation]  This test case is to check domain purchase from mydomains section for .org extention
        Validate Domain Purchase Through Bluerock Panel      ${txt_domain_search_box_locator}    ${org_extension_variable}

Test Case 3 : To Check The Domain Purchase From Mydomains Page For .net Extension
    [Documentation]  This test case is to check domain purchase from mydomains section for .net extention
       Validate Domain Purchase Through Bluerock Panel      ${txt_domain_search_box_locator}    ${net_extension_variable}