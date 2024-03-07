*** Settings ***
Documentation   Test cases to Get JWT TokenV1
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   stage   productapi

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Get JWT TokenV1
    [Documentation] 	This test is to Get JWT TokenV1
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body       ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_JWT_token_v1_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}    product_api/get_JWT_TokenV1.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Get JWT TokenV1 With Invalid Data
    [Documentation] 	This test is to Get JWT TokenV1 with invalid data
    [Tags]              invalid
        ${Result}=     Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_JWT_token_v1_invalid_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/get_JWT_TokenV1_error.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}