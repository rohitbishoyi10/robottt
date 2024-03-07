*** Settings ***
Documentation   Test cases to Check Eligible Upsell in an Account
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   checkEligibleUpsell

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Verify Post Request To Check Eligible Upsell In An Account
    [Documentation] 	This test is to verify post request to check eligible upsell in an account
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${check_eligible_upsell_request_body}     ${global_auth_headers}
        Validate Json Response For An API   ${Result}   flow_api/check_eligible_upsell.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Verify Post Request To Check Eligible Upsell Without FlowId In An Account
    [Documentation] 	This test is to verify post request to check eligible upsell without flowid in an account
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${check_eligible_upsell_without_flowid_request_body}     ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/error_203_body_has_to_be_specified.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}