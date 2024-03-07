*** Settings ***
Library         DateTime
Library         Collections
Library         RequestsLibrary
Library         ../custom_library.py
Library         OperatingSystem
Library         BuiltIn
Library         String
Library         JSONLibrary
Library         SeleniumLibrary

Variables       ../../variables/api/common.py
Variables       ../../variables/api/environment.py
Variables       ../../variables/api/${ENV}_authentication_variables.py
Variables       ../../variables/api/sf_core/product_api/get_amp_product_details.py
Variables       ../../variables/api/sf_core/upsell_api/getUpsellOfferCards.py
Variables       ../../variables/api/sf_core/cart_api/add_products_to_cart_api.py
Variables       ../../variables/api/sf_core/cart_api/cart_api.py
Variables       ../../variables/api/sf_core/flow_api/flow_api.py
Variables       ../../variables/api/sf_core/order_api/order_api.py
Variables       ../../variables/api/sf_core/order_api/get_ctb_purchase_info.py
Variables       ../../variables/api/sf_core/alerts_api/get_alerts.py
Variables	    ../../variables/api/sf_core/account_api/get_CTB_Account_With_Eligible_Products.py
Variables	    ../../variables/api/sf_core/account_api/get_CTB_Account_With_Eligible_Products.py
Variables	    ../../variables/api/sf_core/account_api/get_Default_Payment_Method.py
Variables	    ../../variables/api/sf_core/account_api/get_Purchasable_Account.py
Variables	    ../../variables/api/sf_core/product_api/get_AM_Product_List.py
Variables	    ../../variables/api/sf_core/product_api/get_AMJWTMods_Form_Details.py
Variables	    ../../variables/api/sf_core/product_api/get_JWT_TokenV1.py
Variables	    ../../variables/api/sf_core/product_api/get_Products_For_Renewal_Center_Csv.py
Variables	    ../../variables/api/sf_core/product_api/unAssign_Domain.py
Variables	    ../../variables/api/sf_core/product_api/update_AutoRenew.py
Variables	    ../../variables/api/sf_core/product_api/get_AMDomains_List_Unassigned.py
Variables	    ../../variables/api/sf_core/product_api/get_AMMods_Form_Details_for_PPC.py
Variables	    ../../variables/api/sf_core/product_api/get_amp_product_details.py
Variables	    ../../variables/api/sf_core/product_api/get_filter_count_for_renewal_center.py
Variables	    ../../variables/api/sf_core/product_api/get_Products_For_Renewal_Center.py
Variables	    ../../variables/api/sf_core/product_api/renew_Selected_Products.py
Variables	    ../../variables/api/sf_core/product_api/get_SSO_Url.py
Variables	    ../../variables/api/sf_core/product_api/get_PR_Info.py
#Variables	    ../../variables/api/sf_core/flow_api/get_check_Eligible_Upsell.py
Variables	    ../../variables/api/sf_core/pricing_api/get_Price_For_Product.py
Variables       ../../variables/api/sf_core/domain_api/get_DNS_Record.py
Variables       ../../variables/api/sf_core/domain_api/get_Domain_HostRecords.py
Variables       ../../variables/api/sf_core/domain_api/get_Domain_List_For_Download.py
Variables       ../../variables/api/sf_core/domain_api/get_Domain_Security_Details.py
Variables       ../../variables/api/sf_core/domain_api/get_Domain_List_For_User.py
Variables       ../../variables/api/sf_core/domain_api/update_Domain_Security_Details.py
Variables	    ../../variables/api/sf_core/wallet_api/get_go_to_Paypal.py
Variables	    ../../variables/api/sf_core/wallet_api/get_Wallet_Associated_Product_List.py
Variables	    ../../variables/api/sf_core/user_api/check_Edit_Credit_Card_Permission.py
Variables	    ../../variables/api/sf_core/user_api/check_Edit_Billing_Info_Permission.py
Variables	    ../../variables/api/sf_core/user_api/check_For_Vat_Applicable_Country.py
Variables	    ../../variables/api/sf_core/user_api/get_Accounts.py
Variables	    ../../variables/api/sf_core/user_api/get_Country_List.py
Variables	    ../../variables/api/sf_core/user_api/get_Customer_Name.py
Variables	    ../../variables/api/sf_core/user_api/get_Left_Nav_Bar_Tabs_Info.py
Variables	    ../../variables/api/sf_core/user_api/get_Quick_Links_Info.py
Variables	    ../../variables/api/sf_core/user_api/get_User_Info_Full_Details.py
Variables	    ../../variables/api/sf_core/user_api/get_Wallet_Items_For_User.py
Variables	    ../../variables/api/sf_core/user_api/is_User_Id_Available.py
Variables	    ../../variables/api/sf_core/user_api/select_Account.py
Variables	    ../../variables/api/sf_core/user_api/update_User_Profile_Info.py
Variables	    ../../variables/api/sf_core/pro_service/pro_service_api.py
Variables        ../../variables/beta_authentication_variables.py
Variables	    ../../variables/api/hal_api/addon_add_HostingCreate_shared.py

*** Keywords ***
########################################
########## Invalid Scenario Keyword #########
Negative Scenario For API With Only WebproId
    [Documentation]   This keyword will verify the api with invalid webpro id
    [Arguments]   ${api}    ${request_header}     ${webpro_response}      ${invalid_webproId}=False
        ${header}=   Webpro Client Request Header   ${webpro_response}    ${request_header}    ${ACCESS_TOKEN}
        ${invalidWebproId}=     Run Keyword If     '${invalid_webproId}' == 'False'      Generate random string      ${invalid_id_digitcount_variable}       ${invalid_id_digitrange_variable}
        ...     ELSE      Set Variable      ${invalid_webproId}
        ${api}=  Generate Path Params By Replacing The Given Api   ${api}    {webproId}   ${invalidWebproId}
        ${results}=     Get Request Of Api Having Additional Headers Without Params     ${protocol}     ${api_environment}      ${api}      ${request_header}
        Log To Console  ${results}
    [Return]   ${results}

Negative Scenario For API With Only WebproId For Post Request
    [Documentation]   This keyword will verify the api with invalid webpro id for post request
    [Arguments]   ${api}    ${request_header}    ${request_body}     ${webpro_response}      ${invalid_webproId}=False
        ${header}=   Webpro Client Request Header   ${webpro_response}    ${request_header}    ${ACCESS_TOKEN}
        ${invalidWebproId}=     Run Keyword If     '${invalid_webproId}' == 'False'      Generate random string      ${invalid_id_digitcount_variable}       ${invalid_id_digitrange_variable}
        ...     ELSE      Set Variable      ${invalid_webproId}
        ${api}=  Generate Path Params By Replacing The Given Api   ${api}    {webproId}   ${invalidWebproId}
        ${results}=     Post Request Of Api With Body     ${protocol}     ${api_environment}      ${api}      ${EMPTY}    ${request_body}    ${header}
        Log To Console  ${results}
    [Return]   ${results}

Generate Random Website Name For API Post Request
    [Documentation]  keyword to replace the website name from the post request body with random website name
    [Arguments]   ${request_body_variable}   ${attribute}
        ${random_website}=   Generate Random Website Name
        ${random_website_dict}=     Convert To Dictionary    ${request_body_variable}
        ${result}=  Set To Dictionary    ${random_website_dict}      ${attribute}      ${random_website}
    [Return]   ${result}

Generate Random Collection Name For API Post Request
    [Documentation]  keyword to replace the collection name from the post request body with random collection name
    [Arguments]   ${request_body_variable}   ${attribute}   ${update}=False
        ${random_collection}=   Run Keyword If  '${update}' == 'False'    Generate Random Collection Name
        ...     ELSE    Update Collection Name
        Set Suite Variable  ${SUITE_COLLECTION_NAME}    ${random_collection}
        ${random_collection_dict}=      Convert To Dictionary    ${request_body_variable}
        ${result}=  Set To Dictionary    ${random_collection_dict}      ${attribute}      ${random_collection}
    [Return]   ${result}

Update Collection Name
    [Documentation]  keyword to update collection name
        ${random_collection}=   Generate Random Collection Name
        ${update_collection_name}=      Catenate  ${random_collection} Edited
    [Return]    ${update_collection_name}

Generate Path Params By Replacing The Given Api
    [Documentation]  adds the path params values for the given api
    [Arguments]   ${api}    ${string}    ${replace_string}
        ${convert_string}=  Convert To String   ${replace_string}
        ${params}=  Replace String    ${api}      ${string}      ${convert_string}
    [Return]   ${params}

Set Attribute Value To The Given Response
    [Documentation]  this keyword will retrieve the attribute value from the given response body
    [Arguments]     ${response}    ${attribute}     ${value}
        ${json}=     Convert To Dictionary    ${response}
        ${value}=   Set To Dictionary     ${json}    ${attribute}    ${value}
    [Return]   ${value}

Retrive Attribute Value From The Given Response
    [Documentation]  this keyword will retrieve the attribute value from the given response body
    [Arguments]     ${response}    ${attribute}
        ${json}=     Convert To Dictionary    ${response.json()}
        ${value}=   Get From Dictionary     ${json}    ${attribute}
    [Return]   ${value}

Get Value From Json And From List
    [Documentation]   keyword to get the value from json structure and from the list structure
    [Arguments]    ${json_response}    ${attribute}     ${list_size}
        ${json}=  Get Value From Json  ${json_response}    ${attribute}
        ${result}=   Get From List    ${json}   ${list_size}
    [Return]   ${result}

Get Value From Json And Convert To String
    [Documentation]   keyword to get the json value and convert the same to string, also get the substring
    [Arguments]     ${response}    ${attribute}     ${start_index}     ${end_index}
        ${json}=   Get Value From Json  ${response}   ${attribute}
        ${json_string}=   Convert JSON To String      ${json}
        ${result}=   Get Substring   ${json_string}    ${start_index}   ${end_index}
    [Return]   ${result}

Validate Json Response With Empty Body
    [Documentation]   keyword to validate json response with empty body
    [Arguments]     ${obtained_result}    ${actual_result_length}
        ${json_obtained}=  Set Variable  ${obtained_result.json()}
        ${response_length}=     Get Length     ${json_obtained}
        Should Be Equal As Integers    ${response_length}   ${actual_result_length}
    [Return]    ${obtained_result.json()}

Validate Text API Response With Empty Body
    [Documentation]   keyword to validate json response with empty body
    [Arguments]     ${obtained_result}    ${actual_result_length}
        ${json_obtained}=  Set Variable  ${obtained_result.text}
        ${response_length}=     Get Length     ${json_obtained}
        Should Be Equal As Integers    ${response_length}   ${actual_result_length}

Validate Response Of The Api
    [Documentation]   keyword to validate response of the api
    [Arguments]     ${result}     ${resp_code}
        ${code}=  Convert To Integer   ${resp_code}
        Should Be Equal  ${result.status_code}  ${code}

Validate Text Type Api Response
    [Documentation]   keyword to validate response of the api of string type
    [Arguments]     ${obtained_result}    ${actual_result}
        ${res}=  Set Variable     ${obtained_result}
        ${json_obtained}=  Set Variable  ${obtained_result.text}
        Set Test Variable    ${Resp}    ${json_obtained}
        Should Be String   ${json_obtained}
    [Return]    ${obtained_result.text}

Get Request Of Api With Headers And Params
    [Documentation]   keyword to perform get request of api with header and params
    [Arguments]    ${protocol}   ${env}    ${api}   ${headers}   ${params}
        ${session}=   Catenate    ${protocol}://${env}
        Create Session      getrequest     ${session}
        Log To Console      GET Request : ${session}${api}?${params}
        ${proxy}=    Create Dictionary    https=${proxy_url_variable}
        ${result}=   GET On Session     getrequest    ${api}    headers=${headers}   params=${params}       expected_status=any     proxies=${proxy}
        Log To Console   Result : ${result}
    [Return]     ${result}

Get Request Of Api Without Params
    [Documentation]   keyword to perform get request of api without params
    [Arguments]    ${protocol}   ${env}    ${api}
        ${session}=   Catenate    ${protocol}://${env}
        Create Session      getrequest     ${session}
        Log To Console      GET Request : ${session}${api}
        ${proxy}=    Create Dictionary    https=${proxy_url_variable}
        ${result}=  GET On Session     getrequest   ${api}      expected_status=any     proxies=${proxy}
        Log To Console   Result : ${result}
    [Return]     ${result}

Get Request Of Api Having Additional Headers Without Params
    [Documentation]   keyword to perform get request of api having additional headers without params
    [Arguments]    ${protocol}   ${env}    ${api}   ${headers}
        ${session}=   Catenate    ${protocol}://${env}
        Create Session      getrequest     ${session}
        Log To Console      GET Request : ${session}${api}
        ${proxy}=    Create Dictionary    https=${proxy_url_variable}
        ${result}=   GET On Session     getrequest   ${api}  headers=${headers}     expected_status=any     proxies=${proxy}
        Log To Console   Result : ${result}
    [Return]     ${result}

Delete Request Of Api With Header
    [Documentation]   keyword to perform delete request of api with header
    [Arguments]    ${protocol}   ${env}    ${api}   ${header}
        ${session}=   Catenate    ${protocol}://${env}
        Log To Console      Delete Request : ${session}${api}
        Create Session      deleterequest     ${session}
        ${result}=   DELETE On Session     deleterequest   ${api}  headers=${header}     expected_status=any
        Log To Console   Result : ${result}
    [Return]     ${result}

Put Request Of Api
    [Documentation]   keyword to perform put request of api
    [Arguments]    ${protocol}   ${env}    ${api}
        ${session}=   Catenate    ${protocol}://${env}
        Log To Console      Put Request : ${session}/${api}
        #Log To Console      Params : ${params}
        Create Session      putrequest     ${session}
        ${result}=   PUT On Session     putrequest   ${api}    expected_status=any
        Log To Console   Result : ${result}
    [Return]     ${result}

Put Request Of Api With Body
    [Documentation]   keyword to perform put request of api with body
    [Arguments]    ${protocol}   ${env}    ${api}  ${data}  ${headers}
        ${session}=   Catenate    ${protocol}://${env}
        Log To Console      Put Request : ${session}/${api}
        #Log To Console      Params : ${params}
        Log To Console      Data : ${data}
        Log To Console      Headers : ${headers}
        Create Session      putrequest     ${session}
        ${result}=   PUT On Session     putrequest   ${api}  json=${data}  headers=${headers}     expected_status=any
        Log To Console   Result : ${result}
    [Return]     ${result}

Post Request Of Api
    [Documentation]   keyword to perform post request of api
    [Arguments]    ${protocol}   ${env}    ${api}   ${headers}
        ${session}=   Catenate    ${protocol}://${env}
        Log To Console      Post Request : ${session}/${api}
        Log To Console      Headers : ${headers}
        Create Session    postrequest   ${session}
        ${proxy}=    Create Dictionary    https=${proxy_url_variable}
        ${result}=   POST On Session    postrequest     ${api}  headers=${headers}     expected_status=any     proxies=${proxy}
        Log To Console   Result : ${result}
    [Return]     ${result}

Post Request Of Api Without Params
    [Documentation]   keyword to perform post request of api without params
    [Arguments]    ${protocol}   ${env}    ${api}
        ${session}=   Catenate    ${protocol}://${env}
        Log To Console      Post Request : ${session}${api}
        Create Session    postrequest   ${session}
        ${result}=  POST On Session   postrequest   ${api}     expected_status=any
        Log To Console   Result : ${result}
    [Return]     ${result}

Post Request Of Api With Body
    [Documentation]   keyword to perform post request of api with body
    [Arguments]    ${protocol}   ${env}    ${api}   ${json}  ${headers}
        ${session}=   Catenate    ${protocol}://${env}
        Log To Console      Post Request : ${session}/${api}
        Log To Console      Json : ${json}
        Log To Console      Headers : ${headers}
        Create Session    postrequest   ${session}
        ${proxy}=    Create Dictionary    https=${proxy_url_variable}
        ${result}=   POST On Session    postrequest     ${api}  json=${json}  headers=${headers}     expected_status=any     proxies=${proxy}
        Log To Console   Result : ${result}
    [Return]     ${result}

Post Request Of Api With Body For Hal Api
    [Documentation]   keyword to perform post request of api with body for hal api
    [Arguments]    ${protocol}   ${env}    ${api}   ${json}
        ${session}=   Catenate    ${protocol}://${env}
        Log To Console      Post Request : ${session}/${api}
        Log To Console      Json : ${json}
#        Log To Console      Headers : ${headers}
        Create Session    postrequest   ${session}
        ${result}=   POST On Session    postrequest     ${api}  json=${json}     expected_status=any
        Log To Console   Result : ${result}
    [Return]     ${result}

Post Request For Data Type Request Body
    [Documentation]   keyword to perform post request of api data type request body
    [Arguments]    ${protocol}   ${env}    ${api}   ${params}  ${data}  ${headers}
        ${session}=   Catenate    ${protocol}://${env}
        Log To Console      Post Request : ${session}/${api}
        Log To Console      Params : ${params}
        Log To Console      Data : ${data}
        Log To Console      Headers : ${headers}
        Create Session    postrequest   ${session}
        ${result}=   POST On Session   postrequest   ${api}  params=${params}  data=${data}  headers=${headers}     expected_status=any
        Log To Console   Result : ${result}
    [Return]     ${result}

Patch Request Of Api
    [Documentation]   keyword to perform patch request of api
    [Arguments]    ${protocol}   ${env}    ${api}   ${params}  ${data}  ${headers}
        ${session}=   Catenate    ${protocol}://${env}
        Log To Console    PATCH Request : ${protocol}://${env}${api}?${params}
        Create Session      patchrequest     ${session}
        ${result}=   PATCH On Session     patchrequest   ${api}  params=${params}  json=${data}  headers=${headers}    expected_status=any
        Log To Console      Result : ${result}
    [Return]     ${result}

Validate SSL Certificate For Link
    [Documentation]   this keyword is to validate SSL certificate for link
    [Arguments]   ${results}
        ${generated_link}=    Retrive Attribute Value From The Given Response   ${results}    link
        ${status_code}=  Check SSL Certificate Status For Link   ${generated_link}
        Validate Response Of The Api    ${status_code}   ${REDIRECT_CODE_302}
        Run Keyword If  '${status_code}' != '${REDIRECT_CODE_302}'   Log     InsecureRequestWarning: Unverified HTTPS request is being made to host ${generated_link}. Adding certificate verification is strongly advised.

Check SSL Certificate Status For Link
    [Documentation]   keyword to check ssl certificate status for link
    [Arguments]    ${link}
        Create Session      headrequest     ${link}
        ${result}=   HEAD On Session     headrequest   ${link}    expected_status=any
        Log To Console      Result : ${result}
    [Return]     ${result}

Validate Json Keys
    [Documentation]   keyword to validate json keys
    [Arguments]       ${json_obtained}    ${json_actual_file}
        @{keys_obtained}=  Get Json Response Keys    ${json_obtained}
        ${keys_obtained_size}=   Get length   ${keys_obtained}
        Log To Console     keys_obtained_size : ${keys_obtained_size}
        ${json_actual}=   Load JSON From File   ${CURDIR}${/}../responses/${json_actual_file}
        @{keys_actual}=  Get Json Response Keys    ${json_actual}
        ${keys_actual_size}=   Get length   ${keys_actual}
        Log To Console    keys_actual_size : ${keys_actual_size}
        Should Be Equal    ${keys_obtained_size}   ${keys_actual_size}
        FOR    ${key}  IN  @{keys_obtained}
            Log To Console    Checking Key : ${key}
            List Should Contain Value    ${keys_actual}  ${key}
        END

Validate List Response Of Key
    [Documentation]   keyword to validate list response of key
    [Arguments]     ${key}      ${dic}
        ${type}=  Evaluate  type(${dic['${key}']})
        Should Be Equal As Strings   <type 'list'>    ${type}

Validate List According To Regex
    [Documentation]   keyword to validate list according to regex
    [Arguments]     ${obtained_list}    ${actual_regex}
        FOR  ${key}  IN   @{obtained_list}
            Log To Console    Checking Key : ${key}
            Continue For Loop If    '${key}'=='${EMPTY}'
            Should Match Regexp      ${key}   ${actual_regex}
        END

Validate Json Containing List Of Jsons As Value
    [Documentation]       This validates the json response which contains a list having json object as item.
    [Arguments]     ${json_obtained}       ${json_actual}
        @{keys_obtained}=  Get Json Response Keys    ${json_obtained}
        @{keys_actual}=     Get Json Response Keys    ${json_actual}
        FOR  ${key}  IN   @{keys_actual}
            ${typeofparam}=     Get Datatype Of        ${json_obtained['${key}']}
            Run Keyword If      '${typeofparam}'=='list'    Validate First List Item Of Json Type     ${json_obtained['${key}']}       ${json_actual['${key}']}
            Run Keyword If      '${typeofparam}'!='list'    Validate Regex      ${json_actual['${key}']}    ${json_obtained['${key}']}
        END

Validate First List Item Of Json Type
    [Documentation]     This validates the json object inside the list.
    [Arguments]     ${obtainedlist}     ${actuallist}
        ${lengthoflist}=    Get Length      ${actuallist}
        FOR    ${index}    IN RANGE        0       ${lengthoflist}
            ${obtained_dic}=     Convert To Dictionary       ${obtainedlist[${index}]}
            ${actual_dic}=     Convert To Dictionary       ${actuallist[${index}]}
            Validate Json Key Value Pairs       ${obtained_dic}      ${actual_dic}
        END

Validate Json Response For An API
    [Documentation]     this is to validate json response for an api
    [Arguments]     ${obtained_result}    ${actual_result}
        ${res}=  Set Variable     ${obtained_result}
        ${json_obtained}=  Set Variable  ${obtained_result.json()}
        Set Suite Variable   ${Resp}    ${json_obtained}
        ${json_actual}=   Load JSON From File   ${CURDIR}${/}../../responses/${actual_result}
        Validate Json Key Value Pairs   ${json_obtained}   ${json_actual}
    [Return]    ${obtained_result.json()}

Validate Json Response For An API With UTF Encoding
    [Documentation] 	this keyword is to validate the response for an api with utf encoding
    [Arguments]     ${obtained_result}    ${actual_result}
        ${res}=  Set Variable     ${obtained_result}
        ${json_obtained}=  Set Variable  ${obtained_result.json()}
        Set Test Variable    ${Resp}    ${json_obtained}
        ${file_data}=   Get File   ${CURDIR}${/}../responses/${actual_result}      encoding=UTF-8
        ${json_actual}=     Convert String to JSON      ${file_data}
        Validate Json Key Value Pairs   ${json_obtained}   ${json_actual}
    [Return]    ${obtained_result.json()}

Validate Json Response For An API With Absolute Regex Match
    [Documentation]  keyword to validate the json response for an api with absolute regex match
    [Arguments]     ${obtained_result}    ${actual_result}
        ${json_obtained}=  Set Variable  ${obtained_result.text}
	    Should Be Equal    ${json_obtained}   ${actual_result}
    [Return]    ${obtained_result.text}

Validate Json Response For An API With Specified Regex
    [Documentation]  keyword to validate the json response for an api with specified regex
    [Arguments]     ${obtained_result}    ${actual_result}      ${regex_pattern}
        ${res}=  Set Variable     ${obtained_result}
        ${json_obtained}=  Set Variable  ${obtained_result.json()}
        Set Test Variable    ${Resp}    ${json_obtained}
        ${string_json}=    Convert To String   ${json_obtained}
	    Should Match Regexp    ${string_json}    ${regex_pattern}
    [Return]    ${obtained_result.json()}

Validate Json Response For An API With Value Match
    [Documentation]   validating the boolean json response for an api with value match
    [Arguments]     ${obtained_result}    ${actual_result}      ${expected_value}
        ${res}=  Set Variable     ${obtained_result}
        ${json_obtained}=  Set Variable  ${obtained_result.json()}
        Set Test Variable    ${Resp}    ${json_obtained}
        ${string_json}=    Convert To String    ${json_obtained}
	    Should Be Equal   ${string_json}    ${expected_value}
    [Return]    ${obtained_result.json()}

Generate Site ID For Path
     [Documentation]   generates the api endpoint with path param values and returns to above keyword
     [Arguments]     ${api}      ${site_ID_value}
        ${params}=  Replace String   ${api}     {site_ID}      ${site_ID_value}
        Log To Console     ${params}
     [Return]    ${params}

Authenticate User Login
      [Documentation]   this keyword will login the user
      [Arguments]   ${protocol}		${api_environment}		${api}    ${data}
         Get Session Info   ${protocol}		${api_environment}		${sfcore_api_endpoint}     ${get_session_info_request_body}
         ${result}=  Post Request Of Api With Body		${protocol}		${api_environment}	${api}   ${data}    ${global_auth_headers}
         Log To Console    ${result}
      [Return]   ${result}

Authenticate User Login Without Body
      [Documentation]   this keyword will login the user without body
      [Arguments]   ${protocol}		${api_environment}		${api}
          Get Session Info      ${protocol}		${api_environment}		${sfcore_api_endpoint}     ${get_session_info_request_body}
          ${result}=  Post Request Of Api    ${protocol}		${api_environment}		${api}      ${global_auth_headers}
          Log To Console    ${result}
      [Return]   ${result}

Get Session Info
    [Documentation]     this keyword will get the session info
    [Arguments]     ${protocol}		${api_environment}		${api}      ${data}
          ${result}=  Post Request Of Api With Body    ${protocol}		${api_environment}		${api}      ${data}     ${EMPTY}
          ${api_req_header}=    Set Variable    ${result.headers}[Set-Cookie]
          Set To Dictionary   ${global_auth_headers}    Cookie     ${api_req_header}
          Set To Dictionary   ${global_auth_headers}    x-api-key     ${pro_service_api_headers_xapi}
          Set To Dictionary   ${global_auth_headers}    x-client-id     ${pro_service_api_headers_client}
          Log To Console     ${global_auth_headers}
          Set Suite Variable    ${global_auth_headers}
          Log To Console    ${result}
    [Return]   ${result}

Generate Random Digits
    [Documentation]     this keyword will generate random digits
    ${random_digits}=    Generate Random String    5    01234
    Log    Generated Random Digits: ${random_digits}
    [Return]   ${random_digits}


