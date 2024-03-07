# Locators

# Account Information
txt_create_account_hfe_locator = '//*[text()="Create your account"]'
btn_domain_select_continue_locator = '//a[contains(text(),"Continue")]'
txt_acc_info_firstname_locator = '//label[text()="First Name"]/following::input[1]'
txt_acc_info_lastname_locator = '//label[text()="Last Name"]/following::input[1]'
txt_acc_info_company_locator = '//input[@data-cy="company"]'
txt_acc_info_country_locator = '//select[@id="country_input"]'
txt_acc_info_country_hfe_locator = '//select[@name="country"]'
txt_acc_info_streetadd_locator = '//input[@data-cy="address"]'
txt_acc_info_streetadd_hfe_locator = '//input[@name="address1"]'
txt_acc_info_city_locator = '//input[@id="city"]'
drp_acc_info_stateName_locator = '//select[@id="state_input"]'
drp_acc_info_stateName_hfe_locator = '//select[@name="state"]'
txt_acc_info_pincode_locator = '//input[@id="zip"]'
txt_acc_info_pincode_hfe_locator = '//input[@name="postalCode"]'
txt_acc_info_phoneNo_locator = '//input[@id="phone"]'
txt_acc_info_ph_ext_locator = '//input[@id="phone_ext"]'
lnk_acc_info_select_another_country_locator = '//a[@id="phone_cc_change"]'
txt_acc_info_emailId_locator = '//input[@id="email"]'
txt_hostingplan_and_addons_locator = '//h1[contains(text(),"Hosting Plan & Add-ons")]'

# Payment Information
lnk_more_payment_option_locator = '//a[text()="more payment options"]'
optn_acc_info_paymeth_locator = '//input[@id="paymethod_bd"]'
chkbx_acc_info_test_bd_locator = '//input[@id="bd_test"]'
chkbx_check_payment_method_locator = '//input[@id="paymethod_check"]'
txt_check_no_locator = '//input[@id="check_number"]'

txt_payu_credit_payment_option_locator = '(//span[@class="card-num"])[1]'
txt_payu_creditcardno_locator = '//*[@id="cardNumber"]'
txt_expiry_date_locator = '//*[@id="cardExpiry"]'
txt_payu_credit_cvv_locator = '//*[@id="cardCvv"]'
txt_payu_credit_nameoncard_locator = '//*[@id="cardOwnerName"]'
btn_payu_credit_paynow_locator = '//span[contains(text(),"PROCEED")]'
txt_payu_otp_locator = '//input[@id="password"]'
btn_payu_otp_pay_locator = '//input[@id="submitBtn"]'
btn_skip_save_card_details_locator = '//*[text()="Continue without saving"]'

# Terms to Agree
chkbx_acc_info_term_cond_locator = '//input[@id="tos_agree"]'
btn_acc_info_submit_locator = '//button[@type="submit"]'

# Signup Success Page
lbl_signup_purchase_success_locator = '//h1[text()="Your purchase was a success!"]'
lbl_signup_purchase_success_hfe_locator = '//h1[contains(text(),"Success! Next, let’s create your account.")]'
btn_signup_create_account_locator = '//a[text()="Create your Password"]'
btn_signup_create_account_hfe_locator = '//div[@class="control-panel-button-wrapper"]'
lnk_signup_cpanelmanager_locator = '//a[text()="cPanel Manager"]'
lbl_signup_tax_invoice_locator = '//*[text()="Electronically Supplied Services - TAX INVOICE"]'

# Internal Billing Section
select_selfdestruct_locator = '//select[@id="test_self_destruct"]'
select_auto_form_fill_locator = '//select[@class="auto_fill_drop"]'

# BH.in FOS page
link_hosting_locator = '//a[@href="/hosting"]'
lbl_shared_hosting_locator = '//a[contains(text(),"Shared Hosting")]'
btn_get_started_locator = '//button[contains(text(),"Get Started")]'
btn_shared_hosting_basic_plan_locator = '//*[text()= "Select"][1]'
btn_shared_hosting_plus_plan_locator = '(//*[text()= "Select"])[2]'
btn_shared_hosting_choice_plus_plan_locator = '(//*[text()= "Select"])[3]'
btn_shared_hosting_pro_plan_locator = '(//*[text()= "Select"])[4]'
btn_accept_cookies_locator = '//button[@id="onetrust-accept-btn-handler"]'
btn_start_your_store_locator = '//button[contains(text(),"Start Your Store")]'


# roster login
bh_ad_username_locator = '//input[@name="admin_user"]'
bh_ad_pwd_locator = '//input[@name="admin_pass"]'
bh_submit_locator = '//input[@type="submit"]'

# Domain selection page
next_locator = '//*[@value="Next"])[1]'
link_domainless_locator = '//input[@id="domainless_signup_link"]'
link_domainless_hfe_locator = '//a[@class="choose-later-link"]'
txt_existing_domain_locator = '//input[@data-cy="domain-u-own"]'
txt_existing_domain_hfe_locator = '//input[@name="existingDomain"]'
btn_existing_domain_next_locator = '(//*[@value="Next"])[2]'
btn_existing_domain_next_hfe_locator = '(//button[@type="submit"])[2]'
txt_new_domain_locator = '//input[@data-cy="domain-u-create"]'
txt_new_domain_hfe_locator = '//input[@name="newDomain"]'
btn_new_domain_next_locator = '(//*[@value="Next"])[1]'
btn_new_domain_next_hfe_locator = '(//button[@type="submit"])[1]'

# Update Password
txt_chgpass_domainname_locator = '//input[@id="domain"]'
txt_chgpass_create_pass_locator = '//input[@id="pw1"]'
txt_chgpass_retry_pass_locator = '//input[@id="pw2"]'
btn_chgpass_createacc_locator = '//button[@id="submit-button"]'
chkbx_chgpass_terms_locator = '//input[@id="tos-agreement-main"]'
lbl_chgpass_success_locator = '//*[text()="Your account is ready to go. Now you can log in!"]'
btn_chgpass_success_gotologin_locator = '//a[text()="Go to Login"]'
btn_create_your_website_locator = '//button[text()="Create your website"]'
btn_card_selection = '//div[@data-testid="card"][1]'

# onboarding skip page
lnk_skipthisstep_locator = '//button[text()="Skip this step"]'

# Bluerock Panel
lnk_bhlogin_hometab_locator = '//div[contains(text(),"Home")]'
lnk_bhlogin_mysites_locator = '//div[contains(text(),"My Sites")]'

# wp pro
drpdown_wordpress_header_locator = '(//a[@href="/wordpress"])[1]'
btn_wppro_choose_plan_locator = '//button[contains(text(),"Get Started")]'
btn_wordpress_build_plan_locator = '//button[@href="/web-hosting/signup?cpanel_plan=wppro_build"]'
btn_wordpress_grow_plan_locator = '//button[@href="/web-hosting/signup?cpanel_plan=wppro_grow"]'
btn_wordpress_scale_plan_locator = '//button[@href="/web-hosting/signup?cpanel_plan=wppro_scale"]'
lnk_wordpress_wp_pro_header_locator = '(//a[@href="/wordpress/managed-hosting"])[1]'

#Woocommerce
lbl_woocommerce_choose_plan_locator = '//a[normalize-space()="WooCommerce"]'
btn_woocommerce_single_store_plan_locator = '(//button[text()= "Select"])[1]'
btn_woocommerce_multiple_store_plan_locator = '(//button[text()= "Select"])[2]'

# onboarding skip page for WooCommerce
btn_nextstep_locator = '//button[text()="Next"]'
btn_finishstep_locator = '//button[text()="Finish"]'

# wordpress dashboard
lnk_welcometab_locator = '//a[contains(text(),"Welcome")]'
txt_wordpress_locator = '//h1[text()="Loading WordPress..."]'

# freetrial
txt_free_hosting_locator = '//span[@class="ttitle"]'

# Success Page Office Address
office_address1_success_locator = '//section[@class="footer"]//p[text()="NESCO IT Park, Western Express Highway"]'
office_address2_success_locator = '//section[@class="footer"]//p[text()="Unit No. 401, 4th Floor"]'
office_address3_success_locator = '//section[@class="footer"]//p[text()="Goregaon (East)"]'
office_address4_success_locator = '//section[@class="footer"]//p[text()="Mumbai - 400063"]'
office_address5_success_locator = '//section[@class="footer"]//p[text()="Maharashtra, India"]'
