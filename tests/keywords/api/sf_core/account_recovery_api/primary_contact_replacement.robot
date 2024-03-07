*** Settings ***
Resource	 ../../common.robot
Variables    ../../../../variables/api/sf_core/account_recovery_api/primary_contact_replacement.py


*** Keywords ***
Primary Contact Replacement
     [Documentation]   Keyword to perform primary contact replacement
     [Arguments]   ${api}   ${request_body}     ${user_id}    ${domain_name}    ${headers}
         ${api}=    Generate Path Params By Replacing The Given Api     ${api}      {userId}    ${user_id}
         ${api}=    Generate Path Params By Replacing The Given Api     ${api}      {domainName}    ${domain_name}
         ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${api}     ${request_body}     ${account_recovery_api_headers}
     [Return]   ${result}