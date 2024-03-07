*** Settings ***
Documentation   Test cases to Perform Primary Contact Replacement
Test Timeout    ${TEST_TIMEOUT}
Force Tags      sfcore    api   primaryContactReplacement

Resource        ../../../../keywords/api/sf_core/account_recovery_api/primary_contact_replacement.robot

*** Test Cases ***
Test Case 1 : Verify Post Request To Perform Primary Contact Replacement With Valid UserId And Valid Domain
    [Documentation] 	This test is to verify post request to perform primary contact replacement with valid userid and valid domain
    [Tags]              valid
        ${Result}=    Primary Contact Replacement    ${primary_contact_replacement_endpoint}    ${primary_contact_replacement_request_body}    ${pcr_valid_userid}     ${pcr_valid_domain}    ${account_recovery_api_headers}
        Validate Json Response For An API   ${Result}   account_recovery_api/primary_contact_replacement.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Verify Post Request To Perform Primary Contact Replacement With Invalid UserId And Valid Domain
    [Documentation] 	This test is to verify post request to perform primary contact replacement with invalid userid and valid domain
    [Tags]              invalid
        ${Result}=    Primary Contact Replacement    ${primary_contact_replacement_endpoint}    ${primary_contact_replacement_request_body}    ${pcr_invalid_userid}     ${pcr_valid_domain}    ${account_recovery_api_headers}
        Validate Json Response For An API   ${Result}   error/error_400.json
        Validate Response Of The Api        ${Result}   ${ERROR_CODE_400}

Test Case 3 : Verify Post Request To Perform Primary Contact Replacement With Valid UserId And Invalid Domain
    [Documentation] 	This test is to verify post request to perform primary contact replacement with valid userid and invalid domain
    [Tags]              invalid
        ${Result}=    Primary Contact Replacement    ${primary_contact_replacement_endpoint}    ${primary_contact_replacement_request_body}    ${pcr_valid_userid}     ${pcr_invalid_domain}    ${account_recovery_api_headers}
        Validate Json Response For An API   ${Result}   error/error_404.json
        Validate Response Of The Api        ${Result}   ${ERROR_CODE_404}

