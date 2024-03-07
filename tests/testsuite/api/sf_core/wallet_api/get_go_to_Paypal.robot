*** Settings ***
Documentation   Test cases to navigate paypal
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   stage   walletapi

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Go To Paypal
    [Documentation] 	This test is to Go To Paypal
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${got_to_paypal_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}    wallet_api/get_go_to_Paypal.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Go To Paypal Without Body
    [Documentation] 	This test is to Go To Paypal with empty data
    [Tags]              invalid
        ${Result}=     Post Request Of Api    ${protocol}		${api_environment}		${sfcore_api_endpoint}  ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/common_error.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 3 : Go To Paypal With Invalid Data
    [Documentation] 	This test is to Go To Paypal with invalid data
    [Tags]              invalid
        ${Result}=     Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${got_to_paypal_invalid_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/invalid_accountid_error.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}