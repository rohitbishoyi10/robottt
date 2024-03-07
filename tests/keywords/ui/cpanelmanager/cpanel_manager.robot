*** Settings ***
Resource        ../../../../tests/keywords/ui/common.robot
Variables       ../../../../tests/locators/ui/cpanelmanager/cpanel_manager.py

*** Keywords ***
Validate Cpanel Manager
    [Documentation]  Keyword to validate cpanel manager
        Wait Until Page Contains Element    ${txt_action_and_tools_locator}      timeout=${EXPLICIT_TIMEOUT}
        Wait Until Keyword Succeeds    3x   5s     Wait Until Page Contains Element And Click     ${txt_devs_locator}
        Wait Until Page Contains Element And Click    ${txt_db_query_locator}
        Go Back
        Wait Until Keyword Succeeds    3x   2s     Wait Until Page Contains Element And Click     ${btn_view_status_locator}
        Switch Window   locator=NEW
        Wait Until Keyword Succeeds    5x   5s     Wait Until Page Contains Element And Click     ${btn_update_reset_locator}
        Page Should Contain Element    ${txt_success_locator}                       timeout=${EXPLICIT_TIMEOUT}

Validate Icluster In CPM
    [Documentation]  this keyword is to validate icluster in cpm
       	Enter Roster Credentials And Login
       	Validate Cpanel Manager

Click On Service Monkey From Success Page And Validate
    [Documentation]  Keyword to click on service monkey from success page and validate
        Wait Until Page Contains Element    ${lbl_signup_purchase_success_locator}      timeout=${EXPLICIT_TIMEOUT}
        Wait Until Page Contains Element And Click   ${lnk_service_monkey_success_page_locator}
        Enter Roster Credentials And Login
        Run Keyword If  '${ENV}' == 'prod'   Adding Additional Wait Due To Rate Limiting

Click On Cancel Link Under Service Monkey For Account Deletion And Validate
    [Documentation]  Keyword to click on cancel link from service monkey for account deletion and validate
        Wait Until Keyword Succeeds    7x   5s    Wait Until Page Contains Element And Click   ${btn_service_monkey_cancel_locator}
        Wait Until Keyword Succeeds    5x   5s    Wait Until Page Contains Element And Click    ${drpdwn_cancel_reason_field_locator}
        Wait Until Keyword Succeeds    5x   5s    Scroll Element Into View Dynamically      ${drpdwn_cancel_reason_locator}          ${default_offset}
        Wait Until Keyword Succeeds    5x   5s    Wait Until Page Contains Element And Click    ${drpdwn_cancel_reason_locator}
        Wait Until Page Contains Element And Click     ${btn_service_monkey_submit_locator}
        Wait Until Keyword Succeeds    7x   5s    Wait Until Page Contains Element And Click    ${btn_add_product_gotocart_locator}
        Wait Until Keyword Succeeds    5x   3s    Select Frame      ${iframe_cpanel_queue_cart_locator}
        Enter Roster Credentials And Login
        Wait Until Keyword Succeeds    5x   5s    Scroll Element Into View Dynamically And Click    ${btn_continue_with_issue_credit_sm_locator}    ${default_offset}
        Wait Until Keyword Succeeds    5x   5s    Wait Until Page Contains Element And Click    ${btn_confirm_credit_locator}
        Wait Until Keyword Succeeds    7x   5s    Wait Until Page Contains Element       ${txt_account_deletion_success_locator}        timeout=${EXPLICIT_TIMEOUT}
        Run Keyword If  '${ENV}' == 'prod'   Adding Additional Wait Due To Rate Limiting
