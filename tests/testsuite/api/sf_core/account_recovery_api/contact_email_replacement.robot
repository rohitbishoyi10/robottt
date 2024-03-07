*** Settings ***
Documentation   Test cases to Perform Contact Email Replacement
Test Timeout    ${TEST_TIMEOUT}
Force Tags      sfcore    api   contactEmailReplacement

Resource        ../../../../keywords/api/sf_core/account_recovery_api/contact_email_replacement.robot

*** Test Cases ***
Test Case 1 : Verify Post Request To Perform Contact Email Replacement With Valid UserId And Valid Domain
    [Documentation] 	This test is to verify post request to perform contact email replacement with valid userid and valid domain
    [Tags]              valid
        ${Result}=    Contact Email Replacement    ${contact_email_replacement_endpoint}    ${contact_email_replacement_request_body}    ${cer_valid_userid}     ${cer_valid_domain}    ${account_recovery_api_headers}
        Validate Json Response For An API   ${Result}   account_recovery_api/contact_email_replacement.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Verify Post Request To Perform Contact Email Replacement With Invalid UserId And Valid Domain
    [Documentation] 	This test is to verify post request to perform contact email replacement with invalid userid and valid domain
    [Tags]              invalid
        ${Result}=    Contact Email Replacement    ${contact_email_replacement_endpoint}    ${contact_email_replacement_request_body}    ${cer_invalid_userid}     ${cer_valid_domain}    ${account_recovery_api_headers}
        Validate Json Response For An API   ${Result}   error/error_400.json
        Validate Response Of The Api        ${Result}   ${ERROR_CODE_400}

Test Case 3 : Verify Post Request To Perform Contact Email Replacement With Valid UserId And Invalid Domain
    [Documentation] 	This test is to verify post request to perform contact email replacement with valid userid and invalid domain
    [Tags]              invalid
        ${Result}=    Contact Email Replacement    ${contact_email_replacement_endpoint}    ${contact_email_replacement_request_body}    ${cer_valid_userid}     ${cer_invalid_domain}    ${account_recovery_api_headers}
        Validate Json Response For An API   ${Result}   error/error_400.json
        Validate Response Of The Api        ${Result}   ${ERROR_CODE_400}

