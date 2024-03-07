*** Settings ***
Documentation   Test cases to Get PR Info
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   stage   productapi
Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Get PR Info
    [Documentation] 	This test is to Get PR Info
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body       ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_PR_Info_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}    product_api/get_PR_Info.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Get PR Info Without Body
    [Documentation] 	This test is to Get PR Info with empty data
    [Tags]              invalid
        ${Result}=     Post Request Of Api    ${protocol}		${api_environment}		${sfcore_api_endpoint}  ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/common_error.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 3 : Get PR Info With Invalid Data
    [Documentation] 	This test is to Get PR Info with invalid data
    [Tags]              invalid
        ${Result}=     Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_PR_Info_invalid_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/error_450.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}