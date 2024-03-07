*** Settings ***
Documentation       Validate plugins purchase for bluehost india from cart page
Test Setup          Login To Bluerock Panel And Verify Successful Login     ${bh_domain_login_cred}     ${bh_login_password}
Test Teardown       Close All Browsers
Force Tags          ui  prod   valid   pluginpurchase

Resource            ../../../../tests/keywords/ui/bluerock/plugin_purchase.robot
Resource            ../../../../tests/keywords/ui/bluerock/product_purchase.robot

*** Test Cases ***
Test Cases 1 : Testcase To Verify Purchase Of Product Vendors Plugin
    [Documentation]  This test case is to purchase product vendors plugin
       Click On Plugins Link And Validate Plugins Section
       Purchase Plugins Plans And Validate     ${product_vendors_variable}

Test Cases 2 : Testcase To Verify Purchase Of Product Addons Plugin
    [Documentation]  This test case is to purchase product addons plugin
       Click On Plugins Link And Validate Plugins Section
       Purchase Plugins Plans And Validate     ${product_addons_variable}

Test Cases 3 : Testcase To Verify Purchase Of Woocommerce Paid Courses Plugin
    [Documentation]  This test case is to purchase woocommerce paid courses plugin
       Click On Plugins Link And Validate Plugins Section
       Purchase Plugins Plans And Validate     ${wooCommerce_paid_courses_variable}