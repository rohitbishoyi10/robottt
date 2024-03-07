*** Settings ***
Resource        ../../../../tests/keywords/ui/common.robot
Variables       ../../../../tests/locators/ui/bluerock/product_purchase.py

*** Keywords ***
## Addons ##
Select Addons From Markeplace To Proceed With Purchase Flow
    [Documentation]  Keyword to select addons from marketplace
    [Arguments]   ${shop_addon_locator}   ${addon_buy_now}   ${plan_locator}
        ${verify}=  Run Keyword And Return Status  Wait Until Page Contains Element  ${button_upsell_locator}  timeout=${EXPLICIT_TIMEOUT}
        Run Keyword If  '${verify}' == 'True'  Wait Until Page Contains Element And Click  ${button_upsell_locator}
        Click On Marketplace And Select The Shop Addon Button And Validate
        Wait Until Page Contains Element And Click      ${shop_addon_locator}
        Switch Window   locator=NEW
        Scroll Element Into View Dynamically       ${addon_buy_now}            ${default_offset}
        Wait Until Page Contains Element And Click    ${plan_locator}
        Run Keyword If  '${ENV}' == 'prod'   Adding Additional Wait Due To Rate Limiting

Click On Marketplace And Select The Shop Addon Button And Validate
    [Documentation]  Keyword to click on the marketplace and navigate to shop addons
        ${verify}=  Run Keyword And Return Status  Wait Until Page Contains Element  ${button_upsell_locator}  timeout=${EXPLICIT_TIMEOUT}
        Run Keyword If  '${verify}' == 'True'  Wait Until Page Contains Element And Click  ${button_upsell_locator}
        Wait Until Keyword Succeeds    3x   5s     Wait Until Page Contains Element And Click       ${tablnk_user_marketplace_locator}
        Wait Until Keyword Succeeds    3x   5s     Wait Until Page Contains Element And Click       ${btn_user_shop_addon_locator}
        Run Keyword If  '${ENV}' == 'prod'   Adding Additional Wait Due To Rate Limiting

Enter The Card Details And Verify The Product Is Purchased
     [Documentation]  Keyword to verify that product is purchased
       Enter The Check Number And Click On Process Order Button
       Wait Until Keyword Succeeds     3x  5s     Wait Until Page Contains Element      ${lbl_product_purchased_locator}
       Page Should Contain Element        ${lbl_product_purchased_locator}                 timeout=${EXPLICIT_TIMEOUT}
       Run Keyword If  '${ENV}' == 'prod'   Adding Additional Wait Due To Rate Limiting

Suite Setup For Product Purchase
    [Documentation]  This keyword is a test setup for product purchase test cases
        Test Setup To Start Browser And To Change Preferred Currency    ${landingpage_url_category}
        Purchase Shared Hosting Plan With Select Domain Type        ${btn_shared_hosting_basic_plan_locator}   ${txt_new_domain_locator}  ${btn_new_domain_next_locator}  ${txt_new_domain_hfe_locator}  ${btn_new_domain_next_hfe_locator}

Purchase Flow Of Addons From Addons Section
    [Documentation]  Keyword to select addons from marketplace to buy dp and WPlive
    [Arguments]   ${shop_addon_locator}   ${terms_locator}   ${addon_buy_now}
       ${verify}=  Run Keyword And Return Status  Wait Until Page Contains Element  ${button_upsell_locator}  timeout=${EXPLICIT_TIMEOUT}
        Run Keyword If  '${verify}' == 'True'  Wait Until Page Contains Element And Click  ${button_upsell_locator}
        Click On Marketplace And Select The Shop Addon Button And Validate
        Wait Until Page Contains Element And Click      ${shop_addon_locator}
        Sleep   5s
        Wait Until Page Contains Element And Click      ${terms_locator}
        Scroll Element Into View Dynamically         ${addon_buy_now}            ${default_offset}
        Wait Until Keyword Succeeds     5x  5s     Wait Until Page Contains Element And Click       ${addon_buy_now}
        Run Keyword If  '${ENV}' == 'prod'   Adding Additional Wait Due To Rate Limiting

Validate Free Product Purchase Of Constant Contact
     [Documentation]  Keyword to verify the free product purchase
        Scroll Element Into View Dynamically       ${btn_process_order_locator}            ${default_offset}
        Wait Until Keyword Succeeds    5x   5s     Wait Until Page Contains Element And Click        ${btn_process_order_locator}
        Wait Until Keyword Succeeds     3x  5s     Wait Until Page Contains Element      ${lbl_product_purchased_locator}
        Page Should Contain Element        ${lbl_product_purchased_locator}                 timeout=${EXPLICIT_TIMEOUT}
        Run Keyword If  '${ENV}' == 'prod'   Adding Additional Wait Due To Rate Limiting
