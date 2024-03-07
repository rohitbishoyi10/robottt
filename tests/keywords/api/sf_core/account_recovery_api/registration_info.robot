*** Settings ***
Resource	 ../../common.robot
Variables    ../../../../variables/api/sf_core/account_recovery_api/registration_info.py


*** Keywords ***
Get Registration Info For A Domain
     [Documentation]   Keyword to get registration info for a domain
     [Arguments]   ${api}     ${domain_name}    ${headers}
         ${api}=    Generate Path Params By Replacing The Given Api     ${api}      {domainName}    ${domain_name}
         ${result}=   Get Request Of Api Having Additional Headers Without Params		${protocol}		${api_environment}	    ${api}      ${headers}
     [Return]   ${result}