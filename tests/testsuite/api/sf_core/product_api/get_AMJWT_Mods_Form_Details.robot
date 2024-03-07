*** Settings ***
Documentation   Test cases to get AMJWT Mods Form Details
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   stage   productapi

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Get AMJWT Mods Form Details
    [Documentation] 	This test is to get AMJWT Mods Form Details
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_AMJWTMods_Form_Details_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}    product_api/get_AMJWT_Mods_Form_Details.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Get AMJWT Mods Form Details With Invalid Data
    [Documentation] 	This test is to AMJWT Mods Form Details with invalid data
    [Tags]              invalid
        ${Result}=     Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_AMJWTMods_Form_Details_Invalid_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/get_AMJWT_Mods_Form_Details_error.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}