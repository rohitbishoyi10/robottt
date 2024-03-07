*** Settings ***
Resource        ../../../../tests/keywords/ui/common.robot
Variables       ../../../../tests/locators/ui/bluerock/plugin_purchase.py
Variables       ../../../../tests/locators/ui/bluerock/product_purchase.py
Variables       ../../../../tests/variables/ui/bluerock/plugin_purchase.py

*** Keywords ***
## Plugin Purchase ##
Click On Plugins Link And Validate Plugins Section
    [Documentation]  Keyword to validate plugins section
        ${verify}=  Run Keyword And Return Status  Wait Until Page Contains Element  ${button_upsell_locator}  timeout=${EXPLICIT_TIMEOUT}
        Run Keyword If  '${verify}' == 'True'  Wait Until Page Contains Element And Click  ${button_upsell_locator}
        Wait Until Keyword Succeeds    3x   5s     Wait Until Page Contains Element And Click      ${tablnk_user_marketplace_locator}
        Wait Until Keyword Succeeds    3x   5s     Wait Until Page Contains Element And Click      ${tablnk_markeplace_wordpress_plugins_locator}
        Wait Until Page Contains Element     ${txt_product_addons_plugin_locator}          timeout=${EXPLICIT_TIMEOUT}
        Wait Until Page Contains Element     ${txt_woocommerce_paid_plugins_locator}         timeout=${EXPLICIT_TIMEOUT}

Purchase Plugins Plans And Validate
    [Documentation]  Keyword to validate purchase of plugin
    [Arguments]      ${plugins_variable}
        Run Keyword If   '${plugins_variable}' == 'Product Vendors'    Wait Until Page Contains Element And Click    ${txt_product_vendors_plugin_locator}
        Run Keyword If   '${plugins_variable}' == 'Product Addons'     Wait Until Page Contains Element And Click    ${txt_product_addons_plugin_locator}
        Run Keyword If   '${plugins_variable}' == 'WooCommerce Paid Courses'    Wait Until Page Contains Element And Click    ${txt_woocommerce_paid_plugins_locator}
        Wait Until Page Contains Element And Click    ${btn_buy_now_locator}
        Enter The Check Number And Click On Process Order Button
        Wait Until Keyword Succeeds    3x   5s     Wait Until Page Contains Element     ${txt_thank_you_locator}       timeout=${SHORT_EXPLICIT_TIMEOUT}