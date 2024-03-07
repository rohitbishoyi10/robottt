*** Settings ***
Documentation     Test cases to get the domain list for users
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   stage   domainapi

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Get Domain List For Users
    [Documentation] 	This test is get the domain list for users
    [Tags]      valid
        ${Result}=    Post Request Of Api With Body   ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${get_Domain_List_For_User_request_body}   ${global_auth_headers}
        Validate Json Response For An API   ${Result}   domain_api/updateDomainSecurityDetails.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Get Domain List For User With Invalid Data
    [Documentation] 	This test is to get domain list for user with invalid data
    [Tags]              invalid
        ${Result}=     Post Request Of Api With Body     ${protocol}	 ${api_environment}	 ${sfcore_api_endpoint}    ${get_Domain_Security_Details_with_invalid_request_body}    ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/error_450.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}