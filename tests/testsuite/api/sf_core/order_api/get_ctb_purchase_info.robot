*** Settings ***
Documentation   Test cases to Get CTB Purchase Info in an Account
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   getCTBPurchaseInfo

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Verify Post Request To Get CTB Purchase Info In An Account
    [Documentation] 	This test is to verify post request to get ctb purchase info in an account
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_ctb_purchase_info_request_body}     ${global_auth_headers}
        Validate Json Response For An API   ${Result}   order_api/get_ctb_purchase_info.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Verify Post Request To Get CTB Purchase Info With Invalid Product Code In An Account
    [Documentation] 	This test is to verify post request to get ctb purchase info with invalid product code in an account
    [Tags]              invalid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_ctb_purchase_info_invalid_product_code_request_body}     ${global_auth_headers}
        Validate Json Response For An API   ${Result}   order_api/error_681_unsupported_ctb_product_code_entered.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 3 : Verify Post Request To Get CTB Purchase Info With Invalid Purchase Term Unit In An Account
    [Documentation] 	This test is to verify post request to get ctb purchase info with invalid purchase term unit in an account
    [Tags]              invalid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_ctb_purchase_info_invalid_purchase_term_unit_request_body}     ${global_auth_headers}
        Validate Json Response For An API   ${Result}   order_api/error_680_invalid_term_unit.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}