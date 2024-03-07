*** Settings ***
Documentation     Test cases to get quick links information
Test Timeout      ${TEST_TIMEOUT}
Suite Setup       Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags        sfcore    api   stage

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Check Edit Credit Card Permission
    [Documentation] 	This test is to check edit credit card permission
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body   ${protocol}		${api_environment}		${sfcore_api_endpoint}     ${check_Edit_Credit_Card_Permission}    ${global_auth_headers}
        Validate Json Response For An API   ${Result}   user_api/check_Edit_Credit_Card_Permission.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Check Edit Credit Card Permission With Invalid Data
    [Documentation] 	This test is to check edit credit card permission with invalid data
    [Tags]              invalid
         ${Result}=    Post Request Of Api With Body   ${protocol}		${api_environment}		${sfcore_api_endpoint}     ${check_Edit_Credit_Card_Permission_With_Invalid_Body}    ${global_auth_headers}
         Validate Json Response For An API   ${Result}   error/error_450.json