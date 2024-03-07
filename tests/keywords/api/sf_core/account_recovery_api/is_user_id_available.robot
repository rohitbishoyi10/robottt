*** Settings ***
Resource	 ../../common.robot
Variables    ../../../../variables/api/sf_core/account_recovery_api/is_user_id_available.py


*** Keywords ***
Check If UserId Available
     [Documentation]   Keyword to check if userid is available
     [Arguments]   ${api}     ${user_id}    ${headers}
         ${api}=    Generate Path Params By Replacing The Given Api     ${api}      {userId}    ${user_id}
         ${result}=   Get Request Of Api Having Additional Headers Without Params		${protocol}		${api_environment}	    ${api}      ${headers}
     [Return]   ${result}