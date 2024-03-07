*** Settings ***
Documentation   Test cases to get amp product details
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   stage   productapi

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Amp Product Details
    [Documentation] 	This test is to get amp product details
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_amp_product_details_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}    product_api/get_amp_product_details.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Amp Product Details With Invalid Data
    [Documentation] 	This test is to get amp product details with invalid data
    [Tags]              invalid
        ${Result}=     Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_amp_product_details_invalid_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/get_amp_product_details_error.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}