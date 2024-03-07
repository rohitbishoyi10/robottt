*** Settings ***
Documentation   Test cases to update security details
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   stage   domainapi

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Domain Update Security Details
    [Documentation] 	This test is domain update security details
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${update_Domain_Security_Details_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}   domain_api/updateDomainSecurityDetails.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Update Domain Security Details With Invalid Data
    [Documentation] 	This test is to get domain security detials with invalid data
    [Tags]              invalid
        ${Result}=     Post Request Of Api With Body     ${protocol}	 ${api_environment}	 ${sfcore_api_endpoint}    ${update_Domain_Security_Details_with_invalid_request_body}    ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/error_450.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 3 : Update Domain Security Details With Space Data
    [Documentation] 	This test is to get domain security detials with space Data
    [Tags]              invalid
        ${Result}=     Post Request Of Api With Body     ${protocol}	 ${api_environment}	 ${sfcore_api_endpoint}    ${update_Domain_Security_Details_with_space_request_body}    ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/error_207.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}