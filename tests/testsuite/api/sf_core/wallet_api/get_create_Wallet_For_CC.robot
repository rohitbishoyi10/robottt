*** Settings ***
Documentation   Test cases to Create Wallet For CC
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   stage   walletapi

Resource        ../../../../keywords/api/sf_core/wallet_api/get_create_Wallet_For_CC.robot
Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Create,Update & Delete Wallet For CC
    [Documentation] 	This test is to Create,Update & Delete Wallet For CC
    [Tags]              valid
        ${Result}=    Get Create Wallet For CC    ${protocol}		${api_environment}		${sfcore_api_endpoint}     ${get_create_Wallet_For_CC_request_body}        ${global_auth_headers}
        Validate Json Response For An API   ${Result}    wallet_api/get_create_Wallet_For_CC.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}
        ${new_walletId}=    Set Variable    ${result.json()["response"]["data"]["walletId"]}
        Set To Dictionary      ${get_update_Wallet_For_CC_request_body['request']}    walletId    ${new_wallet_id}
        ${result1}=   Get Update Wallet For CC		${protocol}		${api_environment}	${sfcore_api_endpoint}   ${get_update_Wallet_For_CC_request_body}    ${global_auth_headers}
        Validate Json Response For An API   ${Result}    wallet_api/get_update_Wallet_For_CC.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}
        ${new_walletId2}=    Set Variable    ${result1.json()["response"]["data"]["walletId"]}
        Set To Dictionary      ${get_delete_Wallet_For_CC_request_body['request']}    walletId    ${new_walletid2}
        ${result2}=   Get Delete Wallet For CC		${protocol}		${api_environment}	${sfcore_api_endpoint}   ${get_delete_Wallet_For_CC_request_body}    ${global_auth_headers}
        Validate Json Response For An API   ${Result}    wallet_api/get_delete_Wallet_For_CC.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}


Test Case 2 : Create Wallet For CC Without Body
    [Documentation] 	This test is to Create Wallet For CC with empty data
    [Tags]              invalid
        ${Result}=     Negative Cases To Create Wallet For CC With Empty Data    ${protocol}		${api_environment}		${sfcore_api_endpoint}  ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/common_error.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}


#Test Case 3 : Create Wallet For CC With Invalid Data
#    [Documentation] 	This test is to Create Wallet For CC with invalid data
#    [Tags]              invalid
#        ${Result}=     Negative Cases To Create Wallet For CC With Invalid Data    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_create_Wallet_For_CC_invalid_request_body}   ${global_auth_headers}
#        Validate Json Response For An API   ${Result}   error/error_450.json
#        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}
