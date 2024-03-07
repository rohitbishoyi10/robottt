*** Settings ***
Documentation       Validate addons purchase for bluehost india from cart page
Suite Setup         Suite Setup For Product Purchase
Test Setup          Login To Bluerock Panel And Verify Successful Login   ${SUITE_RANDOM_DOMAIN_NAME}    ${SUITE_RANDOM_HOSTING_PASSWORD_VARIABLE}
Test Teardown       Close All Browsers
Force Tags          ui  prod   valid   critical    productpurchase

Resource            ../../../../tests/keywords/ui/bluerock/product_purchase.robot

*** Test Cases ***
Test Case 1 : To Check The Product Purchase Market Place For Codeguard
    [Documentation]  This test case is to check product purchase from marketplace for codeguard  flow
        Select Addons From Markeplace To Proceed With Purchase Flow   ${lnk_shpaddon_bh_cg_locator}    ${btn_addon_cg_buy_now_locator}    ${btn_cg_basic_plan_locator}
        Enter The Card Details And Verify The Product Is Purchased

Test Case 2 : To Check The Product Purchase For Market Place Using SEO Tools
    [Documentation]  This test case is to check product purchase from marketplace for SEO tools flow
        Select Addons From Markeplace To Proceed With Purchase Flow    ${lnk_shpaddon_bh_seo_locator}    ${btn_addon_seo_buy_now_locator}    ${btn_addon_grow_plan_locator}
        Enter The Card Details And Verify The Product Is Purchased

Test Case 3 : To Check The Product Purchase Market Place For Domain Privacy
    [Documentation]  This test case is to check product purchase from marketplace for domain privacy flow
        Purchase Flow Of Addons From Addons Section       ${lnk_shpaddon_bh_dp_prot_locator}      ${chkbx_dp_prot_terms_locator}       ${btn_dp_prot_buy_now_locator}
        Enter The Card Details And Verify The Product Is Purchased

Test Case 4 : To Check The Product Purchase Market Place For Dedicated IP
    [Documentation]  This test case is to check product purchase from marketplace for dedicated IP flow
        Select Addons From Markeplace To Proceed With Purchase Flow    ${lnk_shpaddon_bh_dedicated_ip_locator}    ${btn_order_buy_now_dedicated_ip_locator}    ${btn_dedicated_ip_plan_locator}
        Enter The Card Details And Verify The Product Is Purchased

Test Case 5 : To Check The Product Purchase Market Place For WPlive
    [Documentation]  This test case is to check product purchase from marketplace for WPlive flow
        Purchase Flow Of Addons From Addons Section       ${btn_shpaddon_wp_live_locator}      ${chkbx_wplive_terms_locator}    ${btn_wplive_add_to_cart_locator}
        Enter The Card Details And Verify The Product Is Purchased

Test Case 6 : To Check The Product Purchase Market Place For Constant Contact
    [Documentation]  This test case is to check product purchase from marketplace for CC flow
        Purchase Flow Of Addons From Addons Section       ${btn_shpaddon_constant_contact_locator}    ${chkbx_dp_prot_terms_locator}    ${btn_free_trial_3_months_locator}
        Validate Free Product Purchase Of Constant Contact