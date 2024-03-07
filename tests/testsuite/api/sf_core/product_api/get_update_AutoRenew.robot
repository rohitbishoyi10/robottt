*** Settings ***
Documentation   Test cases to Get Update Auto Renew
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   stage   productapi

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Get Update Auto Renew
    [Documentation] 	This test is to Get Update Auto Renew
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${update_AutoRenew_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}    product_api/get_update_AutoRenew.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Get Update Auto Renew With Invalid Data
    [Documentation] 	This test is to Get Update Auto Renew with invalid data
    [Tags]              invalid
        ${Result}=     Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${update_AutoRenew_negative_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/get_update_AutoRenew_error.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}