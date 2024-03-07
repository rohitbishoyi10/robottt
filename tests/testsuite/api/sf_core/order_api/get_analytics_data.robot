*** Settings ***
Documentation   Test cases to Get Analytics Data in an Account
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   getAnalyticsData

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Verify Post Request To Get Analytics Data In An Account
    [Documentation] 	This test is to verify post request to get analytics data in an account
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_analytics_data_request_body}     ${global_auth_headers}
        Validate Json Response For An API   ${Result}   order_api/get_analytics_data_api.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}