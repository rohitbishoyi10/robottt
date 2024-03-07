*** Settings ***
Variables	    ../../../../variables/api/sf_core/wallet_api/get_create_Wallet_For_CC.py
Variables	    ../../../../variables/api/sf_core/wallet_api/get_update_Wallet_For_CC.py
Variables	    ../../../../variables/api/sf_core/wallet_api/get_delete_Wallet_For_CC.py
Resource		../../common.robot

*** Keywords ***

Get Create Wallet For CC
     [Documentation]   Create Wallet For Credit Card
     [Arguments]   ${protocol}		${api_environment}		${api}     ${data}      ${headers}
         ${result}=   Post Request Of Api With Body		${protocol}		${api_environment}	${api}   ${data}    ${headers}
     [Return]   ${result}

Get Update Wallet For CC
     [Documentation]   Update the Wallet For CC
     [Arguments]   ${protocol}		${api_environment}		${api}     ${data}      ${headers}
         ${result}=   Post Request Of Api With Body		${protocol}		${api_environment}	${api}   ${data}    ${headers}
     [Return]   ${result}

Get Delete Wallet For CC
     [Documentation]   Delete Wallet For CC
     [Arguments]   ${protocol}		${api_environment}		${api}     ${data}      ${headers}
         ${result}=   Post Request Of Api With Body		${protocol}		${api_environment}	${api}   ${data}    ${headers}
     [Return]   ${result}

Negative Cases To Create Wallet For CC With Empty Data
     [Documentation]   Create Wallet For Credit Card with empty data
     [Arguments]   ${protocol}		${api_environment}		${api}      ${headers}
          ${result}=  Post Request Of Api    ${protocol}		${api_environment}		${api}      ${headers}
          Log To Console    ${result}
      [Return]   ${result}

Negative Cases To Create Wallet For CC With Invalid Data
     [Documentation]   Create Wallet For Credit Card with invalid data
     [Arguments]   ${protocol}		${api_environment}		${api}     ${data}      ${headers}
          ${result}=  Post Request Of Api With Body		${protocol}		${api_environment}	${api}   ${data}    ${headers}
          Log To Console    ${result}
      [Return]   ${result}