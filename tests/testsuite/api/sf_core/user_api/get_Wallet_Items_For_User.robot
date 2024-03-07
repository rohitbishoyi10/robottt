*** Settings ***
Documentation     Test cases to get quick links information
Test Timeout      ${TEST_TIMEOUT}
Suite Setup       Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags        sfcore    api   stage

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Get Wallet Items For User
    [Documentation] 	This test is to get wallet items for user
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body   ${protocol}		${api_environment}		${sfcore_api_endpoint}     ${get_Wallet_Items_For_User}    ${global_auth_headers}
        Validate Json Response For An API   ${Result}   user_api/get_Wallet_Items_For_User.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : To Get Wallet Items For User With Invalid Data
    [Documentation] 	This test is to get wallet items for user with invalid data
    [Tags]              invalid
         ${Result}=    Post Request Of Api With Body   ${protocol}		${api_environment}		${sfcore_api_endpoint}     ${get_Wallet_Items_For_User_With_Invalid_Body}    ${global_auth_headers}
         Validate Json Response For An API   ${Result}   error/error_450.json