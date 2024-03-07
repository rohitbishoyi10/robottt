*** Settings ***
Documentation   Test cases to Get Cart Detais
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   getCart

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Verify Post Request To Get Cart Details Of A Cart Having Products In An Account
    [Documentation] 	This test is to verify post request to get cart details of a cart having products in an account
    [Tags]              valid
        Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${add_products_to_cart_request_body}     ${global_auth_headers}
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_cart_request_body}     ${global_auth_headers}
        Validate Json Response For An API   ${Result}   cart_api/get_cart_details_having_products.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Verify Post Request To Get Cart Details Of An Empty Cart In An Account
    [Documentation] 	This test is to verify post request to get cart details of an empty cart in an account
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_cart_request_body}     ${global_auth_headers}
        Validate Json Response For An API   ${Result}   cart_api/get_cart_details_of_empty_cart.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}