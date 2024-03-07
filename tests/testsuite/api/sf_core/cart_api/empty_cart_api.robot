*** Settings ***
Documentation   Test cases to Empty Cart
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   emptyCart

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Verify Post Request To Empty Cart In An Account
    [Documentation] 	This test is to verify post request to empty cart in an account
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${empty_cart_api_request_body}     ${global_auth_headers}
        Validate Json Response For An API   ${Result}   cart_api/empty_cart_api.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}