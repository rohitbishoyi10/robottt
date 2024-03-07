*** Settings ***
Documentation   Test cases to get Price For Product
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   stage   pricingapi

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Get Price For Product
    [Documentation] 	This test is to get Price For Product
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_Price_For_Product_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}    pricing_api/get_price_for_product.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Get Price For Product Without Body
    [Documentation] 	This test is to get Price For Product with empty data
    [Tags]              invalid
        ${Result}=     Post Request Of Api    ${protocol}		${api_environment}		${sfcore_api_endpoint}  ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/common_error.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 3 : Get Price For Product With Invalid Data
    [Documentation] 	This test is to get Price For Product with invalid data
    [Tags]              invalid
        ${Result}=     Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_Price_For_Product_invalid_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/error_450.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}