*** Settings ***
Documentation   Test cases to Get Cart Count
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   getCartCount

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Verify Post Request To Get Cart Count In An Account
    [Documentation] 	This test is to verify post request to get cart count in an account
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_cart_count_request_body}     ${global_auth_headers}
        Validate Json Response For An API   ${Result}   cart_api/get_cart_count.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}