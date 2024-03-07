*** Settings ***
Documentation   Test cases to Get Can User Access Domain
Test Timeout    ${TEST_TIMEOUT}
Force Tags      sfcore    api   canUserAccessDomain

Resource        ../../../../keywords/api/sf_core/account_recovery_api/can_user_access_domain.robot

*** Test Cases ***
Test Case 1 : Verify Get Request To Get Can User Access Domain For Valid UserId And Valid Domain
    [Documentation] 	This test is to verify get request to get can user access domain for valid userid and valid domain
    [Tags]              valid
        ${Result}=    Check If UserId Available    ${can_user_access_domain_endpoint}   ${can_user_access_domain_valid_userid}     ${can_user_access_domain_valid_domain}     ${account_recovery_api_headers}
        Validate Json Response For An API   ${Result}   account_recovery_api/can_user_access_domain.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Verify Get Request To Get Registration To Get Can User Access Domain For Invalid UserId And Valid Domain
    [Documentation] 	This test is to verify get request to get can user access domain for invalid userid and valid domain
    [Tags]              invalid
        ${Result}=    Check If UserId Available    ${can_user_access_domain_endpoint}   ${can_user_access_domain_invalid_userid}     ${can_user_access_domain_valid_domain}     ${account_recovery_api_headers}
        Validate Json Response For An API   ${Result}   error/error_404.json
        Validate Response Of The Api        ${Result}   ${ERROR_CODE_404}

Test Case 3 : Verify Get Request To Get Registration To Get Can User Access Domain For Valid UserId And Invalid Domain
    [Documentation] 	This test is to verify get request to get can user access domain for valid userid and invalid domain
    [Tags]              invalid
        ${Result}=    Check If UserId Available    ${can_user_access_domain_endpoint}   ${can_user_access_domain_valid_userid}     ${can_user_access_domain_invalid_domain}     ${account_recovery_api_headers}
        Validate Json Response For An API   ${Result}   account_recovery_api/can_user_access_domain.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}