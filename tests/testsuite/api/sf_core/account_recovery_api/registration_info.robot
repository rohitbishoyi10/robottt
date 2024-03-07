*** Settings ***
Documentation   Test cases to Get Registration Info For a Domain
Test Timeout    ${TEST_TIMEOUT}
Force Tags      sfcore    api   registrationInfo

Resource        ../../../../keywords/api/sf_core/account_recovery_api/registration_info.robot

*** Test Cases ***
Test Case 1 : Verify Get Request To Get Registration Info For A Valid Registered With Brand Domain And Valid Org Account
    [Documentation] 	This test is to verify get request to get registration info for a valid registered with brand domain and valid org account
    [Tags]              valid
        ${Result}=    Get Registration Info For A Domain    ${registration_info_endpoint}   ${bh_regsitered_org_domain}     ${account_recovery_api_headers}
        Validate Json Response For An API   ${Result}   account_recovery_api/registration_info.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Verify Get Request To Get Registration Info For A Valid Registered With Brand Domain And Invalid Org Account
    [Documentation] 	This test is to verify get request to get registration info for a valid registered with brand domain and invalid org account
    [Tags]              invalid
        ${Result}=    Get Registration Info For A Domain    ${registration_info_endpoint}   ${bh_regsitered_invalid_org_domain}     ${account_recovery_api_headers}
        Validate Json Response For An API   ${Result}   account_recovery_api/registration_info.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 3 : Verify Get Request To Get Registration Info For A Not Registered with brand domain And Invalid Org Account
    [Documentation] 	This test is to verify get request to get registration info for a not registered with brand domain and invalid org account
    [Tags]              invalid
        ${Result}=    Get Registration Info For A Domain    ${registration_info_endpoint}   ${bh_not_regsitered_invalid_org_domain}     ${account_recovery_api_headers}
        Validate Json Response For An API   ${Result}   account_recovery_api/registration_info.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}