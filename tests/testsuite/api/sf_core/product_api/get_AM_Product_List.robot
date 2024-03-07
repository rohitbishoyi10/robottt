*** Settings ***
Documentation   Test cases to get AM Product List
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}      ${authenticate_user_login_request_body}
Force Tags      sfcore    api   stage   productapi

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Get AM Product List
    [Documentation] 	This test is to get AM Product List
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_AM_Product_List_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}    product_api/get_AM_Product_List.json
        Validate Response Of The Api        ${Result}     ${SUCCESS_CODE}

#Test Case 2 : Get AM Product List With Invalid Data
#    [Documentation] 	This test is to get AM Product List with invalid data
#    [Tags]              invalid
#        ${Result}=     Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_AM_Product_List_invalid_request_body}   ${global_auth_headers}
#        Validate Json Response For An API   ${Result}   error/get_AM_Product_List_error.json
#        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}