*** Settings ***
Documentation   Test cases to get Renewal Cross Sell Offers
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   upsell

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Verify Post Request To Get Private Registration Renewal Cross Sell Offer For An Account
    [Documentation] 	This test is to verify post request to get private registration renewal cross sell offer for an account
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${post_get_renewal_cross_sell_pri_reg_request_body}     ${global_auth_headers}
        Validate Json Response For An API   ${Result}   upsell/getRenewalCrossSellOffer.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Verify Post Request To Get WP Hosting Renewal Cross Sell Offer For An Account
    [Documentation] 	This test is to verify post request to get wp hosting renewal cross sell offer for an account
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${post_get_renewal_cross_sell_wp_hosting_request_body}     ${global_auth_headers}
        Validate Json Response For An API   ${Result}   upsell/getRenewalCrossSellOffer.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 3 : Verify Post Request To Get SSL Renewal Cross Sell Offer For An Account
    [Documentation] 	This test is to verify post request to get ssl renewal cross sell offer for an account
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${post_get_renewal_cross_sell_ssl_request_body}     ${global_auth_headers}
        Validate Json Response For An API   ${Result}   upsell/getRenewalCrossSellOffer.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 4 : Verify Post Request To Get Sitelock Essentials Renewal Cross Sell Offer For An Account
    [Documentation] 	This test is to verify post request to get sitelock essentials renewal cross sell offer for an account
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${post_get_renewal_cross_sell_sitelock_essentials_request_body}     ${global_auth_headers}
        Validate Json Response For An API   ${Result}   upsell/getRenewalCrossSellOffer.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 5 : Verify Post Request API To Get Renewal Cross Sell Offers With Empty Request Body
    [Documentation] 	This test is to verify post request api to get renewal cross sell offers with empty request body
    [Tags]              invalid
        ${Result}=    Post Request Of Api    ${protocol}		${api_environment}		${sfcore_api_endpoint}     ${global_auth_headers}
        Validate Json Response For An API     ${Result}   error/blank_data_error_response.json
        Validate Response Of The Api          ${Result}   ${SUCCESS_CODE}

Test Case 6 : Verify Post Request API To Get Renewal Cross Sell Offers With Invalid Request Body
    [Documentation] 	This test is to verify post request api to get renewal cross sell offers with invalid request body
    [Tags]              invalid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${post_get_upsell_invalid_request_body}     ${global_auth_headers}
        Validate Json Response For An API     ${Result}   upsell/upsell_invalid_body_response.json
        Validate Response Of The Api          ${Result}   ${SUCCESS_CODE}