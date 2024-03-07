*** Settings ***
Documentation     Test cases to get quick links information
Test Timeout      ${TEST_TIMEOUT}
Suite Setup       Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags        sfcore    api   stage

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Get Accounts
    [Documentation] 	This test is to get quick links information
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body   ${protocol}		${api_environment}		${sfcore_api_endpoint}     ${get_Accounts}    ${global_auth_headers}
        Validate Json Response For An API   ${Result}   user_api/get_Accounts.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Get Accounts With Invalid Data
    [Documentation] 	This test is to get quick links information with invalid data
    [Tags]              invalid
         ${Result}=    Post Request Of Api With Body   ${protocol}		${api_environment}		${sfcore_api_endpoint}     ${get_Accounts_With_Invalid_Body}    ${global_auth_headers}
         Validate Json Response For An API   ${Result}   error/error_450.json