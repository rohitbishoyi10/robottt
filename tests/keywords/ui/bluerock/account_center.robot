*** Settings ***
Resource        ../../../../tests/keywords/ui/common.robot
Variables       ../../../../tests/locators/fos_bluerock.py
Variables       ../../../../tests/variables/ui/bluerock/account_center.py

*** Keywords ***
Account Center Validation
    [Documentation]  Keyword to perform account center validation
        Expand Profile Section & Validate Account Center
        Enter Details In Contact Information Section & Save
        Enter Details In Billing Section & Save
        Security Section Validation

Expand Profile Section & Validate Account Center
    [Documentation]  Keyword to expand profile section & Validate account center
        Wait Until Element Is Visible       ${text_avtar_initial_text_locator}     timeout=${EXPLICIT_TIMEOUT}
        ${verify}=  Run Keyword And Return Status  Wait Until Page Contains Element  ${button_upsell_locator}  timeout=${EXPLICIT_TIMEOUT}
        Run Keyword If  '${verify}' == 'True'  Wait Until Page Contains Element And Click  ${button_upsell_locator}
        Sleep   3s
        Click Element       ${text_avtar_initial_text_locator}
        Click Element       ${button_profile_locator}
        Sleep   3s
        Wait Until Element Is Visible       ${text_my_account_center_locator}     timeout=${EXPLICIT_TIMEOUT}

Enter Details In Contact Information Section & Save
    [Documentation]  Keyword to enter details in contact information section
        Wait Until Element Is Visible       ${field_first_name_locator}     timeout=${EXPLICIT_TIMEOUT}
        Input Text  ${field_first_name_locator}  ${first_name}
        Input Text  ${field_last_name_locator}  ${last_name}
        Input Text  ${field_company_name_locator}  ${company_name}
        Input Text  ${field_street_address_locator}  ${street_address}
        Input Text  ${field_city_locator}  ${city}
        Wait Until Page Contains Element And Click    ${list_country_locator}
        Wait Until Page Contains Element And Click    ${list_country_select_locator}
        Wait Until Page Contains Element And Click    ${list_state_locator}
        Wait Until Page Contains Element And Click    ${list_state_select_locator}
        Input Text  ${field_zip_locator}  ${zip_code}
        Input Text  ${field_phone_locator}  ${phone_number}
        Input Text  ${field_email_locator}  ${email_address}
        Click Element       ${button_update_locator}
        Wait Until Element Is Visible        ${text_update_message_locator}  timeout=${EXPLICIT_TIMEOUT}
        Reload Page

Enter Details In Billing Section & Save
     [Documentation]  Keyword to enter details in billing section
        Wait Until Page Contains Element And Click       ${tab_billing_locator}
        Wait Until Element Is Visible        ${field_first_name_billing_locator}  timeout=${EXPLICIT_TIMEOUT}
        Input Text  ${field_first_name_billing_locator}  ${first_name}
        Input Text  ${field_last_name_billing_locator}  ${last_name}
        Input Text  ${field_street_address_billing_locator}  ${street_address}
        Input Text  ${field_city_billing_locator}  ${city}
        Wait Until Page Contains Element And Click    ${list_billing_state_locator}
        Wait Until Page Contains Element And Click    ${list_billing_state_select_locator}
        Wait Until Page Contains Element And Click    ${list_billing_country_locator}
        Wait Until Page Contains Element And Click    ${list_billing_country_select_locator}
        Input Text  ${field_zip_billing_locator}  ${zip_code}
        Click Element       ${button_billing_update_locator}
        Wait Until Element Is Visible        ${text_success_billing_locator}  timeout=${EXPLICIT_TIMEOUT}
        Reload Page

Security Section Validation
     [Documentation]  Keyword to validate security section
       Wait Until Page Contains Element And Click       ${tab_security_locator}
       Wait Until Page Contains Element And Click       ${button_change_password_locator}
       Wait Until Element Is Visible        ${text_main_password_locator}  timeout=${EXPLICIT_TIMEOUT}