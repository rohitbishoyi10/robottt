*** Settings ***
Documentation   Test cases to Get Wallet Associated Product List
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   stage   walletapi

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Get Wallet Associated Product List
    [Documentation] 	This test is to  Get Wallet Associated Product List
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_Wallet_Associated_Product_List_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}    wallet_api/get_Wallet_Associated_Product_List.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Get Wallet Associated Product List With Invalid Data
    [Documentation] 	This test is to Get Wallet Associated Product List with invalid data
    [Tags]              invalid
        ${Result}=     Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_Wallet_Associated_Product_List_invalid_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/invalid_account_product_error.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}