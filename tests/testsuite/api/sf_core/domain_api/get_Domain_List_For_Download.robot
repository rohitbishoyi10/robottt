*** Settings ***
Documentation     Test cases to get the domain list for download
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   stage   domainapi

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Get Domain List For Download
    [Documentation] 	This test is get the domain list for download
    [Tags]      valid
        ${Result}=    Post Request Of Api With Body   ${protocol}		${api_environment}		${sfcore_api_endpoint}     ${get_Domain_List_For_Download_request_body}    ${global_auth_headers}
        Validate Json Response For An API   ${Result}   domain_api/getDomainListForDownload.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Get Domain List For Download With Invalid Data
    [Documentation] 	This test is to get domain list for download with invalid data
    [Tags]              invalid
        ${Result}=     Post Request Of Api With Body     ${protocol}	 ${api_environment}	 ${sfcore_api_endpoint}    ${get_Domain_List_For_Download_with_invalid_request_body}    ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/error_450.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}