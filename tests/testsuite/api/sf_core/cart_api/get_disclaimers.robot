*** Settings ***
Documentation   Test cases to Get Disclaimers
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   getDisclaimers

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Verify Post Request To Get Disclaimers In An Account
    [Documentation] 	This test is to verify post request to get disclaimers in an account
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_disclaimers_request_body}     ${global_auth_headers}
        Validate Json Response For An API   ${Result}   cart_api/get_disclaimers.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Verify Post Request To Get Disclaimers With Empty DisclaimerId In An Account
    [Documentation] 	This test is to verify post request to get disclaimers with empty disclaimerid in an account
    [Tags]              invalid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${add_products_to_cart_empty_product_code_request_body}     ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/error_203_body_has_to_be_specified.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}