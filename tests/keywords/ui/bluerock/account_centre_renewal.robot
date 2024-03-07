*** Settings ***
Resource        ../../../../tests/keywords/ui/common.robot
Variables       ../../../../tests/locators/ui/bluerock/account_centre_renewal.py

*** Keywords ***
Validate Account Centre Renewal Flow
    [Documentation]  Keyword to validate renewal flow
        ${verify}=  Run Keyword And Return Status  Wait Until Page Contains Element  ${button_upsell_locator}  timeout=${EXPLICIT_TIMEOUT}
        Run Keyword If  '${verify}' == 'True'  Wait Until Page Contains Element And Click  ${button_upsell_locator}
        Wait Until Keyword Succeeds    3x   5s     Wait Until Page Contains Element And Click       ${icon_account_centre_profile_icon_locator}
        Wait Until Page Contains Element And Click      ${lnk_account_centre_product_section_locator}
        Sleep  15s
        Wait Until Page Contains Element And Click       ${btn_renew_locator}
        Wait Until Keyword Succeeds    3x   5s     Wait Until Page Contains Element And Click      ${txt_special_renewal_offer_locator}
        Run Keyword If  '${ENV}' == 'prod'   Adding Additional Wait Due To Rate Limiting

Enter The Card Details And Verify The Renewal Is Successful
     [Documentation]  Keyword to verify that renewal is successful
       Enter The Check Number And Click On Process Order Button
       Wait Until Keyword Succeeds     3x  5s     Wait Until Page Contains Element      ${lbl_product_purchased_locator}
       Page Should Contain Element       ${lbl_product_purchased_locator}