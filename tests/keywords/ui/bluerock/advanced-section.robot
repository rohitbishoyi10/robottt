*** Settings ***
Resource        ../../../../tests/keywords/ui/common.robot
Variables       ../../../../tests/locators/ui/bluerock/advanced-section.py
Variables       ../../../../tests/variables/ui/bluerock/advanced_section.py

*** Keywords ***

Validate Advanced Section in Bluerock Panel
    [Documentation]     Validate advanced section after login to account
        ${verify}=  Run Keyword And Return Status  Wait Until Page Contains Element  ${button_upsell_locator}  timeout=${EXPLICIT_TIMEOUT}
        Run Keyword If  '${verify}' == 'True'  Wait Until Page Contains Element And Click  ${button_upsell_locator}
        Wait Until Keyword Succeeds    5x   5s     Wait Until Page Contains Element And Click     ${advanced_tab_locator}
        Switch Window   locator=NEW
        Wait Until Element Is Enabled    ${general_information_locator}

Validate Email fields inside Advanced Section
    [Documentation]    Validate email field present inside advance section
        Validate Email Accounts in Advance Section
        Validate Forwarders in Advance Section
        Validate Email Routing in Advance Section
        Validate Autoresponders in Advance Section
        Validate Mailing List in Advance Section
        Validate Global Email Filters in Advance Section
        Validate Email Filters in Advance Section
        Validate Spam Filter in Advance Section
        Validate Encryption in Advance Section
        Validate Box Trapper in Advance Section
        Validate Calanders and Contacts in Advance Section
        Validate Email Disk Usage in Advance Section

Validate FIle Manager fields inside Advanced Section
    [Documentation]    Validate file manager field present inside advance section
        Validate FIle Manager in Advance Section
        Validate Images in Advance Section
        Validate Directory Privacy in Advance Section
        Validate Disk Usage in Advance Section
        Validate Web Disk in Advance Section
        Validate Ftp Accounts in Advance Section
        Validate Ftp Connection in Advance Section
        Validate Ftp Anonymous in Advance Section
        Validate Git Versioncontrol in Advance Section

Validate Database fields inside Advanced Section
    [Documentation]    Validate database field present inside advance section
        Validate MYsql DB Wizard in Advance Section
        Validate MySql Db in Advance Section
        Validate Remote MySql in Advance Section
        Validate Postgre Sql Database in Advance Section
        Validate Postgre Sql Database Wizard in Advance Section

Validate Metrics fields inside Advanced Section
    [Documentation]    Validate metrics field present inside advance section
        Validate Visitors in Advance Section
        Validate Bandwidth in Advance Section
        Validate Rawaccess in Advance Section
        Validate Awstats in Advance Section
        Validate Weblizer in Advance Section
        Validate Weblizerftp in Advance Section
        Validate Metrics Editor in Advance Section

Validate Email Accounts in Advance Section
    [Documentation]     Validate email accounts in Advance Section
        Wait Until Element Is Visible       ${button_email_account_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_email_account_locator}
        Wait Until Element Is Enabled    ${text_email_accounts_locator}
        Go Back

Validate Forwarders in Advance Section
    [Documentation]     Validate Forwarders in Advance Section
        Wait Until Element Is Visible       ${button_forwarders_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_forwarders_locator}
        Wait Until Element Is Enabled    ${text_forwarders_locator}
        Go Back

Validate Email Routing in Advance Section
    [Documentation]     Validate Email Routing in Advance Section
        Wait Until Element Is Visible       ${button_email_routing_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_email_routing_locator}
        Wait Until Element Is Enabled    ${text_email_routing_locator}
        Go Back

Validate Autoresponders in Advance Section
    [Documentation]     Validate Autoresponders in Advance Section
        Wait Until Element Is Visible       ${button_autoresponder_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_autoresponder_locator}
        Wait Until Element Is Enabled    ${text_autoresponder_locator}
        Go Back

Validate Mailing List in Advance Section
    [Documentation]     Validate Mailing List in Advance Section
        Wait Until Element Is Visible       ${button_item_mailing_lists_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_item_mailing_lists_locator}
        Wait Until Element Is Enabled    ${text_item_mailing_lists_locator}
        Go Back

Validate Global Email Filters in Advance Section
    [Documentation]     Validate Global Email Filters in Advance Section
        Wait Until Element Is Visible       ${button_global_email_filter_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_global_email_filter_locator}
        Wait Until Element Is Enabled    ${text_global_email_filter_locator}
        Go Back

Validate Email Filters in Advance Section
    [Documentation]     Validate  Email Filters in Advance Section
        Wait Until Element Is Visible       ${button_email_filters_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_email_filters_locator}
        Wait Until Element Is Enabled    ${text_email_filters_locator}
        Go Back

Validate Spam Filter in Advance Section
    [Documentation]     Validate Spam Filter in Advance Section
        Wait Until Element Is Visible       ${button_spam_filters_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_spam_filters_locator}
        Wait Until Element Is Enabled    ${text_spam_filters_locator}
        Go Back

Validate Encryption in Advance Section
    [Documentation]     Validate Encryption in Advance Section
        Wait Until Element Is Visible       ${button_encryption_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_encryption_locator}
        Wait Until Element Is Enabled    ${text_encryption_locator}
        Go Back

Validate Box Trapper in Advance Section
    [Documentation]     Validate Box Trapper in Advance Section
        Wait Until Element Is Visible       ${button_box_trapper_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_box_trapper_locator}
        Wait Until Element Is Enabled    ${text_box_trapper_locator}
        Go Back

Validate Calanders and Contacts in Advance Section
    [Documentation]     Validate Calanders and Contacts in Advance Section
        Wait Until Element Is Visible       ${button_calenders_and_contacts_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_calenders_and_contacts_locator}
        Wait Until Element Is Enabled    ${text_calenders_and_contacts_locator}
        Go Back

Validate Email Disk Usage in Advance Section
    [Documentation]     Validate Email DIsk Usage in Advance Section
        Wait Until Element Is Visible       ${button_email_disk_usage_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_email_disk_usage_locator}
        Wait Until Element Is Enabled    ${text_email_disk_usage_locator}
        Go Back

Validate FIle Manager in Advance Section
    [Documentation]     Validate FIle Manager in Advance Section
        Wait Until Element Is Visible       ${button_filemanager_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_filemanager_locator}
        Switch Window     locator=NEW
        Wait Until Element Is Enabled      ${text_filemanager_locator}
        Switch Window         title=${cpanel_main_page_title}

Validate Images in Advance Section
    [Documentation]     Validate Images in Advance Section
        Wait Until Element Is Visible       ${button_images_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_images_locator}
        Wait Until Element Is Enabled    ${text_images_locator}
        Go Back

Validate Directory Privacy in Advance Section
    [Documentation]     Validate Directory Privacy in Advance Section
        Wait Until Element Is Visible       ${button_directory_privacy_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_directory_privacy_locator}
        Wait Until Element Is Enabled    ${text_directory_privacy_locator}
        Go Back

Validate Disk Usage in Advance Section
    [Documentation]     Validate Disk Usage in Advance Section
        Wait Until Element Is Visible       ${button_disk_usage_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_disk_usage_locator}
        Wait Until Element Is Enabled    ${text_disk_usage_locator}
        Go Back

Validate Web Disk in Advance Section
    [Documentation]     Validate Web Disk in Advance Section
        Wait Until Element Is Visible       ${button_web_disk_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_web_disk_locator}
        Wait Until Element Is Enabled    ${text_web_disk_locator}
        Go Back

Validate Ftp Accounts in Advance Section
    [Documentation]     Validate Ftp Accounts in Advance Section
        Wait Until Element Is Visible       ${button_ftp_accounts_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_ftp_accounts_locator}
        Wait Until Element Is Enabled    ${text_ftp_accounts_locator}
        Go Back

Validate Ftp Connection in Advance Section
    [Documentation]     Validate Ftp Connection in Advance Section
        Wait Until Element Is Visible       ${button_ftp_connection_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_ftp_connection_locator}
        Wait Until Element Is Enabled    ${text_ftp_connection_locator}
        Go Back

Validate Ftp Anonymous in Advance Section
    [Documentation]     Validate Ftp Anonymous in Advance Section
        Wait Until Element Is Visible       ${button_ftp_anonymous_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_ftp_anonymous_locator}
        Wait Until Element Is Enabled    ${text_ftp_anonymous_locator}
        Go Back

Validate Git Versioncontrol in Advance Section
    [Documentation]     Validate Git Versioncontrol in Advance Section
        Wait Until Element Is Visible       ${button_git_versioncontrol_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_git_versioncontrol_locator}
        Wait Until Element Is Enabled    ${text_git_versioncontrol_locator}
        Go Back

Validate MYsql DB Wizard in Advance Section
    [Documentation]     Validate MYsql DB Wizard in Advance Section
        Wait Until Element Is Visible       ${button_my_sql_db_wizard_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_my_sql_db_wizard_locator}
        Wait Until Element Is Enabled    ${text_my_sql_db_wizard_locator}
        Go Back

Validate MySql Db in Advance Section
    [Documentation]     Validate MySql Db in Advance Section
        Wait Until Element Is Visible       ${button_my_sql_db_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_my_sql_db_locator}
        Wait Until Element Is Enabled    ${text_my_sql_db_locator}
        Go Back

Validate Remote MySql in Advance Section
    [Documentation]     Validate Remote MySql in Advance Section
        Wait Until Element Is Visible       ${button_mysql_wizard_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_mysql_wizard_locator}
        Wait Until Element Is Enabled    ${text_mysql_wizard_locator}
        Go Back

Validate Postgre Sql Database in Advance Section
    [Documentation]     Validate Postgre Sql Database in Advance Section
        Wait Until Element Is Visible       ${button_postrage_sql_db_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_postrage_sql_db_locator}
        Wait Until Element Is Enabled    ${text_postrage_sql_db_locator}
        Go Back

Validate Postgre Sql Database Wizard in Advance Section
    [Documentation]     Validate Postgre Sql Database Wizard in Advance Section
        Wait Until Element Is Visible       ${button_pl_sql_db_wizard_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_pl_sql_db_wizard_locator}
        Wait Until Element Is Enabled    ${text_pl_sql_db_wizard_locator}
        Go Back

Validate Visitors in Advance Section
    [Documentation]     Validate Visitors in Advance Section
        Wait Until Element Is Visible       ${button_visitors_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_visitors_locator}
        Wait Until Element Is Enabled    ${text_visitors_locator}
        Go Back

Validate Bandwidth in Advance Section
    [Documentation]     Validate Bandwidth in Advance Section
        Wait Until Element Is Visible       ${button_bandwidth_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_bandwidth_locator}
        Wait Until Element Is Enabled    ${text_bandwidth_locator}
        Go Back

Validate Rawaccess in Advance Section
    [Documentation]     Validate Rawaccess in Advance Section
        Wait Until Element Is Visible       ${button_rawaccess_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_rawaccess_locator}
        Wait Until Element Is Enabled    ${text_rawaccess_locator}
        Go Back

Validate Awstats in Advance Section
    [Documentation]     Validate Awstats in Advance Section
        Wait Until Element Is Visible       ${button_awstats_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_awstats_locator}
        Wait Until Element Is Enabled    ${text_awstats_locator}
        Go Back

Validate Weblizer in Advance Section
    [Documentation]     Validate Weblizer in Advance Section
        Wait Until Element Is Visible       ${button_weblizer_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_weblizer_locator}
        Wait Until Element Is Enabled    ${text_weblizer_locator}
        Go Back

Validate Weblizerftp in Advance Section
    [Documentation]     Validate Weblizerftp in Advance Section
        Wait Until Element Is Visible       ${button_weblizerftp_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_weblizerftp_locator}
        Wait Until Element Is Enabled    ${text_weblizerftp_locator}
        Go Back

Validate Metrics Editor in Advance Section
    [Documentation]     Validate Metrics Editor in Advance Section
        Wait Until Element Is Visible       ${button_metricseditor_locator}     timeout=${EXPLICIT_TIMEOUT}
        Click Element       ${button_metricseditor_locator}
        Wait Until Element Is Enabled    ${text_metricseditor_locator}
        Go Back