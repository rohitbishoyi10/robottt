*** Settings ***
Documentation   Test cases to Add Products to the Cart
Test Timeout    ${TEST_TIMEOUT}
Suite Setup     Authenticate User Login    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${authenticate_user_login_request_body}
Force Tags      sfcore    api   addProductsToCart

Resource		../../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Verify Post Request To Add Products To The Cart In An Account
    [Documentation] 	This test is to verify post request to add products to the cart in an account
    [Tags]              valid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${add_products_to_cart_request_body}     ${global_auth_headers}
        Validate Json Response For An API   ${Result}   cart_api/add_products_to_cart.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 2 : Verify Post Request To Add Products To The Cart With Invalid Term Unit In An Account
    [Documentation] 	This test is to verify post request to add products to the cart with invalid term unit in an account
    [Tags]              invalid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${add_products_to_cart_invalid_term_unit_request_body}     ${global_auth_headers}
        Validate Json Response For An API   ${Result}   cart_api/invalid_term_unit_request.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 3 : Verify Post Request To Add Products To The Cart With Invalid Product Code In An Account
    [Documentation] 	This test is to verify post request to add products to the cart with invalid product code in an account
    [Tags]              invalid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${add_products_to_cart_invalid_product_code_request_body}     ${global_auth_headers}
        Validate Json Response For An API   ${Result}   cart_api/invalid_product_code_request.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}

Test Case 4 : Verify Post Request To Add Products To The Cart With Empty Product Code In An Account
    [Documentation] 	This test is to verify post request to add products to the cart with empty product code in an account
    [Tags]              invalid
        ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${sfcore_api_endpoint}    ${add_products_to_cart_empty_product_code_request_body}     ${global_auth_headers}
        Validate Json Response For An API   ${Result}   error/error_203_body_has_to_be_specified.json
        Validate Response Of The Api        ${Result}   ${SUCCESS_CODE}