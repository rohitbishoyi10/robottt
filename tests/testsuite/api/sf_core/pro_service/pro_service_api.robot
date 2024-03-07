*** Settings ***
Documentation   Test cases to get Pro Services
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   stage   proservice

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Get Has Pro Service
    [Documentation] 	This test is to get Pro Service
    [Tags]              valid
        ${result}=   Get Request Of Api Having Additional Headers Without Params		${protocol}		${api_environment}	    ${has_pro_service_endpoint}      ${global_auth_headers}
        Validate Json Response For An API   ${Result}    pro_service/has_pro_service._response.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Get Pro Services
    [Documentation] 	This test is to get Pro Services
    [Tags]              valid
        ${result}=   Get Request Of Api Having Additional Headers Without Params		${protocol}		${api_environment}	    ${pro_services_endpoint}      ${global_auth_headers}
        Validate Json Response For An API   ${Result}    pro_service/pro_services_response.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 3 : Get Pro Services Cases
    [Documentation] 	This test is to get Pro Services Cases
    [Tags]              valid
        ${result}=   Get Request Of Api Having Additional Headers Without Params		${protocol}		${api_environment}	    ${pro_services_cases_endpoint}      ${global_auth_headers}
        Validate Json Response For An API   ${Result}    pro_service/pro_services_cases_response
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}