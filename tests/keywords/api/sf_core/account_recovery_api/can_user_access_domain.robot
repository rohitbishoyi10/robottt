*** Settings ***
Resource	 ../../common.robot
Variables    ../../../../variables/api/sf_core/account_recovery_api/can_user_access_domain.py


*** Keywords ***
Check If UserId Available
     [Documentation]   Keyword to check if userid is available
     [Arguments]   ${api}     ${user_id}    ${domain_name}    ${headers}
         ${api}=    Generate Path Params By Replacing The Given Api     ${api}      {userId}    ${user_id}
         ${api}=    Generate Path Params By Replacing The Given Api     ${api}      {domainName}    ${domain_name}
         ${result}=   Get Request Of Api Having Additional Headers Without Params		${protocol}		${api_environment}	    ${api}      ${headers}
     [Return]   ${result}