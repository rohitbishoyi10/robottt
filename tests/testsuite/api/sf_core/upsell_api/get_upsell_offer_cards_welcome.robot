*** Settings ***
Documentation   Test cases to get Welcome Interstitial Offers
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   welcomeInterstitial

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Verify Post Request API To Get All Welcome Interstitial Offers For An Account
    [Documentation] 	This test is to verify post request api to get all welcome interstitial offers for an account
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${post_get_welcome_interstitial_request_body}     ${global_auth_headers}
        Validate Json Response For An API     ${Result}   upsell_api/getUpsellOfferCardsWelcome.json
        Validate Response Of The Api          ${Result}   ${SUCCESS_CODE}

Test Case 2 : Verify Post Request API To Get All Welcome Interstitial Offers With Empty Request Body
    [Documentation] 	This test is to verify post request api to get all welcome interstitial offers with empty request body
    [Tags]              invalid
        ${Result}=    Post Request Of Api    ${protocol}		${api_environment}		${sfcore_api_endpoint}     ${global_auth_headers}
        Validate Json Response For An API     ${Result}   error/blank_data_error_response.json
        Validate Response Of The Api          ${Result}   ${SUCCESS_CODE}

Test Case 3 : Verify Post Request API To Get All Welcome Interstitial Offers With Invalid Request Body
    [Documentation] 	This test is to verify post request api to get all welcome interstitial offers with invalid request body
    [Tags]              invalid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${post_get_upsell_invalid_request_body}     ${global_auth_headers}
        Validate Json Response For An API     ${Result}   upsell_api/upsell_invalid_body_response.json
        Validate Response Of The Api          ${Result}   ${SUCCESS_CODE}