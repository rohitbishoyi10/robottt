*** Settings ***
Documentation     Test cases to get quick links information
Test Timeout      ${TEST_TIMEOUT}
Suite Setup       Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags        sfcore    api   stage

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Check Edit Billing Info Permission
    [Documentation] 	This test is to check edit billing info permission
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body   ${protocol}		${api_environment}		${sfcore_api_endpoint}     ${check_Edit_Billing_Info_Permission}    ${global_auth_headers}
        Validate Json Response For An API   ${Result}   user_api/check_Edit_Billing_Info_Permission.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Check Edit Billing Info Permission Without Body
    [Documentation] 	This test is to check edit billing info permission without body
    [Tags]              invalid
         ${Result}=    Post Request Of Api      ${protocol}		${api_environment}     ${sfcore_api_endpoint}    ${global_auth_headers}
         Validate Json Response For An API   ${Result}   error/blank_data_error_response.json

Test Case 3 : Check Edit Billing Info Permission With Invalid Data
    [Documentation] 	This test is to check edit billing info permission with invalid data
    [Tags]              invalid
         ${Result}=    Post Request Of Api With Body   ${protocol}		${api_environment}		${sfcore_api_endpoint}     ${check_Edit_Billing_Info_Permission_With_Invalid_Body}    ${global_auth_headers}
         Validate Json Response For An API   ${Result}   error/error_450.json