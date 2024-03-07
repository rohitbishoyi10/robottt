*** Settings ***
Documentation   Test cases to AMMods Form Details for PPC
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   stage   productapi

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : AMMods Form Details for PPC
    [Documentation] 	This test is to get AMMods form details for PPC
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_AMMods_Form_Details_for_PPC_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}    product_api/get_AMMods_Form_Details_for_PPC.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : AMMods Form Details for PPC With Invalid Data
    [Documentation] 	This test is to get AMMods form details for PPC with invalid data
    [Tags]              invalid
        ${Result}=     Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_AMMods_Form_Details_for_PPC_invalid_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/get_AMMods_Form_Details_for_PPC_error.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}