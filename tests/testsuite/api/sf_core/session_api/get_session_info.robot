*** Settings ***
Documentation   Test cases to Get Session Information
Test Timeout    ${TEST_TIMEOUT}
Force Tags      sfcore    api   getSessionInfo

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Verify Post Request To Get Session Information Without Logged In An Account
    [Documentation] 	This test is to verify post request to get session information without logged in an account
    [Tags]              valid
        ${Result}=    Get Session Info    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_session_info_request_body}
        Validate Json Response For An API   ${Result}   session_api/get_session_info_not_authenticated.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Verify Post Request To Get Session Information With Logged In An Account
    [Documentation] 	This test is to verify post request to get session information with logged in an account
    [Tags]              valid
        Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_session_info_request_body}  ${global_auth_headers}
        Validate Json Response For An API   ${Result}   session_api/get_session_info_authenticated.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}