*** Settings ***
Documentation   Test cases to Create User
Test Timeout    ${TEST_TIMEOUT}
Force Tags      sfcore    api   createUser

Resource        ../../../../keywords/api/sf_core/account_recovery_api/create_user.robot

*** Test Cases ***
Test Case 1 : Verify Post Request To Create User With Valid Request Body
    [Documentation] 	This test is to verify post request to create user with valid request body
    [Tags]              valid
        ${Result}=    Create User    ${create_user_request_body}    ${account_recovery_api_headers}
        Validate Json Response For An API   ${Result}   account_recovery_api/create_user.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE_CREATED}

Test Case 2 : Verify Post Request To Create User With Invalid Request Body
    [Documentation] 	This test is to verify post request to create user with invalid request body
    [Tags]              invalid
        ${Result}=    Create User    ${create_user_invalid_request_body}    ${account_recovery_api_headers}
        Validate Json Response For An API   ${Result}   error/error_400.json
        Validate Response Of The Api        ${Result}   ${ERROR_CODE_400}

