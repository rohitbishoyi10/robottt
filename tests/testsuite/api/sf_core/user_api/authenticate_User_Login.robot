*** Settings ***
Documentation     Test cases to user login
Test Timeout    ${TEST_TIMEOUT}
Force Tags       api   sfcoreapi    authuser
Resource		../../../../keywords/api/common.robot

*** Test Cases ***

Test Case 1 : Auth User Login
    [Documentation] 	This test is for auth login
    [Tags]              valid
        ${Result}=    Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
        Validate Json Response For An API   ${Result}   authenticate_user/authenticate_user_login.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Auth User Login Without Body
    [Documentation] 	This test is for auth login without body
    [Tags]              invalid
         ${Result}=    Authenticate User Login Without Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}
         Validate Json Response For An API   ${Result}   error/blank_data_error_response.json