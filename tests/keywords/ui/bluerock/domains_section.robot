*** Settings ***
Resource        ../../../../tests/keywords/ui/common.robot
Resource        ../../../../tests/keywords/ui/bluerock/product_purchase.robot
Variables       ../../../../tests/locators/ui/bluerock/domain_section.py

*** Keywords ***
## Domains ##
Click On Domains Section Under Bluerock Panel
    [Documentation]  Keyword to select domains from bluerock panel
        Wait Until Keyword Succeeds  3x  5s      Wait Until Page Contains Element And Click      ${tablnk_user_domains_locator}
        Wait Until Page Contains Element And Click       ${lnk_user_domains_locator}
        Wait Until Keyword Succeeds  4x  2s  Wait Until Page Contains Element And Click      ${txt_purchase_domains_locator}
        Run Keyword If  '${ENV}' == 'prod'   Adding Additional Wait Due To Rate Limiting

Enter Random Domain Name For Domain In Mydomains Sectiom And Checkout
    [Documentation]   keyword to enter a random domain name for the domain purchase using mydomains
    [Arguments]  ${txt_domain_search_box_locator}   ${tld_extension_variable}=com
        ${random_domain_name}=   Create Random Domain Name      ${tld_extension_variable}
        Set Suite Variable   ${SUITE_RANDOM_DOMAIN_NAME}    ${random_domain_name}
        Input Text ${SUITE_RANDOM_DOMAIN_NAME} In ${txt_domain_search_box_locator}
        Wait Until Keyword Succeeds  5x  3s  Wait Until Page Contains Element And Click      ${btn_domain_add_locator}
        Wait Until Keyword Succeeds  5x  3s  Wait Until Page Contains Element And Click      ${btn_goto_checkout_locator}
        Run Keyword If  '${ENV}' == 'prod'   Adding Additional Wait Due To Rate Limiting

Validate Domain Purchase Through Bluerock Panel
    [Documentation]   Keyword is to validate domain purchase through bluerock panel
    [Arguments]  ${txt_domain_search_box_locator}   ${tld_extension_variable}=com
       Click On Domains Section Under Bluerock Panel
       Enter Random Domain Name For Domain In Mydomains Sectiom And Checkout       ${txt_domain_search_box_locator}    ${tld_extension_variable}
       Enter The Card Details And Verify The Product Is Purchased