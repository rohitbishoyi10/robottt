*** Settings ***
Documentation   Test cases to Get Purchasable Account
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   stage   accountapi

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Get Purchasable Account
    [Documentation] 	This test is to Get Purchasable Account
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_Purchasable_Account_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}    account_api/get_Purchasable_Account.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Get Purchasable Account With Invalid Data
    [Documentation] 	This test is to Get Purchasable Account with invalid data
    [Tags]              invalid
        ${Result}=     Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_Purchasable_Account_invalid_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/error_450.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}