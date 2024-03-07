*** Settings ***
Resource               ../../tests/keywords/ui/common.robot
Variables              ../../tests/locators/fos_bluerock.py

*** Keywords ***
Login With Bluehost Credentials
    [Documentation]   keyword to login with the bluehost  login credentials
        Start Browser    ${login_url_category}   ${BROWSER}
        Wait Until Page Contains Element    ${hosting_login_username_locator}      timeout=${EXPLICIT_TIMEOUT}
        Input Text And Validate The Field    ${bh_login_domain}     ${hosting_login_username_locator}
        Sleep   3s
        Input Password And Validate The Field    ${bh_login_password}     ${hosting_login_password_locator}
        Wait Until Page Contains Element And Click    ${hosting_login_submit_locator}

Create Subdomain
     [Documentation]   keyword to create subdomain
        ${verify}=  Run Keyword And Return Status  Wait Until Page Contains Element  ${button_upsell_locator}  timeout=${EXPLICIT_TIMEOUT}
        Run Keyword If  '${verify}' == 'True'  Wait Until Page Contains Element And Click  ${button_upsell_locator}
        Sleep   3s
        Wait Until Page Contains Element And Click   ${domains_button_locator}
        Sleep   3s
        Wait Until Page Contains Element And Click   ${sub_domains_button_locator}
        Wait Until Page Contains Element And Click   ${button_add_sub_domain_first_locator}
        Input Text ${subdomain} In ${sub_domain_text_input_locator}
        Wait Until Page Contains Element And Click   ${select_domain_dropdown_locator}
        Wait Until Page Contains Element And Click   ${text_selc_locator}
        Wait Until Page Contains Element And Click   ${button_add_sub_domain_second_locator}
        Wait Until Element Is Visible    ${text_success_add_subdomain_locator}  timeout=${EXPLICIT_TIMEOUT}

Delete Subdomain
     [Documentation]   keyword to delete  the existing subdomain
        ${verify}=  Run Keyword And Return Status  Wait Until Page Contains Element  ${button_upsell_locator}  timeout=${EXPLICIT_TIMEOUT}
        Run Keyword If  '${verify}' == 'True'  Wait Until Page Contains Element And Click  ${button_upsell_locator}
        Wait Until Keyword Succeeds     5x  5s     Wait Until Page Contains Element And Click      ${domains_button_locator}
        Wait Until Page Contains Element And Click   ${sub_domains_button_locator}
        Wait Until Page Contains Element And Click   ${button_remove_sub_domain_locator}
        Wait Until Keyword Succeeds  3x  5s  Wait Until Page Contains Element And Click   ${button_delete_subdomain_locator}
        Wait Until Page Contains Element    ${text_success_del_subdomain_locator}      timeout=${EXPLICIT_TIMEOUT}