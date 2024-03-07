*** Settings ***
Documentation   Test cases to Get Alerts in an Account
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   getAlerts

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Verify Post Request To Get Alerts In An Account
    [Documentation] 	This test is to verify post request to get alerts in an account
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_alerts_request_body}     ${global_auth_headers}
        Validate Json Response For An API   ${Result}   alerts_api/get_alerts.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Verify Post Request To Get Alerts With Empty Account Id In An Account
    [Documentation] 	This test is to verify post request to get alerts with empty account id in an account
    [Tags]              invalid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_alerts_empty_accountid_request_body}     ${global_auth_headers}
        Validate Json Response For An API   ${Result}   alerts_api/no_account_id_alerts.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}