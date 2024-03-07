*** Settings ***
Resource        ../../../../tests/keywords/ui/common.robot
Resource        ../../../../tests/testsuite/ui/signup/shared_hosting_newdomain_flow.robot
Variables       ../../../../tests/locators/ui/bluerock/product_purchase.py
Variables       ../../../../tests/locators/ui/bluerock/hosting_upgrade.py

*** Keywords ***
## Upgrade Flow ##
Validate Hosting Upgrade
    [Documentation]  validate upgrade flow of hosting
        Wait Until Keyword Succeeds    3x   5s     Wait Until Page Contains Element And Click       ${tablnk_user_marketplace_locator}
        Wait Until Keyword Succeeds    5x   5s     Wait Until Page Contains Element And Click       ${txt_hosting_upgrade_locator}
        Wait Until Keyword Succeeds    5x   5s    Wait Until Page Contains Element And Click      ${btn_choose_build_locator}
        Enter The Check Number And Click On Process Order Button
        Wait Until Keyword Succeeds     3x  5s     Wait Until Page Contains Element      ${lbl_product_purchased_locator}
        Page Should Contain Element        ${lbl_product_purchased_locator}                 timeout=${EXPLICIT_TIMEOUT}

