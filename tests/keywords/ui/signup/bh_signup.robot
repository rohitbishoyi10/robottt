*** Settings ***
Resource           ../common.robot

*** Keywords ***
Enter Roster Credentials And Login
    [Documentation]  this keyword will update the data on internal AD page
        Wait Until Page Contains Element       ${bh_ad_username_locator}
        Input Text  ${bh_ad_username_locator}  ${BH_AD_USERNAME_VARIABLE}
        Input Text  ${bh_ad_pwd_locator}       ${BH_AD_PASSWORD_VARIABLE}
        Click Element  ${bh_submit_locator}

Select Domain Later Option In Domain Select Page
    [Documentation]  this keyword will perform action to click domainless flow
        Wait Until Page Contains Element    ${link_domainless_locator}         timeout=${EXPLICIT_TIMEOUT}
        Click element  ${link_domainless_locator}

Update And Validate Account Information In Billing Page
    [Documentation]  this keyword will account information on billing page
        Wait Until Page Contains Element       ${select_selfdestruct_locator}                 timeout=${EXPLICIT_TIMEOUT}
        Select From List By Value    ${select_selfdestruct_locator}     ${auto_self_destruct_variable}
        Select The Value By Label With Explicit Wait    ${select_auto_form_fill_locator}   ${auto_form_fill_variable}
        Validate All The Account Information
        Enter The Check Number And Click On Submit Button

Validate All The Account Information
    [Documentation]  this keyword will validate the account information
        Wait Until Page Contains Element        ${txt_acc_info_firstname_locator}       timeout=${EXPLICIT_TIMEOUT}
        Validate Text Field Content    ${acc_info_firstname_variable}   ${txt_acc_info_firstname_locator}
        Validate Text Field Content    ${acc_info_lastname_variable}    ${txt_acc_info_lastname_locator}
        Validate Text Field Content    ${acc_info_business_variable}    ${txt_acc_info_company_locator}
        Validate Select List Type Content    ${acc_info_country_variable}    ${txt_acc_info_country_locator}
        Validate Text Field Content    ${acc_info_street_address_variable}    ${txt_acc_info_streetadd_locator}
        Validate Text Field Content    ${acc_info_city_variable}     ${txt_acc_info_city_locator}
        Validate Select List Type Content   ${acc_info_state_variable}     ${drp_acc_info_stateName_locator}
        Validate Text Field Content    ${acc_info_pincode_variable}      ${txt_acc_info_pincode_locator}
        ${random_email}=    Generate Random Username
        Input Text ${random_email} In ${txt_acc_info_emailId_locator}
        Validate Text Field Content    ${random_email}   ${txt_acc_info_emailId_locator}

Click On Basic Plan Under Shared Hosting And Validate
   [Documentation]  this keyword will perform action to select the plan
        Click Element  ${btn_shared_hosting_basic_plan_locator}
        Page Should Contain Element    ${bh_ad_username_locator}          timeout=${EXPLICIT_TIMEOUT}

Purchase Woocommerce Hosting Plan With Select Domain Type
    [Documentation]  this keyword will purchase woocommerce hosting and validate the bluerock after successful login
    [Arguments]   ${hosting_plan}   ${domain_type_locator}   ${domain_next_locator}  ${domain_type_hfe_locator}   ${domain_next_hfe_locator}
        Navigate To Woocommerce Hosting And Select Plan  ${hosting_plan}
        Check If Signup Flow Is Legacy Or HFE  ${domain_type_locator}  ${domain_next_locator}  ${domain_type_hfe_locator}   ${domain_next_hfe_locator}

Purchase Shared Hosting Plan With Select Domain Type
    [Documentation]  this keyword will purchase shared hosting and validate the bluerock after successful login
    [Arguments]   ${hosting_plan}   ${domain_type_locator}   ${domain_next_locator}  ${domain_type_hfe_locator}   ${domain_next_hfe_locator}
        Navigate To Shared Hosting And Select Plan   ${hosting_plan}
        Check If Signup Flow Is Legacy Or HFE  ${domain_type_locator}  ${domain_next_locator}  ${domain_type_hfe_locator}  ${domain_next_hfe_locator}

Purchase Shared Hosting Plan To Validate Office Address In Success Page
    [Documentation]  this keyword will purchase shared hosting and validate the bluerock after successful login
    [Arguments]   ${hosting_plan}   ${domain_type_locator}   ${domain_next_locator}  ${domain_type_hfe_locator}   ${domain_next_hfe_locator}
        Navigate To Shared Hosting And Select Plan   ${hosting_plan}
        Check If Signup Flow Is Legacy Or HFE To Validate Office Address In Success Page    ${domain_type_locator}  ${domain_next_locator}  ${domain_type_hfe_locator}  ${domain_next_hfe_locator}

Check If Signup Flow Is Legacy Or HFE
    [Documentation]  this keyword will check if the signup flow is legacy or HFE
    [Arguments]   ${domain_type_locator}  ${domain_next_locator}  ${domain_type_hfe_locator}   ${domain_next_hfe_locator}
        ${signup_url}=      Get Location
        ${flow_type}=  Run Keyword And Return Status       Should Contain    ${signup_url}    registration
        Run Keyword If  '${flow_type}' == 'True'  HFE Hosting Signup Flow  ${domain_type_hfe_locator}   ${domain_next_hfe_locator}
        Run Keyword If  '${flow_type}' == 'False'  Legacy Hosting Signup Flow  ${domain_type_locator}   ${domain_next_locator}

Legacy Hosting Signup Flow
    [Documentation]  this keyword is to complete the signup purchase with legacy flow
    [Arguments]  ${domain_type_locator}   ${domain_next_locator}
       	Enter Roster Credentials And Login
       	Create Random Domain Account Along With Select Domain Type And Click On Next  ${domain_type_locator}   ${domain_next_locator}
       	Update And Validate Account Information In Billing Page
       	Validate The Signup Success And Validate Onboarding And Bluerock Home Page

Legacy Hosting Signup Flow To Validate Address In The Success Page
    [Documentation]  this keyword is to complete the signup purchase with legacy flow and to validate office address in success page
    [Arguments]  ${domain_type_locator}   ${domain_next_locator}
       	Enter Roster Credentials And Login
       	Create Random Domain Account Along With Select Domain Type And Click On Next  ${domain_type_locator}   ${domain_next_locator}
       	Update And Validate Account Information In Billing Page
       	Validate Office Address In the Signup Sucess Page

Check If Signup Flow Is Legacy Or HFE To Validate Office Address In Success Page
    [Documentation]  this keyword will check if the signup flow is legacy or HFE and will validate the success page
    [Arguments]   ${domain_type_locator}  ${domain_next_locator}  ${domain_type_hfe_locator}   ${domain_next_hfe_locator}
        ${signup_url}=      Get Location
        ${flow_type}=  Run Keyword And Return Status       Should Contain    ${signup_url}    registration
        Run Keyword If  '${flow_type}' == 'True'  HFE Hosting Signup Flow  ${domain_type_hfe_locator}   ${domain_next_hfe_locator}
        Run Keyword If  '${flow_type}' == 'False'  Legacy Hosting Signup Flow To Validate Address In The Success Page   ${domain_type_locator}   ${domain_next_locator}

Purchase WP Pro Hosting Plan With Select Domain Type
    [Documentation]  this keyword will purchase wppro hosting and validate the bluerock after successful login
    [Arguments]   ${hosting_plan}   ${domain_type_locator}   ${domain_next_locator}  ${domain_type_hfe_locator}   ${domain_next_hfe_locator}
        Navigate To WP Hosting And Select Plan   ${hosting_plan}
        Check If Signup Flow Is Legacy Or HFE  ${domain_type_locator}  ${domain_next_locator}  ${domain_type_hfe_locator}   ${domain_next_hfe_locator}

HFE Hosting Signup Flow
    [Documentation]  this keyword is to complete the signup purchase with HFE flow
    [Arguments]  ${domain_type_hfe_locator}   ${domain_next_hfe_locator}
        Create Random Domain Account Along With Select Domain Type And Click On Next  ${domain_type_hfe_locator}   ${domain_next_hfe_locator}
        Continue To Account Information In Billing Page To Update And Validate For HFE Flow
        Enter PayU Credit Card Details And Click On Pay Now
        Validate The Signup Success On HFE FLow And Validate Onboarding And Bluerock Home Page

Navigate To Shared Hosting And Select Plan
    [Documentation]  this keyword will navigate to shared hosting plan from homepage
    [Arguments]   ${hosting_plan}
        Mouse Over  ${link_hosting_locator}
        Wait Until Page Contains Element    ${lbl_shared_hosting_locator}
        Click element      ${lbl_shared_hosting_locator}
        Wait Until Page Contains Element    ${btn_get_started_locator}
        Click Button    ${btn_get_started_locator}
        Click Element  ${hosting_plan}

Navigate To Woocommerce Hosting And Select Plan
    [Documentation]  this keyword will navigate to woocommerce hosting plan from homepage
    [Arguments]  ${hosting_plan}
        Wait Until Page Contains Element And Click  ${btn_accept_cookies_locator}
        Mouse Over  ${drpdown_wordpress_header_locator}
        Wait Until Page Contains Element And Click  ${lbl_woocommerce_choose_plan_locator}
        Wait Until Page Contains Element And Click  ${btn_start_your_store_locator}
        Wait Until Page Contains Element And Click  ${hosting_plan}

Create Random Domain Account Along With Select Domain Type And Click On Next
    [Documentation]   this keyword to enter a random domain name and click on next in the signup page
        [Arguments]   ${domain_type_locator}   ${domain_next_locator}
        ${random_domain_name}=   Generate Random Website Name
        Set Suite Variable   ${SUITE_RANDOM_DOMAIN_NAME}    ${random_domain_name}
        Wait until page contains element   ${domain_type_locator}             timeout=${EXPLICIT_TIMEOUT}
        Input Text ${SUITE_RANDOM_DOMAIN_NAME} In ${domain_type_locator}
        Wait Until Keyword Succeeds  4x  2s  Wait Until Page Contains Element And Click      ${domain_next_locator}


Navigate To WP Hosting And Select Plan
    [Documentation]  this keyword will navigate to wp pro hosting plan from homepage
    [Arguments]   ${hosting_plan}
        Mouse Over  ${drpdown_wordpress_header_locator}
        Wait Until Page Contains Element    ${lnk_wordpress_wp_pro_header_locator}        timeout=${EXPLICIT_TIMEOUT}
        Click element      ${lnk_wordpress_wp_pro_header_locator}
        Wait Until Page Contains Element    ${btn_wppro_choose_plan_locator}              timeout=${EXPLICIT_TIMEOUT}
        Click Button    ${btn_wppro_choose_plan_locator}
        Click Element  ${hosting_plan}
        Page Should Contain Element    ${bh_ad_username_locator}          timeout=${EXPLICIT_TIMEOUT}

Purchase WP Pro Hosting Plan With Domainless Flow
    [Documentation]  this keyword will purchase wp pro hosting and validate the bluerock after successful login
    [Arguments]   ${hosting_plan}
       Navigate To WP Hosting And Select Plan   ${hosting_plan}
       Enter Roster Credentials And Login
       Select Domain Later Option In Domain Select Page
       Update And Validate Account Information In Billing Page
       Validate The Signup Success And Validate Onboarding And Bluerock Home Page

Purchase Woocommerce Hosting Plan With Domainless Flow
    [Documentation]  this keyword will purchase woocommerce hosting and validate the bluerock after successful login
    [Arguments]   ${hosting_plan}
       Navigate To Woocommerce Hosting And Select Plan   ${hosting_plan}
       Enter Roster Credentials And Login
       Select Domain Later Option In Domain Select Page
       Update And Validate Account Information In Billing Page
       Validate The Signup Success And Validate Onboarding And Bluerock Home Page

Purchase Shared Hosting Plan With Domainless Flow
    [Documentation]  this keyword will purchase shared hosting and validate the bluerock after successful login
    [Arguments]   ${hosting_plan}
        Navigate To Shared Hosting And Select Plan   ${hosting_plan}
        Enter Roster Credentials And Login
        Select Domain Later Option In Domain Select Page
        Update And Validate Account Information In Billing Page
        Validate The Signup Success And Validate Onboarding And Bluerock Home Page

### HFE Flow ###
Continue To Account Information In Billing Page To Update And Validate For HFE Flow
    [Documentation]  this keyword will continue update and valiate account information
        Sleep   3s
        Custom Run Keyword If Element Present And Click  ${btn_domain_select_continue_locator}
        Wait Until Page Contains Element    ${txt_create_account_hfe_locator}        timeout=${EXPLICIT_TIMEOUT}
        Input All The Account Information For HFE Flow

Input All The Account Information For HFE Flow
    [Documentation]  this keyword will input all the account information for HFE flow
        Wait Until Page Contains Element  ${txt_acc_info_firstname_locator}  timeout=${EXPLICIT_TIMEOUT}
        Input Text  ${txt_acc_info_firstname_locator}  ${acc_info_firstname_variable}
        Input Text  ${txt_acc_info_lastname_locator}  ${acc_info_lastname_variable}
        ${random_email}=    Generate Random Username
        Input Text  ${txt_acc_info_emailId_locator}  ${random_email}
        Validate Text Field Content    ${random_email}   ${txt_acc_info_emailId_locator}
        Select From List By Value    ${txt_acc_info_country_hfe_locator}  ${acc_info_country_variable}
        Input Text  ${txt_acc_info_phoneNo_locator}  ${acc_info_phone_variable}
        Input Text  ${txt_acc_info_streetadd_hfe_locator}  ${acc_info_street_address_variable}
        Input Text  ${txt_acc_info_city_locator}  ${acc_info_city_variable}
        Select From List By Value    ${drp_acc_info_stateName_hfe_locator}  ${acc_info_state_variable}
        Input Text  ${txt_acc_info_pincode_hfe_locator}  ${acc_info_pincode_variable}
        Capture Page Screenshot
        Wait Until Page Contains Element  ${txt_hostingplan_and_addons_locator}  timeout=${EXPLICIT_TIMEOUT}
        Capture Page Screenshot
        Wait Until Keyword Succeeds  3x  2s  Wait Until Page Contains Element And Click  ${btn_acc_info_submit_locator}

Validate The Signup Success On HFE FLow And Validate Onboarding And Bluerock Home Page
    [Documentation]  this keyword will validate the success signup, complete onboarding and login to bluerock
        Wait Until Page Contains Element  ${lbl_signup_purchase_success_hfe_locator}  timeout=${EXPLICIT_TIMEOUT}
        Scroll Element Into View  ${btn_signup_create_account_hfe_locator}
        Wait Until Page Contains Element And Click  ${btn_signup_create_account_hfe_locator}
        Enter Roster Credentials And Login
        Enter Password In Create Password Section And Validate Home Page
        Skipping Onboarding Steps And To Verify Bh Home Page

### PayU Payment Method ###
Enter PayU Credit Card Details And Click On Pay Now
    [Documentation]   this keyword will enter payu credit card details and click on pay now button
        Wait Until Page Contains Element  ${txt_payu_credit_payment_option_locator}  timeout=${EXPLICIT_TIMEOUT}
        Wait Until Page Contains Element And Click  ${txt_payu_credit_payment_option_locator}
        Wait Until Page Contains Element  ${txt_payu_creditcardno_locator}  timeout=${EXPLICIT_TIMEOUT}
        Input Text And Validate The Field  ${payu_credit_cardno_variable}  ${txt_payu_creditcardno_locator}
        Input Text  ${txt_payu_credit_nameoncard_locator}  ${payu_credit_nameoncard_variable}
        Input Text  ${txt_expiry_date_locator}  ${payu_credit_expiry_date}
        Input Text  ${txt_payu_credit_cvv_locator}  ${payu_credit_cvv_variable}
        Capture Page Screenshot
        Wait Until Keyword Succeeds  3x  2s  Wait Until Page Contains Element And Click  ${btn_payu_credit_paynow_locator}
        Wait Until Page Contains Element And Click  ${btn_skip_save_card_details_locator}
        Wait Until Page Contains Element  ${txt_payu_otp_locator}  timeout=${EXPLICIT_TIMEOUT}
        Enter Signup OTP Details

Enter Signup OTP Details
    [Documentation]   keyword to add the otp details if the page exists
        Wait Until Page Contains Element  ${txt_payu_otp_locator}  timeout=${EXPLICIT_TIMEOUT}
        Input Text  ${txt_payu_otp_locator}  ${payu_otp_variable}
        Wait Until Page Contains Element And Click  ${btn_payu_otp_pay_locator}
        Capture Page Screenshot

Purchase Freetrial Hosting With Select Domain Flow Type
    [Documentation]  this keyword will purchase freetrial hosting and validate the bluerock after successful login
    [Arguments]     ${domain_type_locator}     ${domain_next_locator}
        Create Random Domain Account Along With Select Domain Type And Click On Next       ${domain_type_locator}       ${domain_next_locator}
        Update And Validate Account Information In Billing Page
        Validate The Signup Success And Validate Onboarding And Bluerock Home Page For Feeetrial Flow

Validate More Information Links Under Package Extras In the Signup Flow
    [Documentation]  validate more information links under package extras
    [Arguments]   ${hosting_plan}   ${domain_type_locator}   ${domain_next_locator}  ${domain_type_hfe_locator}   ${domain_next_hfe_locator}
        Navigate To Shared Hosting And Select Plan   ${hosting_plan}
        Check If Signup Flow Is Legacy Or HFE With More Information Check  ${domain_type_locator}  ${domain_next_locator}  ${domain_type_hfe_locator}  ${domain_next_hfe_locator}

Check If Signup Flow Is Legacy Or HFE With More Information Check
    [Documentation]  this keyword will check if the signup flow is legacy or HFE
    [Arguments]   ${domain_type_locator}  ${domain_next_locator}  ${domain_type_hfe_locator}   ${domain_next_hfe_locator}
        ${signup_url}=      Get Location
        ${flow_type}=  Run Keyword And Return Status       Should Contain    ${signup_url}    registration
        Run Keyword If  '${flow_type}' == 'True'  HFE Hosting Signup Flow  ${domain_type_hfe_locator}   ${domain_next_hfe_locator}
        Run Keyword If  '${flow_type}' == 'False'  Legacy Hosting Signup Flow With More Information Check  ${domain_type_locator}   ${domain_next_locator}

Legacy Hosting Signup Flow With More Information Check
    [Documentation]  this keyword is to complete the signup purchase with legacy flow
    [Arguments]  ${domain_type_locator}   ${domain_next_locator}
       	Enter Roster Credentials And Login
       	Create Random Domain Account Along With Select Domain Type And Click On Next  ${domain_type_locator}   ${domain_next_locator}