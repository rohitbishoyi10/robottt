*** Settings ***
Documentation   Test cases to Get Filter Count For Renewal Center
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   stage   productapi

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Get Filter Count For Renewal Center
    [Documentation] 	This test is to Get Filter Count For Renewal Center
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_filter_count_for_renewal_center_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}    product_api/Get_Filter_Count_For_Renewal_Center.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Get Filter Count For Renewal Center With Invalid Data
    [Documentation] 	This test is to Get Filter Count For Renewal Center with invalid data
    [Tags]              invalid
        ${Result}=     Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_filter_count_for_renewal_center_invalid_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/Get_Filter_Count_For_Renewal_Center_error.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}