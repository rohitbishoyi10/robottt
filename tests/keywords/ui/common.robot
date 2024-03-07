*** Settings ***
Library         BuiltIn
Library         robot.utils
Library         String
Library         Collections
Library         DateTime
Library         DependencyLibrary
Library         OperatingSystem
Library         ../custom_selenium_library.py
Library         ../custom_library.py
Resource        ../ui/signup/bh_signup.robot
Variables       ../../variables/ui/common.py
Variables       ../../locators/common.py
Variables       ../../variables/environment.py
Variables       ../../variables/browserstack.py
Variables       ../../../tests/locators/ui/signup/bh_signup_locators.py
Variables       ../../../tests/variables/ui/signup/bh_signup_variables.py
Variables       ../../../tests/variables/ui/common.py
Variables       ../../variables/${ENV}_authentication_variables.py

*** Keywords ***
Start Browser
    [Documentation]  keyword to start browser
    [Arguments]   ${category}   ${browser}
        ${Base_URL}=    Get Control Panel Base URL      ${category}
        Log To Console      ${Base_URL}
        Common Open Browser     ${Base_URL}     ${browser}

Common Open Browser
    [Documentation]  keyword to have the open browser
    [Arguments]   ${URL}    ${browser}
        Run Keyword If      '${accessibilityCheck}' == 'True'   Run Keyword And Ignore Error    Check For Accessibility Issues      ${URL}
        Run Keyword If      '${environmentToRunTest}' == 'GRID'   Go To URL    ${URL}     ${browser}
        Run Keyword If      '${environmentToRunTest}' == 'BROWSERSTACK'   Set BrowserStackDesired Capabilities And Execute    ${URL}      ${BROWSER}    ${BS_BROWSER_VERSION}   ${BS_OS}    ${BS_OS_VERSION}
        Run Keyword If      '${environmentToRunTest}' != 'BROWSERSTACK' and '${environmentToRunTest}' != 'GRID'   Go to URL Headless   ${URL}     ${browser}
        Maximize Browser Window

Go to URL Headless
    [Documentation]  keyword to start browser in headless mode
    [Arguments]  ${URL}   ${browser}
        Run Keyword If      '${browser}'=='Chrome'      Start Headless Chrome Browser
        Run Keyword If      '${browser}'=='Firefox'     Start Headless Firefox Browser
        Go To   ${URL}

Go To URL
    [Documentation]  keyword to navigate to url
    [Arguments]   ${URL}    ${browser}
        ${chrome_dc}=   Set Chrome Browser Desired Capabilities
        ${firefox_dc}=   Set Firefox Browser Desired Capabilities
        Run Keyword If    '${browser}'=='Chrome'    Open Browser    ${URL}     ${browser}   remote_url=${HOST_URL}     desired_capabilities=${chrome_dc}
        Run Keyword If    '${browser}'=='Firefox'   Open Browser    ${URL}     ${browser}   remote_url=${HOST_URL}     desired_capabilities=${firefox_dc}

Set BrowserStackDesired Capabilities And Execute
    [Documentation]  keyword to set desired capabilities for BrowserStack
    [Arguments]     ${URL}      ${BS_BROWSER}    ${BS_BROWSER_VERSION}    ${BS_OS}    ${BS_OS_VERSION}
        ${BS_REMOTE_URL}=       Set Variable    http://${username}:${accessKey}@hub.browserstack.com/wd/hub
        Set Test Case Name For BrowserStack Execution
        ${timestamp}=       Get Current Date    result_format=%d-%m-%Y
        ${BS_BUILD_TIMESTAMP}=  Catenate    ${BS_PROJECT_NAME}   ${timestamp}
        ${BROWSER_OS_CONFIG}=   Set Variable    ${BS_BROWSER}-${BS_BROWSER_VERSION}&${BS_OS}-${BS_OS_VERSION}
        ${BS_BUILD}=        Catenate    ${BS_BUILD_TIMESTAMP}   ${BROWSER_OS_CONFIG}
        Open Browser   url=${URL}   browser=${BS_BROWSER}   remote_url=${BS_REMOTE_URL}   desired_capabilities=browserName:${BS_BROWSER},browserVersion:${BS_BROWSER_VERSION},os:${BS_OS},osVersion:${BS_OS_VERSION},projectName:${BS_PROJECT_NAME},sessionName:${SUITE_TC_NAME},buildName:${BS_BUILD},browserstack.idleTimeout:${TEST_TIMEOUT_LONG},browserstack.autoWait:${EXPLICIT_TIMEOUT},browserstack.networkLogs:true,browserstack.debug:true,resolution:${BS_DEFAULT_RESOLUTION},browserstack.maskBasicAuth:true,browserstack.console:errors,browserstack.use_w3c:true

Set Test Case Name For BrowserStack Execution
    [Documentation]  keyword to set test case name for browserstack pass execution
        ${BS_TESTCASE_NAME}=    Get Testcase Name
        Run Keyword If  '${BS_TESTCASE_NAME}' == 'None' or '${BS_TESTCASE_NAME}' == ''     Set Suite Variable  ${SUITE_TC_NAME}    Test Setup/Teardown
        ...     ELSE    Set Suite Variable  ${SUITE_TC_NAME}    ${BS_TESTCASE_NAME}

Set Chrome Browser Desired Capabilities
    [Documentation]  Create the desired capabilities object with which to instantiate the Chrome browser
        ${options}=    Evaluate   sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
        Call Method  ${options}  add_argument  --no-sandbox
        Call Method  ${options}  add_argument  --start-fullscreen
        Call Method  ${options}  add_argument  --incognito
        Call Method  ${options}  add_argument  --disable-dev-shm-usage
        Call Method  ${options}  add_argument  ignore-certificate-errors
        ${caps}=    Call Method    ${options}    to_capabilities
    [Return]   ${caps}

Set Firefox Browser Desired Capabilities
    [Documentation]  Create the desired capabilities object with which to instantiate the Firefox browser
        ${options}=    Evaluate   sys.modules['selenium.webdriver'].FirefoxOptions()   sys, selenium.webdriver
        ${caps}=    Evaluate    sys.modules['selenium.webdriver'].common.desired_capabilities.DesiredCapabilities.FIREFOX    sys,selenium.webdriver
        Call Method  ${options}  add_argument  --no-sandbox
        Call Method  ${options}  add_argument  --start-fullscreen
        Call Method  ${options}  add_argument  --incognito
        Call Method  ${options}  add_argument  --disable-dev-shm-usage
        Call Method  ${options}  add_argument  ignore-certificate-errors
        ${caps}=    Call Method    ${options}    to_capabilities
    [Return]   ${caps}

Start Headless Chrome Browser
    [Documentation]    Starts a chrome browser to be stimualted on xvfb.
        ${options}=    Evaluate   sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
        Call Method  ${options}  add_argument  --no-sandbox
        Call Method  ${options}  add_argument  --headless
        Call Method  ${options}  add_argument  --window-size\=1920x1080
        Call Method  ${options}  add_argument  --disable-dev-shm-usage
        Call Method  ${options}  add_argument  --start-maximized
        Call Method  ${options}  add_argument  ignore-certificate-errors
        Create Webdriver  Chrome  chrome_options=${options}
        Set Selenium Timeout    60s
        Set Selenium Implicit Wait      0 seconds
        Set Selenium Speed      0 seconds

Start Headless Firefox Browser
      [Documentation]  starts a firefox browser to be stimualted on xvfb
      ${profile}=    Evaluate   sys.modules['selenium.webdriver'].FirefoxProfile()   sys, selenium.webdriver
      ${caps}=  Evaluate  sys.modules['selenium.webdriver'].common.desired_capabilities.DesiredCapabilities.FIREFOX  sys
      Set To Dictionary  ${caps}  CapabilityType.UNEXPECTED_ALERT_BEHAVIOUR=UnexpectedAlertBehaviour.ACCEPT
      #call method  ${profile}  add_argument  --start-maximized
      Create Webdriver  Firefox  firefox_profile=${profile}

Get Control Panel Base URL
    [Documentation]  keyword to get control panel base url
    [Arguments]     ${url_category}
      ${BASE_URL}=  Catenate  ${controlpanel_protocol}://${controlpanel_environment}${url_category}
    [Return]  ${BASE_URL}

### Login to Roster User ##
Run Keyword If AD User Login Page Appears
    [Documentation]  keyword to check if the AD user login page appears to fill the details
        ${value}=   Run Keyword And Return Status    Wait Until Page Contains Element    ${roster_username_locator}     timeout=${SHORT_EXPLICIT_TIMEOUT}
        Run Keyword If    '${value}' == 'True'     Login With AD User Credentials

Login With AD User Credentials
    [Documentation]   keyword to login with the roster admin login credentials
        Wait Until Page Contains Element    ${roster_username_locator}      timeout=${EXPLICIT_TIMEOUT}
        Input Text And Validate The Field    ${BH_AD_USERNAME_VARIABLE}     ${roster_username_locator}
        Sleep   3s
        Input Password And Validate The Field    ${BH_AD_PASSWORD_VARIABLE}     ${roster_password_locator}
        Wait Until Page Contains Element And Click    ${roster_login_button_locator}

Input Text And Validate The Field
    [Documentation]  keyword to input text and validate the text field content if all the letters are added
    [Arguments]   ${value}     ${locator}
        Wait Until Page Contains Element	${locator}      timeout=${EXPLICIT_TIMEOUT}
        FOR  ${item}  IN RANGE   0    5
            Input Text          ${locator}   ${value}
            ${inserted_text}=     Get Value     ${locator}
            ${result}=       Run Keyword And Return Status    Should Be Equal     ${inserted_text}    ${value}
            Exit for loop if    '${result}' == 'True'
        END

Input Password And Validate The Field
    [Documentation]  keyword to input text and validate the text field content if all the letters are added
    [Arguments]   ${value}     ${locator}
        Wait Until Page Contains Element	${locator}      timeout=${EXPLICIT_TIMEOUT}
        FOR  ${item}  IN RANGE   0    5
            Input Password          ${locator}   ${value}
            ${inserted_text}=     Get Value     ${locator}
            ${result}=       Run Keyword And Return Status    Should Be Equal     ${inserted_text}    ${value}
            Exit for loop if    '${result}' == 'True'
        END

Navigate To My Purchases Section
    [Documentation]   keyword to navigate to my purchases section from the user account dropdown
        Wait Until Page Contains Element    ${icon_user_avatar_locator}     timeout=${EXPLICIT_TIMEOUT}
        Wait Until Keyword Succeeds    5x    5s    Click Element    ${icon_user_avatar_locator}
        Wait Until Page Contains Element And Click    ${icon_mypurchases_locator}

Enter the Zipcode Details for Profile
    [Documentation]  keyword to only update the zip value
    [Arguments]   ${pincode_locator}   ${zipcode}
        Wait Until Keyword Succeeds    5x    5s    Wait Until Page Contains Element    ${pincode_locator}    timeout=${EXPLICIT_TIMEOUT}
        Input Into Text Field   ${pincode_locator}  ${zipcode}

#####  Test Setup #####
Test Setup To Start Browser And To Change Preferred Currency
    [Documentation]  Keyword which will be executed as a setup for every test case
    [Arguments]      ${url_category}
        Start Browser     ${inr_pref_curr_url_category}    ${BROWSER}
        Custom Run Keyword If Element Present And Click   ${close_header_support_banner_locator}

Custom Run Keyword If Element Present And Click
    [Documentation]   Keyword to execute the following code if the page contains element
    [Arguments]     ${locator}
        ${value}=   Run Keyword And Return Status    Element Should Be Visible   ${locator}      timeout=${SHORT_EXPLICIT_TIMEOUT}
        Run Keyword If    '${value}' == 'True'     Wait Until Page Contains Element And Click    ${locator}

Wait For Element And Mouse Over
    [Documentation]  Keyword to combine the element wait and then Mouse hover on element including the explicit timeout
    [Arguments]    ${locator}
        Wait Until Page Contains Element    ${locator}      timeout=${EXPLICIT_TIMEOUT}
        Wait Until Element Is Enabled     ${locator}    timeout=${SHORT_EXPLICIT_TIMEOUT}
        Mouse Over   ${locator}

## Login to Bluerock through UI
Login To Bluerock Panel And Verify Successful Login
    [Documentation]  This keyword will login to bluerock panel with the given credentials and validates the success login
    [Arguments]  ${login_username}  ${login_password}
        Start Browser    ${login_url_category}   ${BROWSER}
        Enter Login Credentials  ${login_username}  ${login_password}
        Click On Login Button
        Login With AD User Credentials

Enter Login Credentials
    [Documentation]   This keyword is to locate and input the login email and password fields
    [Arguments]     ${login_username}  ${login_password}
        Input Text ${login_username} In ${login_domain_name_locator}
        Input Password ${login_password} In ${login_password_locator}

Click On Login Button
    [Documentation]   This will locate the login button and clicks on it
        Wait Until Page Contains Element And Click      ${btn_login_locator}

Logout from Bluerock cPanel
    [Documentation]     Logout from cPanel after navigating from bluerock panel
        ${verify}=  Run Keyword And Return Status  Wait Until Page Contains Element  ${lnk_cpanel_hometab_locator}  timeout=${EXPLICIT_TIMEOUT}
        Run Keyword If  '${verify}' == 'True'  Wait Until Page Contains Element And Click  ${lnk_cpanel_hometab_locator}
        ${status}=  Run Keyword And Return Status  Wait Until Keyword Succeeds  3x  2s  Page Should Contain Element  ${close_wp_creatorcon_banner_locator}
        Run Keyword If  '${status}' == 'True'  Check If Element Present And Click  ${close_wp_creatorcon_banner_locator}
        Wait Until Keyword Succeeds     5x  5s     Wait Until Page Contains Element      ${icon_user_avatar_locator}
        Wait Until Page Contains Element And Click    ${icon_user_avatar_locator}
        Wait Until Page Contains Element And Click    ${lnk_user_logout_locator}
        Wait Until Page Contains Element    ${btn_login_locator}    timeout=${EXPLICIT_TIMEOUT}
        Close All Browsers

Strip The Protocol From The Website Name
    [Documentation]  since the website after adding the http(s) protocol will be removed
    [Arguments]    ${website_name}
        ${https}=   Run Keyword And Return Status     Should Contain    ${website_name}    https://
        ${http}=   Run Keyword And Return Status     Should Contain    ${website_name}    http://
        ${website_name}=    Run Keyword If  '${https}' == 'True'   Remove String    ${website_name}     https://
        ...    ELSE IF    '${http}' == 'True'    Remove String    ${website_name}     http://
        ...    ELSE       Set Variable     ${website_name}
    [Return]   ${website_name}

Navigate To Site Url
    [Documentation]  This keyword is to navigate to site url
    [Arguments]     ${site_url}
        Set Suite Variable  ${SUITE_SITE_URL_THUMBNAIL}   //div[@class="text-ellipsis" and text()="${site_url}"]/../../../../div[@class="pull-left card-thumbnail"]
        ${status}=  Run Keyword And Return Status   Wait Until Page Contains Element    ${SUITE_SITE_URL_THUMBNAIL}   ${MEDIUM_EXPLICIT_TIMEOUT}
        Run Keyword If  '${status}' == 'False'      Scroll Until End Of Page
        Scroll Element Into View Dynamically     ${SUITE_SITE_URL_THUMBNAIL}    ${default_offset}

Navigate to Site Details Via Thumbnail
    [Documentation]  This keyword is to navigate to site details via thumbnail
    [Arguments]     ${site_url}
        Navigate To Site Url    ${site_url}
        Wait Until Keyword Succeeds     5x  5s      Click Element    ${SUITE_SITE_URL_THUMBNAIL}
        Wait Until Keyword Succeeds     5x  5s      Page Should Contain Element     //div[@class="text-ellipsis client-name"]/span[text()="${site_url}"]

Adding Additional Wait Due To Rate Limiting
    [Documentation]  Keyword to add additional sleep due to rate limiting feature on prod
        Sleep   10s

Add The Protocol To The Website Name If Not Present
    [Documentation]  since the website after adding the http(s) protocol will be removed
    [Arguments]    ${website_name}
        ${http}=   Run Keyword And Return Status     Should Contain    ${website_name}    http
        ${website_name}=    Run Keyword If  '${http}' == 'False'   Catenate    https://${website_name}
        ...    ELSE       Set Variable     ${website_name}
    [Return]   ${website_name}

Open New Window With Link
    [Documentation]  to open a new window to access the link
    [Arguments]    ${url}
        Execute Javascript   window.open()
        Switch Window   locator=NEW
        Go To   ${url}

Close Window Switch Window And Reload Page
    [Documentation]  keyword to close the window and reload the page
    [Arguments]    ${title}
        Close Window
        Switch Window    title=${title}
        Sleep   5s
        Reload Page

Common Suite Setup
    [Documentation]    This runs before Suite Execution starts.
        No Operation

Common Test Teardown
    [Documentation]    This runs after the Suite execution completes.
    [Arguments]   ${expected_url_category}
        ${expected_url}=    Get Control Panel Base URL     ${expected_url_category}
        Logout from the user session    ${expected_url}
        Close All Browsers

Scroll Page To Location
    [Documentation]  keyword to scroll page to location based on x and y coordinates
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})

Input Text ${value} In ${locator}
    [Documentation]  This is to input the value in the locator.
        Wait Until Page Contains Element	${locator}      timeout=${EXPLICIT_TIMEOUT}
        Wait Until Element Is Enabled	${locator}
		Input Text	${locator}	${value}

Input Password ${value} In ${locator}
    [Documentation]  This is to input the password value in the locator.
        Wait Until Page Contains Element	${locator}      timeout=${EXPLICIT_TIMEOUT}
        Wait Until Element Is Enabled	${locator}
		Input Password	${locator}	${value}

Wait Until Page Contains Element And Click
    [Documentation]  keyword to combine the element wait and then click on element including the explicit timeout
    [Arguments]    ${locator}
        Wait Until Page Contains Element    ${locator}      timeout=${EXPLICIT_TIMEOUT}
        Click Element   ${locator}

Wait Until Page Contains Element And Mouse Over
    [Documentation]  keyword to combine the element wait and then mouse over on element including the explicit timeout
    [Arguments]    ${locator}
        Wait Until Page Contains Element    ${locator}      timeout=${EXPLICIT_TIMEOUT}
        Wait Until Keyword Succeeds    5x    5s    Mouse Over   ${locator}

Scroll And Wait For Page Should Contain Element
    [Documentation]   keyword to scroll to element and verify the element on page
    [Arguments]    ${locator}    ${offset}
        Scroll Element Into View Dynamically    ${locator}    ${offset}
        Wait For Page Should Contain Element    ${locator}

For Loop To Click On Element
    [Documentation]    keyword to click on element till the operation is working
    [Arguments]     ${locator}    ${element_to_appear}
        FOR     ${operation}    IN RANGE     0      10
            Wait Until Keyword Succeeds    5x    5s    Wait Until Page Contains Element     ${locator}      timeout=${EXPLICIT_TIMEOUT}
            Wait Until Keyword Succeeds    5x    5s    Click Element     ${locator}
            ${status}=   Run Keyword And Return Status      Wait Until Element Is Visible     ${element_to_appear}      timeout=${MEDIUM_EXPLICIT_TIMEOUT}
            Exit For Loop If    '${status}' == 'True'
        END

For Loop To Move Over On Element
    [Documentation]    keyword to move over and click on element till the operation is working
    [Arguments]     ${locator}    ${element_to_appear}
        FOR     ${operation}    IN RANGE     0      2
            Wait Until Page Contains Element    ${locator}      timeout=${EXPLICIT_TIMEOUT}
            Wait Until Keyword Succeeds    5x    5s    Mouse Over     ${locator}
            ${status}=   Run Keyword And Return Status      Wait Until Element Is Visible     ${element_to_appear}      timeout=${MEDIUM_EXPLICIT_TIMEOUT}
            Exit For Loop If    '${status}' == 'True'
        END

## Login to Icluster
Login To Icluster And Verify Successful Login
    [Documentation]  This keyword will login to icluster and verify the successfull login
        Start Browser    ${login_cpm_url_category}   ${BROWSER}
        Login With AD User Credentials

Mouse Over Element And Verify Another Element On Page
    [Documentation]   this keyword is used to mouse over an element and verify another element on page
    [Arguments]    ${element_locator1}      ${element_locator2}
        Wait Until Page Contains Element And Mouse Over      ${element_locator1}
        Page Should Contain Element     ${element_locator2}

Wait For Page Should Contain Element
    [Documentation]   this keyword will wait and assert if page contains element
    [Arguments]    ${locator}
        Wait Until Page Contains Element    ${locator}      timeout=${EXPLICIT_TIMEOUT}
        Page Should Contain Element     ${locator}

Validate Element Content
    [Documentation]   This keyword is validating the content of the element as expected according to the given locator
    [Arguments]     ${actual_value_locator}     ${expected_value}
        Wait Until Page Contains Element	${actual_value_locator}      timeout=${EXPLICIT_TIMEOUT}
        Wait Until Element Is Enabled	${actual_value_locator}
        ${actual_message}=   Get Text   ${actual_value_locator}
        Log To Console   ${actual_message}
        Should Be Equal     ${actual_message}     ${expected_value}

Assert Element Text
    [Documentation]  This keyword is to validate all the error messages
    [Arguments]   ${expected_value}
        ${actual_value_xpath}=    Set Variable     //*[contains(text(),"${expected_value}")]
        Wait Until Page Contains Element    ${actual_value_xpath}     timeout=${EXPLICIT_TIMEOUT}
        Wait Until Keyword Succeeds    5x    5s    Element Should Be Visible    ${actual_value_xpath}
        Page Should Contain Element     ${actual_value_xpath}

Validate Text Field Content
    [Documentation]   keyword to validate the text field content
    [Arguments]   ${expected_value}  ${actual_value_locator}
        Wait Until Page Contains Element	${actual_value_locator}      timeout=${EXPLICIT_TIMEOUT}
        Wait Until Element Is Enabled	${actual_value_locator}
        ${actual_message}=   Get Value  ${actual_value_locator}
        Log To Console   ${actual_message}
        Should Be Equal     ${actual_message}     ${expected_value}

Input Into Text Field
    [Arguments]    ${field}    ${text}
    [Documentation]    Keyword is just an input text keyword. That clears the text field dynamically.
        Wait Until Page Contains Element	${field}      timeout=${MEDIUM_EXPLICIT_TIMEOUT}
        ${field_text}=    Get Value    ${field}
        ${field_text_length}=    Get Length    ${field_text}
        Clear Field of Characters    ${field}    ${field_text_length}
        Press Keys    ${field}    ${text}

Clear Field Of Characters
    [Documentation]    This keyword pushes the delete key (ascii: \8) a specified number of times in a specified field.
    [Arguments]    ${field}    ${character_count}
    FOR    ${index}    IN RANGE    ${character_count}+1
        Press Keys    ${field}    BACKSPACE
    END

Reload Page And Wait Until Element Is Enabled
    [Documentation]   To wait until the element is enabled and keep reloading page
    [Arguments]         ${locator}
        Reload Page
        Wait Until Element Is Enabled      ${locator}    timeout=${EXPLICIT_TIMEOUT}

Scroll Element Into View Dynamically
    [Documentation]   keyword to scroll the element into view dynamically
    [Arguments]    ${locator}    ${offset}
        Wait Until Page Contains Element    ${locator}      timeout=${EXPLICIT_TIMEOUT}
        ${btn_vertical_position}=   Get Vertical Position    ${locator}
        ${offset_value}=    Evaluate     ${btn_vertical_position} - ${offset}
        Scroll Page To Location    0   ${offset_value}

Scroll Element Into View Dynamically And Click
    [Documentation]   Keyword to scroll the element into view dynamically and click
    [Arguments]    ${locator}    ${offset}
        Scroll Element Into View Dynamically    ${locator}    ${offset}
        Wait Until Page Contains Element And Click    ${locator}

Scroll Until End Of Page
    [Documentation]   Keyword to scroll until end of page
        Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

Select The Checkboxes With Explicit Wait And Verify
    [Documentation]  keyword to select the checkboxes
    [Arguments]     ${locator}
        Wait Until Page Contains Element    ${locator}      timeout=${EXPLICIT_TIMEOUT}
        Select Checkbox     ${locator}
        Checkbox Should Be Selected    ${locator}

Unselect The Checkboxes With Explicit Wait And Verify
    [Documentation]  keyword to unselect the checkboxes
    [Arguments]     ${locator}
        Wait Until Page Contains Element    ${locator}      timeout=${EXPLICIT_TIMEOUT}
        Unselect Checkbox     ${locator}
        Checkbox Should Not Be Selected    ${locator}

Check If Element Present And Click
    [Documentation]     this is a common keyword to click on cta if present
    [Arguments]      ${cta}
        ${status}=   Run Keyword And Return Status      Wait Until Element Is Visible     ${cta}      timeout=${MEDIUM_EXPLICIT_TIMEOUT}
        Run Keyword If  '${status}' == 'True'    Wait Until Page Contains Element And Click      ${cta}

Upload File
    [Documentation]     keyword to upload file
    [Arguments]     ${file_upload_locator}    ${file_path}
        ${NORMAL_PATH_UPLOAD_FILE_NAME}=    Normalize Path  ${file_path}
        Choose File     ${file_upload_locator}     ${NORMAL_PATH_UPLOAD_FILE_NAME}

Set Session Storage Item
    [Documentation]     keyword to set session storage item
    [Arguments]     ${item}     ${value}
        Execute JavaScript    window.sessionStorage.setItem("${item}","${value}")

Fetch Numeric Value From String And Return
    [Documentation]  keyword to fetch numeric value from string and return
    [Arguments]     ${locator}
        ${text}=    Get Text    ${locator}
        ${numeric_val}=       Return Numeric Value From String      ${text}
    [Return]        ${numeric_val}

Open browser and validate BH Homepage And Select Shared Hosting Plan
   [Documentation]  this keyword will perform action on fos page and to reach till plan selection page
       Open Browser  ${BH_PROD_LOGIN_URL}   ${BROWSER}
       Maximize Browser Window
       Mouse Over  ${link_hosting_locator}
       Wait Until Page Contains Element    ${lbl_shared_hosting_locator}
       Click element      ${lbl_shared_hosting_locator}
       Wait Until Page Contains Element    ${btn_get_started_locator}
       Click Button    ${btn_get_started_locator}

Enter The Check Number And Click On Submit Button
    [Documentation]   keyword to enter the check number and click on submit button
        Scroll Element Into View Dynamically And Click      ${chkbx_check_payment_method_locator}     ${default_offset}
        Capture Page Screenshot
        Input Text     ${txt_check_no_locator}  ${check_no_variable}
        Capture Page Screenshot
        Click Button          ${btn_acc_info_submit_locator}

Validate The Signup Success And Validate Onboarding And Bluerock Home Page
    [Documentation]  as soon as the payment is completed, the signup success page is validated
        Sleep  10s
        Wait Until Keyword Succeeds    5x   5s     Scroll Element Into View Dynamically     ${lbl_signup_purchase_success_locator}  ${default_offset}
        Wait Until Page Contains Element    ${lbl_signup_purchase_success_locator}      timeout=${EXPLICIT_TIMEOUT}
        Click Create Account To Set The Password For An Account
        Enter Roster Credentials And Login
        Enter Password In Create Password Section And Validate Home Page
        Skipping Onboarding Steps And To Verify Bh Home Page

Validate Office Address In the Signup Sucess Page
    [Documentation]  as soon as the payment is completed, the signup success page is validated along with office address validation
        Sleep  10s
        Wait Until Keyword Succeeds    5x   5s     Scroll Element Into View Dynamically     ${lbl_signup_purchase_success_locator}  ${default_offset}
        Wait Until Page Contains Element    ${lbl_signup_purchase_success_locator}      timeout=${EXPLICIT_TIMEOUT}
        Wait Until Page Contains Element    ${office_address1_success_locator}      timeout=${EXPLICIT_TIMEOUT}
        Wait Until Page Contains Element    ${office_address2_success_locator}      timeout=${EXPLICIT_TIMEOUT}
        Wait Until Page Contains Element    ${office_address3_success_locator}      timeout=${EXPLICIT_TIMEOUT}
        Wait Until Page Contains Element    ${office_address4_success_locator}      timeout=${EXPLICIT_TIMEOUT}
        Wait Until Page Contains Element    ${office_address5_success_locator}      timeout=${EXPLICIT_TIMEOUT}

Set Focus To Element And Click
    [Documentation]  Will focus on the element on the page and perform the click element operation
    [Arguments]    ${locator}
        Wait Until Element Is Enabled     ${locator}    timeout=${EXPLICIT_TIMEOUT}
        Set Focus To Element     ${locator}
        Wait Until Page Contains Element   ${locator}
        Click Element    ${locator}

Select The Value By Label With Explicit Wait
    [Documentation]   Keyword to select the auto form fill from internal options
    [Arguments]     ${locator}      ${variable}
        Wait Until Page Contains Element    ${locator}      timeout=${EXPLICIT_TIMEOUT}
        Select From List By Label       ${locator}      ${variable}

Click Create Account To Set The Password For An Account
   [Documentation]  Keyword to click the create button in success page
        Scroll Element Into View Dynamically And Click      ${btn_signup_create_account_locator}     ${default_offset}
        Switch Window   locator=NEW

Validate Select List Type Content
    [Documentation]  Keyword to validate the value from a select type list variable
    [Arguments]   ${expected_value}  ${actual_value_locator}
        Wait Until Page Contains ELement	${actual_value_locator}      timeout=${EXPLICIT_TIMEOUT}
        Wait Until Element Is Enabled	${actual_value_locator}
        ${selected_value}=    Get Selected List Value     ${actual_value_locator}
        Should Be Equal     ${selected_value}     ${expected_value}

Enter Password In Create Password Section And Validate Home Page
    [Documentation]  This is to enter the password in create password page
        Wait Until Page Contains Element And Click                ${txt_chgpass_create_pass_locator}
        ${hosting_random_password} =    Generate Random String
        ${account_password} =  catenate   ${hosting_random_password}    ${BH_SPECIAL_CHAR_VARIABLE}
        Set Suite Variable       ${SUITE_RANDOM_HOSTING_PASSWORD_VARIABLE}    ${account_password}
        Input Text    ${txt_chgpass_create_pass_locator}     ${SUITE_RANDOM_HOSTING_PASSWORD_VARIABLE}
        Wait Until Keyword Succeeds    5x   5s     Page Should Not Contain Element      ${btn_chgpass_success_gotologin_locator}
        Wait Until Keyword Succeeds    5x   5s      Wait Until Page Contains Element And Click               ${txt_chgpass_retry_pass_locator}
        Input Text     ${txt_chgpass_retry_pass_locator}     ${SUITE_RANDOM_HOSTING_PASSWORD_VARIABLE}
        Press Keys   ${txt_chgpass_retry_pass_locator}    RETURN
        Select The Checkboxes With Explicit Wait And Verify          ${chkbx_chgpass_terms_locator}
        Wait Until Keyword Succeeds    3x   5s      Wait Until Page Contains Element And Click          ${btn_chgpass_createacc_locator}
        ${status}=    Run Keyword And Return Status      Wait Until Keyword Succeeds    3x   5s      Wait Until Page Contains Element   ${btn_create_your_website_locator}
        Run Keyword If    '${status}' == 'False'     Click create account button to set the password in for loop

Click create account button to set the password in for loop
     FOR  ${item}  IN RANGE    0     5
         Press Keys   ${btn_chgpass_createacc_locator}    RETURN
         Wait Until Page Contains Element And Click           ${btn_chgpass_createacc_locator}
         ${result}=       Run Keyword And Return Status    Scroll Element Into View Dynamically And Click    ${btn_create_your_website_locator}   ${default_offset}
         Exit for loop if    '${result}' == 'True'
     END

Skipping Onboarding Steps And To Verify Bh Home Page
    [Documentation]  This keyword will skip the new user website creation step
        Sleep   10s
        ${result}=  Run Keyword And Return Status    Scroll Element Into View Dynamically      ${lnk_skipthisstep_locator}     ${default_offset}
        Run Keyword If    '${result}' == 'True'     Onboarding Steps For Non-WooCommerce Hosting And Verify Landing Page
        Run Keyword If    '${result}' == 'False'    Onboarding Steps For WooCommerce Hosting And Verify Landing Page

Onboarding Steps For Non-WooCommerce Hosting And Verify Landing Page
    [Documentation]  This Keyword will skip onboarding steps of non-woocommerce plans
        Wait Until Keyword Succeeds    20x   5s    Scroll Element Into View Dynamically And Click      ${lnk_skipthisstep_locator}     ${default_offset}
        Wait Until Keyword Succeeds    3x   5s     Scroll Element Into View Dynamically And Click       ${btn_card_selection}           ${default_offset}
        Wait Until Keyword Succeeds    3x   5s     Scroll Element Into View Dynamically And Click      ${lnk_skipthisstep_locator}      ${default_offset}
        Wait Until Keyword Succeeds    3x   5s     Scroll Element Into View Dynamically And Click       ${lnk_skipthisstep_locator}     ${default_offset}
        Wait Until Keyword Succeeds    3x   5s     Scroll Element Into View Dynamically And Click      ${lnk_skipthisstep_locator}       ${default_offset}
        Wait Until Keyword Succeeds    3x   5s     Wait Until Page Contains Element        ${lnk_bhlogin_hometab_locator}      timeout=${EXPLICIT_TIMEOUT}

Onboarding Steps For WooCommerce Hosting And Verify Landing Page
    [Documentation]  This Keyword will skip onboarding steps of woocommerce plans
        Pass Execution    Success
        #will do this onboarding validation in a different story

Enter The Check Number And Click On Process Order Button
    [Documentation]   Keyword to enter the check number and click on process order button in cart page
        Wait Until Keyword Succeeds    5x   5s     Wait Until Page Contains Element And Click        ${radio_check_locator}
        Input Text     ${txt_check_number_locator}    ${check_no_variable}
        Scroll Element Into View Dynamically       ${btn_process_order_locator}            ${default_offset}
        Wait Until Keyword Succeeds    5x   5s     Wait Until Page Contains Element And Click        ${btn_process_order_locator}
        Run Keyword If  '${ENV}' == 'prod'   Adding Additional Wait Due To Rate Limiting

Test Setup To Start Browser And Navigate To Free Trial Signup Page
    [Documentation]  Keyword to navigate to bluehost login page as a Test Setup
        ${freetrialhosting_url_category}=     Catenate      ${sign_up_page_url_category}?${freetrialhosting_url_params_variable}
        Start Browser    ${freetrialhosting_url_category}     ${BROWSER}
        Run Keyword If  '${ENV}' == 'prod'   Adding Additional Wait Due To Rate Limiting
        Run Keyword If AD User Login Page Appears
        Wait Until Keyword Succeeds    5x   5s     Wait Until Page Contains Element     ${txt_free_hosting_locator}
        Custom Run Keyword If Element Present And Click       ${close_header_support_banner_locator}

Validate The Signup Success And Validate Onboarding And Bluerock Home Page For Feeetrial Flow
    [Documentation]  as soon as the payment is completed, the signup success page is validated
        Wait Until Keyword Succeeds    5x   5s     Scroll Element Into View Dynamically     ${lbl_signup_purchase_success_locator}  ${default_offset}
        Wait Until Page Contains Element    ${lbl_signup_purchase_success_locator}      timeout=${EXPLICIT_TIMEOUT}
        Click Create Account To Set The Password For An Account
        Enter Roster Credentials And Login
        Enter Password In Create Password Section And Validate Home Page
        Onboarding Steps For Non-WooCommerce Hosting And Verify Landing Page

Create Random Domain Name
    [Documentation]  Creates a random domain name using robot libraries
    [Arguments]  ${tld_extension_variable}=com
        ${current_date}=    Get Current Date    result_format=%d%m%Y%H%M%S
        ${random_domain_name}=    Catenate     test-bh-${ENV}-domain${current_date}.${tld_extension_variable}
    [Return]   ${random_domain_name}

Validate The More Information Links Under Package Extras
    [Documentation]  verify the package extras more information link
    [Arguments]     ${more_info_locator}   ${more_info_popup_locator}
        Wait Until Keyword Succeeds    5x   5s     Wait Until Page Contains Element And Click       ${more_info_locator}
        Wait Until Page Contains Element    ${more_info_popup_locator}
        Wait Until Page Contains Element And Click    ${btn_close_popup_locator}

Validate The Package Extras For The Addons
    [Documentation]  verify the package extras for all the addons
        Validate The More Information Links Under Package Extras    ${lnk_more_info_domain_privacy_locator}   ${txt_dp_popup_locator}
        Validate The More Information Links Under Package Extras    ${lnk_more_info_codeguard_locator}       ${txt_codeguard_popup_locator}
        Validate The More Information Links Under Package Extras    ${lnk_more_info_ssl_locator}         ${txt_ssl_popup_locator}
        Validate The More Information Links Under Package Extras    ${lnk_more_info_yoast_locator}       ${txt_yoast_popup_locator}
        Validate The More Information Links Under Package Extras    ${lnk_more_info_sitelock_locator}      ${txt_sitelock_popup_locator}

Validate Deactivation Status Of The Accounts
    [Documentation]  verify account status for deactivated accounts
        Wait Until Keyword Succeeds    5x   5s     Wait Until Page Contains Element      ${txt_deactive_account_locator}
        Page Should Contain Element     ${text_complete_deactive_locator}
        Run Keyword If  '${ENV}' == 'prod'   Adding Additional Wait Due To Rate Limiting