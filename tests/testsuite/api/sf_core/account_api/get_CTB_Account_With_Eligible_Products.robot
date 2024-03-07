*** Settings ***
Documentation   Test cases to Get CTB Account With Eligible Products
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   stage   accountapi

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Get CTB Account With Eligible Products
    [Documentation] 	This test is to Get CTB Account With Eligible Products
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_CTB_Account_With_Eligible_Products_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}    account_api/get_CTB_Account_With_Eligible_Products.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Get CTB Account With Eligible Products Without Body
    [Documentation] 	This test is to Get CTB Account With Eligible Products with empty data
    [Tags]              invalid
        ${Result}=     Post Request Of Api    ${protocol}		${api_environment}		${sfcore_api_endpoint}  ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/common_error.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 3 : Get CTB Account With Eligible Products With Invalid Data
    [Documentation] 	This test is to Get CTB Account With Eligible Products with invalid data
    [Tags]              invalid
        ${Result}=     Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_CTB_Account_With_Eligible_Products_invalid_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/get_CTB_Account_With_Eligible_Products_error.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}