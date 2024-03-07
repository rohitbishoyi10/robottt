*** Settings ***
Documentation   Test cases to Add Upsells to the Cart
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   addUpsellsToCart

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Verify Post Request To Add Upsells To The Cart In An Account
    [Documentation] 	This test is to verify post request to add upsells to the cart in an account
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${add_upsells_to_cart_request_body}     ${global_auth_headers}
        Validate Json Response For An API   ${Result}   cart_api/add_upsells_to_cart_api.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}