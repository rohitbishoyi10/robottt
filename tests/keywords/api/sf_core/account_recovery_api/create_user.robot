*** Settings ***
Resource	 ../../common.robot
Variables    ../../../../variables/api/sf_core/account_recovery_api/create_user.py


*** Keywords ***
Create User
     [Documentation]   Keyword to check if userid is available
     [Arguments]   ${request_body}    ${headers}
         ${userName}=   Generate Random Website Name
         ${request_body}[userId]=   Set Variable    ${userName}
         ${Result}=    Post Request Of Api With Body    ${protocol}		${api_environment}		${create_user_endpoint}     ${request_body}     ${account_recovery_api_headers}
     [Return]   ${result}