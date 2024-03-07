*** Settings ***
Documentation   Test cases to Create Shared Hosting
Test Timeout    ${TEST_TIMEOUT}
Force Tags      hal    api   stage   createwallet

Resource		../../../keywords/api/common.robot

*** Test Cases ***
Test Case 1 : Get Create Wallet For CC
     [Documentation]   Create Wallet For Credit Card
     [Tags]              valid
         ${tenant_back_ref}=    Generate Random Digits
         Log To Console      ${tenant_back_ref}
         Set To Dictionary      ${addon_add_HostingCreate_shared_request_body}    tenant_back_ref    ${tenant_back_ref}
         ${account_back_ref}=    Generate Random Digits
         Set To Dictionary      ${addon_add_HostingCreate_shared_request_body}    account_back_ref    ${account_back_ref}
         ${back_reference}=     Generate Random Digits
         Set To Dictionary      ${addon_add_HostingCreate_shared_request_body}    back_reference    ${back_reference}
         ${result}=   Post Request Of Api With Body For Hal Api		${protocol}		${hal_api_environment}	${hal_api_endpoint}   ${addon_add_HostingCreate_shared_request_body}