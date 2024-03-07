*** Settings ***
Documentation   Test cases to get domain host records
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   stage   domainapi

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Get Domain Host Records
    [Documentation] 	This test is domain get domain host records
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_Domain_HostRecords_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}   domain_api/getDomainHostRecords.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Get Domain Host Records Without Body
    [Documentation] 	This test is to get domain host records with empty data
    [Tags]              invalid
        ${Result}=     Post Request Of Api    ${protocol}		${api_environment}     ${sfcore_api_endpoint}    ${global_auth_headers}
        Validate Text Type Api Response    ${Result}     error/getDomainSecurityDetails.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 3 : Get Domain Host Records With Invalid Data
    [Documentation] 	This test is to get domain host records with invalid data
    [Tags]              invalid
        ${Result}=     Post Request Of Api With Body     ${protocol}	 ${api_environment}	 ${sfcore_api_endpoint}    ${get_Domain_HostRecords_with_invalid_request_body}    ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/error_450.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}
