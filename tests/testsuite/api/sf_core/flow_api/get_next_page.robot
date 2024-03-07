*** Settings ***
Documentation   Test cases to Get Next Page in an Account
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   getNextPage

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Verify Post Request To Get Next Page In An Account
    [Documentation] 	This test is to verify post request to get next page in an account
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_next_page_request_body}     ${global_auth_headers}
        Validate Json Response For An API   ${Result}   flow_api/get_next_page.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}