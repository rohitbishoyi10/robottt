*** Settings ***
Documentation   Test cases to Get Products For Renewal Center Csv
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   stage   productapi

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Get Products For Renewal Center Csv
    [Documentation] 	This test is to get products for renewal center csv
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_Products_For_Renewal_Center_csv_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}    product_api/get_Products_For_Renewal_Center_CSV.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Get Products For Renewal Center Csv With Invalid Data
    [Documentation] 	This test is to get products for renewal center csv with invalid data
    [Tags]              invalid
        ${Result}=     Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_Products_For_Renewal_Center_csv_invalid_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/get_Products_For_Renewal_Center_CSV_error.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}