*** Settings ***
Documentation   Test cases to Get Default Payment Method
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   stage   accountapi

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Get Default Payment Method
    [Documentation] 	This test is to Get Default Payment Method
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_Default_Payment_Method_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}    account_api/get_Default_Payment_Method.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Get Default Payment Method With Invalid Data
    [Documentation] 	This test is to Get Default Payment Method with invalid data
    [Tags]              invalid
        ${Result}=     Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_Default_Payment_Method_invalid_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/common_error.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}