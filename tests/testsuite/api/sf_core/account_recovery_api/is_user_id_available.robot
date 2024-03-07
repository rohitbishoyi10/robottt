*** Settings ***
Documentation   Test cases to Check If UserId is Available
Test Timeout    ${TEST_TIMEOUT}
Force Tags      sfcore    api   isUseridAvailable

Resource        ../../../../keywords/api/sf_core/account_recovery_api/is_user_id_available.robot

*** Test Cases ***
Test Case 1 : Verify Get Request To Check If UserId is Available For Valid UserId
    [Documentation] 	This test is to verify get request to check if userid is available for valid userid
    [Tags]              valid
        ${Result}=    Check If UserId Available    ${is_user_id_available_endpoint}   ${is_user_id_available_valid_userid}     ${account_recovery_api_headers}
        Validate Json Response For An API   ${Result}   account_recovery_api/is_user_id_available.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Verify Get Request To Get Registration To Check If UserId is Available For Invalid UserId
    [Documentation] 	This test is to verify get request to check if userid is available for invalid userid
    [Tags]              invalid
        ${Result}=    Check If UserId Available    ${is_user_id_available_endpoint}   ${is_user_id_available_invalid_userid}     ${account_recovery_api_headers}
        Validate Json Response For An API   ${Result}   account_recovery_api/is_user_id_available.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}