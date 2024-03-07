import sys
import os

dir_path = os.path.dirname(os.path.realpath(__file__))
framework_path = os.path.split(dir_path)[0]
framework_path = os.path.split(framework_path)[0]
print(framework_path)
sys.path.append(framework_path)

from robot.api.deco import keyword
import time
import string
import jwt
import random
import datetime
import json
import re
from lxml import etree
import xml.dom.minidom
import xml.etree.ElementTree as ET
from random import randint
import math
import subprocess
from subprocess import call
import ast
from robot.libraries.BuiltIn import BuiltIn
import pyotp,base64
from decimal import Decimal
from datetime import timedelta

class custom_library():

    @keyword
    def split_email_to_username(self,email):
        email_user = email.split("@")
        return email_user[0]

    def random_generator(self,size=15, chars=string.ascii_lowercase + string.digits):
        return ''.join(random.choice(chars) for x in range(size))

    @keyword
    def if_condition_to_validate_magickey_magiclink(self,magickey,magickey_status,magiclink,magiclink_status,actual_magickey,actual_keystatus,actual_magiclink,actual_linkstatus):
        if magickey == '' and magiclink == '':
            re.match(magickey,'')
            re.match(magickey_status, '')
            re.match(magiclink, '')
            re.match(magiclink_status, '')
            print("Validation Condition : MagicKey = null and MagicLink = null")
        elif magickey != '' and magiclink == '':
            re.match(magickey, actual_magickey)
            re.match(magickey_status, actual_keystatus)
            re.match(magiclink, '')
            re.match(magiclink_status, '')
            print("Validation Condition : MagicKey = Exists and MagicLink = null")
        elif magickey == '' and magiclink != '':
            re.match(magickey, '')
            re.match(magickey_status, '')
            re.match(magiclink, actual_magiclink)
            re.match(magiclink_status, actual_linkstatus)
            print("Validation Condition : MagicKey = null and MagicLink = Exists")
        else:
            re.match(magickey, actual_magickey)
            re.match(magickey_status, actual_keystatus)
            re.match(magiclink, actual_magiclink)
            re.match(magiclink_status, actual_linkstatus)
            print("Validation Condition : MagicKey = Exists and MagicLink = Exists")

    @keyword
    def generate_association_status_payload_with_eventtype(self,payload):
        double_quotes = json.dumps(payload)
        payload = double_quotes.replace('"',r'\"')
        message = '{"Message": "'+payload+'"}'
        return message

    @keyword
    def generate_exp_date_domain_renew_for_year(self,year):
        base = datetime.datetime.today()
        timestamp = time.mktime(datetime.datetime.strptime(year, "%d/%m/%Y").timetuple())
        return timestamp

    @keyword
    def get_current_date_for_notes(self):
        x = datetime.datetime.now()
        notes_date = (x.strftime("%b") + ' ' + x.strftime("%d,").lstrip("0") + ' ' + x.strftime("%Y"))
        return notes_date

    @keyword
    def get_current_date_for_invoice(self):
        x = datetime.datetime.now()
        invoice_date = (x.strftime("%B") + ' ' + x.strftime("%d,").lstrip("0") + ' ' + x.strftime("%Y"))
        return invoice_date

    @keyword
    def get_current_date_for_invoice_history(self):
        x = datetime.datetime.now()
        invoice_date = (x.strftime("%d").lstrip("0") + 'th ' + x.strftime("%b,") + ' ' + x.strftime("%Y"))
        return invoice_date

    @keyword
    def get_invoice_due_date(self,no_of_days):
        days_due = [int(s) for s in no_of_days.split() if s.isdigit()]
        due_date = datetime.datetime.now() + timedelta(days=days_due[0])
        invoice_due_date = (due_date.strftime("%B") + ' ' + due_date.strftime("%d,").lstrip("0") + ' ' + due_date.strftime("%Y"))
        return invoice_due_date

    @keyword
    def calculate_tax_on_amount_entered(self,tax,amount):
        calculated_tax_value = format(round((Decimal(tax)/100) * Decimal(amount), 2), '.2f')
        return calculated_tax_value

    @keyword
    def calculate_total_amount_after_tax_addition(self,tax_value,subtotal):
        calculated_total_amount = format(round((Decimal(subtotal) + Decimal(tax_value)), 2), '.2f')
        return calculated_total_amount

    @keyword
    def calculate_subtotal_value(self, item_values,discount):
        calculated_subtotal = 0
        for item_val in range(0, len(item_values)-1):
            calculated_subtotal = format(round(Decimal(calculated_subtotal) + Decimal(item_values[item_val]), 2), '.2f')
        if(discount == 'skip'):
            return calculated_subtotal
        else:
            discounted_value = format(round(Decimal(calculated_subtotal) * Decimal(float(discount)/100), 2), '.2f')
            return discounted_value

    @keyword
    def calculate_tax_for_items(self,amount_values,tax_values,discount):
        total_tax = 0
        for amount_val in range(0, len(amount_values)):
            tax_value = format(
                round(Decimal(float(amount_values[amount_val]) * float(tax_values[amount_val]) / 100), 2), '.2f')
            if (discount == 'skip'):
                total_tax = format(round(Decimal(total_tax) + Decimal(tax_value), 2), '.2f')
            else:
                discounted_tax_value = round(Decimal(tax_value) - (Decimal(tax_value) * Decimal(float(discount) / 100)), 2)
                total_tax = format(round(Decimal(total_tax) + Decimal(discounted_tax_value), 2), '.2f')
        return total_tax

    @keyword
    def calculate_total_due_dynamically(self, amount, tax_perc, discount, rand_discounttype):
        total_tax = 0
        if (rand_discounttype == 1):
            discount = round(Decimal(discount / amount * 100), 2)
        tax_value = format(round(Decimal(float(amount) * float(tax_perc) / 100), 2), '.2f')
        discounted_tax_value = round(Decimal(tax_value) - (Decimal(tax_value) * Decimal(float(discount) / 100)), 2)
        total_tax = format(round(Decimal(total_tax) + Decimal(discounted_tax_value), 2), '.2f')
        return total_tax

    @keyword
    def calculate_total_amount(self,subtotal,discount_value,total_taxes):
        calculated_total_amount = format(round((Decimal(subtotal) - Decimal(discount_value)) + Decimal(total_taxes), 2), '.2f')
        return calculated_total_amount

    @keyword
    def get_partial_amount_for_invoice(self,amount_due):
        partial_amount = format(round(Decimal(amount_due)/2, 2), '.2f')
        return partial_amount

    @keyword
    def generate_dynamic_partial_amount_for_invoice(self,amount_due):
        percentage = random.randint(1, 99)
        partial_amount = format(Decimal(float(amount_due)) * Decimal(float(percentage) / 100), '.2f')
        return  partial_amount

    @keyword
    def return_numeric_value_from_string(self,str):
        escape_chars = [';', ':', '!', "*", "(", ")"]
        for i in escape_chars:
            str = str.replace(i, '')
        num_value = re.findall(r"[-+]?\d*\.\d+|\d+", str)
        return float(num_value[0])

    # generate random code
    @keyword
    def generate_random_code(self):
        random = self.random_generator()
        return random

    @keyword
    def should_be_of_same_type(self,var1,var2):
        assert type(var1) == type(var2)

    @keyword
    def decode_access_token_for_webproid(self,en_token):
        decoded = jwt.decode(en_token, options={"verify_signature": False})
        print(decoded)
        return decoded

    @keyword
    def should_not_be_greater_than(self,num1,num2):
        print(int(num1))
        print(int(num2))
        if(int(num1) > int(num2)):
            return False
        return True

    @keyword
    def get_datatype_of(self,var1):
        return type(var1).__name__

    @keyword
    def encode_base64(self,str1):
        encodedBytes = base64.b64encode(str1.encode("utf-8"))
        encodedStr = str(encodedBytes, "utf-8")
        return encodedStr

    @keyword
    def generate_random_website_name(self):
        timestamp = int(round(time.time()))
        random = self.random_generator()
        env = BuiltIn().get_variable_value("${ENV}")
        env = env.replace('_', '')
        test_website = 'test-website-' + env + '-' + random + str(timestamp) + ".com"
        return test_website

    @keyword
    def generate_random_collection_name(self):
        timestamp = int(round(time.time()))
        random = self.random_generator()
        env = BuiltIn().get_variable_value("${ENV}")
        env = env.replace('_', '')
        test_collection = 'Test-PluginsCollection-' + env + '-' + random + str(timestamp)
        return test_collection

    @keyword
    def generate_random_username(self):
        timestamp = int(round(time.time()))
        test_username = 'testcustomer'+str(timestamp)+self.random_generator()+"@endurance.com"
        return test_username

    @keyword
    def generate_random_business_name(self):
        timestamp = int(round(time.time()))
        test_businessname = 'The Alphabet Inc. ' + str(timestamp)
        return test_businessname

    @keyword
    def generate_transaction_key(self):
        timestamp = int(round(time.time()))
        transaction_key = 'testing123-rest-api-'+str(timestamp)+self.random_generator()
        return transaction_key

    @keyword
    def generate_random_keyword(self):
        timestamp = int(round(time.time()))
        transaction_key = 'keyword'+str(timestamp)
        return transaction_key

    @keyword
    def validate_integer(self,num):
        try:
            val = int(num)
        except ValueError:
            print("That's not an int!")

    @keyword
    def get_list_of_tld_params(self , tlds):
        tld_list = tlds.split(",")

        tld_search= "tlds="
        for i in range(0,len(tld_list)):
             tld_search = tld_search + tld_list[i]
             i = i + 1
             if (i < len(tld_list)):
                 tld_search = tld_search + "&tlds="

        return tld_search


    @keyword
    def get_list(self,param):
        param_list = param.split(",")
        return param_list

    @keyword
    def exists_in_list(self,key,list):
        if key in list:
             return True
        return False

    @keyword
    def form_params(self,fields,values):
         params=""
         fields_list = []
         values_list = []

         if(fields != ""):
            fields_list = fields.split(",")

         if(values != ""):
            values_list = values.split(",")

         print("Fields : {}".format(fields_list))
         print("Values : {}".format(values_list))

         for i in range(0,len(fields_list)):
             params = params + fields_list[i]+"="+values_list[i]
             i = i + 1
             if (i < len(fields_list)):
                 params = params + "&"

         return params

    def generate_filename_from_api_endpoint(self,api_endpoint):
        test_file = re.sub("[{|}]", "", api_endpoint)
        test_file = re.sub("[/|-]", "_", api_endpoint)
        test_file = test_file.split(".")
        parts = test_file[0].split("_")
        test_file = test_file[0].replace("_" + parts[1] + "_", "")
        return test_file

    @keyword
    def get_api_endpoint_generated_from_replacing_path_variables(self,api_endpoint):
        var = BuiltIn().get_variables()
        test_file = self.generate_filename_from_api_endpoint(api_endpoint)

        path_values_variable = '${' + test_file + '_dependent_params_path_values}'
        path_keys_variable = '${' + test_file + '_dependent_params_path_keys}'

        if path_values_variable in iter(list(var.keys())):
            path_values = var[path_values_variable]
        if path_keys_variable in iter(list(var.keys())):
            path_keys = var[path_keys_variable]

        path_keys_list = path_keys.split(",")
        path_values_list = path_values.split(",")

        for index, key in enumerate(path_keys_list):
            key = key.replace("'", "")
            val = path_values_list[index].replace("'", "")
            api_endpoint = api_endpoint.replace(key, val)

        api_endpoint = re.sub("[{|}]", "", api_endpoint)
        api_endpoint = api_endpoint.replace("'", "")
        return api_endpoint

    @keyword
    def get_body_generated_from_replacing_dependent_variables(self):
        var = BuiltIn().get_variables()

        body_key = var['${SUITE_SOURCE}'].rpartition('/')[2].replace(".robot","") + "_request_body"
        body_key = "&{"+body_key+"}"
        suite_source = var['${SUITE_SOURCE}']
        suite = suite_source.replace('testsuite', 'variables')
        variables_filename = suite.replace('.robot', '.py')
        variables_file_lines = open(variables_filename,'r')
        for variables_file_line in variables_file_lines:
            if ("body_replace_var" in variables_file_line):
                body_replace_var = variables_file_line.split("=")[1].replace("\"","")
                body_replace_var = ast.literal_eval(body_replace_var)
                print("body_replace_var : ",body_replace_var)
                body_json_str = str(var[body_key])
                for replace_set in body_replace_var:
                    replace_var_format = "<"+str(replace_set[0])+">"
                    replace_var_value = replace_set[1]
                    print("REPLACE : ",replace_var_format, "   WITH : ",replace_var_value)
                    if replace_var_format in body_json_str :
                        body_json_str = body_json_str.replace(replace_var_format,str(replace_var_value))
        print(" ==== Updated body ==== ",body_json_str)
        return ast.literal_eval(body_json_str)

    @keyword
    def get_header_generated_from_replacing_dependent_variables(self):
        var = BuiltIn().get_variables()
        header_key = var['${SUITE_SOURCE}'].rpartition('/')[2].replace(".robot","") + "_request_headers"
        header_key = "&{"+header_key+"}"
        print("[header_generated_from_replacing_dependent_variables] VAR : ",var)
        suite_source = var['${SUITE_SOURCE}']
        suite = suite_source.replace('testsuite', 'variables')
        variables_filename = suite.replace('.robot', '.py')
        variables_file_lines = open(variables_filename,'r').readlines()
        for variables_file_line in variables_file_lines:
            if ("header_replace_var" in variables_file_line):
                header_replace_var = variables_file_line.split("=")[1].replace("\"","")
                header_replace_var = ast.literal_eval(header_replace_var)
                print("header_replace_var : ",header_replace_var)
                header_json_str = str(var[header_key])
                for replace_set in header_replace_var:
                    replace_var_format = "<"+str(replace_set[0])+">"
                    replace_var_value = replace_set[1]
                    print("REPLACE : ",replace_var_format, "   WITH : ",replace_var_value)
                    if replace_var_format in header_json_str :
                        header_json_str = header_json_str.replace(replace_var_format,str(replace_var_value))
        print(" ==== Updated header ==== ",header_json_str)
        return ast.literal_eval(header_json_str)

    @keyword
    def convert_to_headers(self, data):
        for key in list(data.keys()):
            value = str(data[key])
            value = value.replace("'", "\"")
            value = value.replace("'null'", "null")
            print(value)
            print(str(data[key]))
            data[key] = value
        return data

    @keyword
    def json_response_keys(self,dictionary):
        keys = []
        for key, value in list(dictionary.items()):
            if type(value) is dict:
                 keys.append(key)
                 keys += self.json_response_keys(value)
            else:
                print(key)
                keys.append(key)
        return keys

    @keyword
    def get_json_response_keys(self,dictionary):
        keys = self.json_response_keys(dictionary)
        return keys

    @keyword
    def validate_json_key_value_pairs_of_a_json_type(self,json_obtained,json_type):
        keys_obtained = next(iter(json_obtained))

        keys_actual = next(iter(json_type))
        if(re.compile(keys_actual)):
            self.validate_regex(keys_actual, str(keys_obtained))
        print(keys_actual)
        print(keys_obtained)
        print(json_type[keys_actual])
        #assert type(json_type[keys_actual]) == type(json_obtained[keys_obtained])
        if type(json_type[keys_actual]) is dict :
            for key,value in list(json_type[keys_actual].items()):
                print(key)
                print(value)
                if key in list(json_obtained[keys_obtained].keys()):
                    value_obtained = json_obtained[keys_obtained][key]
                    print(type(value))
                    print(type(value_obtained))
                    #assert type(value) == type(value_obtained)
                    if type(value) is dict:
                        assert type(value_obtained) == dict
                    elif type(value) is list:
                        print("its list")
                        assert type(value_obtained) == list
                    else:
                        if(re.compile(value)):
                            self.validate_regex(value, str(value_obtained))


    @keyword
    def validate_json_responses_to_be_list_of_type(self,json_obtained,json_type):
        #print json_obtained
        for key, value in list(json_obtained.items()):
           # print value
            self.validate_json_key_value_pairs(value,json_type)


    @keyword
    def validate_json_values(self,value_obtained,value_actual):
        if(type(value_obtained) is dict):
            print(type(value_actual))
            #assert type(value_actual) == dict
            self.validate_json_key_value_pairs(value_obtained,value_actual)

        else:
            if(re.compile(value_actual)):
                   self.validate_regex(value_actual, str(value_obtained))


    @keyword
    def get_nested_dict_from_dict(self,mydictionary,key):
        print("Inside get_nested_dict_from_dict ")
        print("Dict  : ",mydictionary)
        print("Value : ",mydictionary[key])
        return ast.literal_eval(mydictionary[key])

    @keyword
    def validate_json_key_value_pairs(self,json_obtained,json_actual):

        #dictionary_obtained = self.get_all_json_key_value_pairs(json_obtained)
        dictionary_obtained = json_obtained
        print("Expected response : ",json_actual)
        print("Actual response : ",dictionary_obtained)
        print("**********************************************")

        print("type of expected response : ",type(json_actual))
        print("type of actual response : ",type(dictionary_obtained))

        ### Added support for checking if response is a list of dict
        if isinstance(json_actual, list) and isinstance(dictionary_obtained, list) :
            json_actual_size = len(json_actual)
            for json_common_index in range(0,json_actual_size):
                json_act = json_actual[json_common_index]
                dict_obt = dictionary_obtained[json_common_index]
                self.validate_json_key_value_pairs(dict_obt,json_act)

        else:
            for key, value in list(json_actual.items()):
                #print key, " :: ",json_actual[key]," == ",dictionary_obtained[key]
                #print "Value : ",value," :: After converting : ",ast.literal_eval(value)
                if type(value) is dict:
                    self.validate_json_key_value_pairs(dictionary_obtained[key], value)
                elif type(value) is list:
                    self.validate_lists(value, dictionary_obtained[key])
                else:
                    print("checkingKey {} : {}".format(key, dictionary_obtained[key]))
                    if str(json_actual[key]) == str(dictionary_obtained[key]) :
                        print("raw string matched")
                    elif (re.compile(str(json_actual[key]))):
                        print("checking {} : {}".format(key, dictionary_obtained[key]))
                        self.validate_regex(str(json_actual[key]), str(dictionary_obtained[key]))

    def validate_lists(self,list_actual,list_obtained):

        print("Length of list_actual = '{}'".format(len(list_actual)))
        print("Length of list_obtained = '{}'".format(len(list_obtained)))

        if len(list_actual) == len(list_obtained):
            if len(list_obtained) == 1:
                print("Comparing List as it is.")
                if type(list_actual[0]) is dict:
                    print("Validating Item as Dictionary")
                    self.validate_json_key_value_pairs(list_obtained[0], list_actual[0])
                # elif cmp(list_actual[0], list_obtained[0]) != 0:
                elif ((list_actual[0]>list_obtained[0])-(list_actual[0]<list_obtained[0])) != 0:
                    if re.compile(list_actual[0]):
                        print("list_actual[{}] = '{}'".format(0,list_actual[0]))
                        self.validate_regex(list_actual[0], str(list_obtained[0]))
            else:
                for i in range(len(list_actual)):
                    if type(list_actual[i]) is dict:
                        print("Validating Item as Dictionary")
                        self.validate_json_key_value_pairs(list_obtained[i], list_actual[i])
                    # elif cmp(list_actual, list_obtained) != 0:
                    elif ((list_actual[0]>list_obtained[0])-(list_actual[0]<list_obtained[0])) != 0:
                        for i in range(len(list_obtained)):
                            if re.compile(list_actual[i]):
                                print("list_actual[{}] = '{}'".format(i,list_actual[i]))
                                self.validate_regex(list_actual[i], str(list_obtained[i]))
        elif len(list_actual) ==1:
            for item in list_obtained:
                print("Key = '{}'".format(item))
                if type(item) is dict:
                    print("Validating Item as Dictionary")
                    self.validate_json_key_value_pairs(item,list_actual[0])
                # elif cmp(list_actual, list_obtained) != 0:
                elif ((list_actual[0]>list_obtained[0])-(list_actual[0]<list_obtained[0])) != 0:
                    for i in range(len(list_obtained)):
                        if re.compile(list_actual[0]):
                            print("list_actual[0] = '{}'".format(list_actual[0]))
                            self.validate_regex(list_actual[0], str(item))

    @keyword
    def validate_dictionaries_key_values_according_to_regex(self,dic_actual,dic_obtained):
        for (k, v), (k2, v2) in zip(list(dic_actual.items()), list(dic_obtained.items())):
            print("dic_actual['{}'] = '{}'".format(k, v))
            print("dic_obtained['{}'] = '{}'".format(k2, v2))
            self.validate_regex(k,k2)
            self.validate_regex(v,v2)


    @keyword
    def validate_xml_key_value_pairs(self,xml_obtained,xml_actual):
        xmldoc = xml.dom.minidom.parseString(xml_actual)
        self.parse_xml(xmldoc,xml_obtained,"")

    def parse_xml_text (self,xml_actual,xml_obtained ,xpath):

        if(xml_actual.hasChildNodes()):
            xpath_beging = xpath
            for item in xml_actual.childNodes:
                if(item.nodeName != '#text'):
                    xpath = xpath_beging + "/" + item.tagName

                    if(len(item.childNodes) != 0):
                        self.parse_xml(item,xml_obtained,xpath)

                elif "\n" not in str(item.nodeValue):
                    self.validate_text(xml_obtained,xpath,item.nodeValue)
                    self.parse_xml(item,xml_obtained,"")


    def remove_all(self,substr, str):
        index = 0
        length = len(substr)
        while str.find(substr) != -1:
            index = str.find(substr)
            str = str[0:index] + str[index+length:]
        return str

    def validate_text(self,xml_obtained,xpath,text):

        root =ET.ElementTree(ET.fromstring(xml_obtained))
        #print root.tag

        xpath = self.remove_all(root.getroot().tag,xpath)
        print(xpath)

        texts = []
        for ele in root.findall("."+xpath):
            texts.append(ele.text)

        print(texts)


    def validate_regex(self,regex,value):
        pattern = re.compile(regex, re.MULTILINE)
        res = bool(pattern.match(str(value)))
        print("Regex Pattern Matched : '{}'".format(res))
        assert res == True


    def get_variables_to_be_modified(self,suite):
        print("Variables file : {}".format(suite))
        list = os.path.split(suite)
        print("Do Category Exist = {}".format(os.path.exists(suite)))

        print("Variables to be modified :")

        dependent_params_values_variable = list[1].replace(".py", "") + "_dependent_params_values"
        print(dependent_params_values_variable)

        dependent_params_keys_variable = list[1].replace(".py", "") + "_dependent_params_keys"
        print(dependent_params_keys_variable)

        dependent_params_values_path_variable = list[1].replace(".py", "") + "_dependent_params_values_path"
        print(dependent_params_values_path_variable)

        dependent_params_keys_path_variable = list[1].replace(".py", "") + "_dependent_params_keys_path"
        print(dependent_params_keys_path_variable)

        request_body_variable = list[1].replace(".py", "") + "_request_body"
        print(request_body_variable)

        request_header_variable = list[1].replace(".py", "") + "_request_headers"
        print(request_header_variable)

        variables = [dependent_params_keys_path_variable,dependent_params_keys_variable,dependent_params_values_variable,dependent_params_values_path_variable,request_body_variable,request_header_variable]

        return variables


    @keyword
    def random_with_N_digits(self, n):
        n = int(n)
        print(n)
        range_start = (math.pow(10,n-1))
        range_end = int(math.pow(10,n )-1)
        print(range_end)
        print(range_start)
        return randint(range_start, range_end)

    @keyword
    def convert_to_headers(self, data):
        for key in list(data.keys()):
            value = str(data[key])
            value = value.replace("'", "\"")
            value = value.replace("'null'", "null")
            print(value)
            print(str(data[key]))
            data[key] = value
        return data

    @keyword
    def generate_new_random_password(self):
        LETTERS_LOWERCASE = random.sample(string.ascii_lowercase, k=5)
        LETTERS_UPPERCASE = random.sample(string.ascii_uppercase, k=5)
        NUMBERS = random.sample(string.digits, k=3)
        characters = ['!', '@', '#', '$', '&', '%']
        PUNCTUATION = random.sample(characters, k=2)
        printable = LETTERS_LOWERCASE + LETTERS_UPPERCASE + NUMBERS + PUNCTUATION
        random.shuffle(printable)
        random_password = ''.join(printable)
        return random_password

    @keyword
    def generate_dependent_params(self):
        print("Builtin.get_variables = {}".format(BuiltIn().get_variables()))
        params_keys=''
        params_values=''
        if("${SUITE_SOURCE}" in BuiltIn().get_variables()):
            suite_source = BuiltIn().get_variables()['${SUITE_SOURCE}']
            suite = suite_source.replace('testsuite', 'variables')
            suite = suite.replace('.robot', '.py')
            variables_to_be_modified = self.get_variables_to_be_modified(suite)

            if("${"+variables_to_be_modified[1]+"}" in BuiltIn().get_variables()):
                params_keys = BuiltIn().get_variables()["${"+variables_to_be_modified[1]+"}"]
            if("${"+variables_to_be_modified[2]+"}" in BuiltIn().get_variables()):
                params_values = BuiltIn().get_variables()["${"+variables_to_be_modified[2]+"}"]
            print("Param Keys : {}".format(params_keys))
            print("Param Values : {}".format(params_values))
            return self.form_params(params_keys.strip("'"),params_values.strip("'"))
        else:
            print("Suite source not found")


    @keyword
    def inject_test_dependency(self,env,suite_source,dependent_apis,dependent_params):

        clear_dependent_params(suite_source)
        print("Dependent Params = {}".format(dependent_params))
        print("Dependent Apis = {}".format(dependent_apis))
        print("Suite Source : {}".format(suite_source))
        dir_path = os.path.dirname(os.path.realpath(__file__))
        framework_path = os.path.split(dir_path)[0]
        framework_path = os.path.split(framework_path)[0]

        print("type(dependent_apis) : ", type(dependent_apis))
        print("\n==== Starting 'for' loop for every dependent API ====")
        for index , api in enumerate(dependent_apis):
            api = ast.literal_eval(api)
            print("Dependent API {} = {}".format(index,api))

            category = next(iter(api))
            print("Category : ",category)

            api_endpoint = api[category]
            print("api_endpoint : ",api_endpoint)

            dependent_param = dependent_params[index]
            print("dependent_param : ",dependent_param)

            dependent_param = ast.literal_eval(dependent_param)

            source_req_keys=""
            #dest_param_keys=""
            print("Dependent Param = {}".format(dependent_param))
            print("Type of dependent param = {}".format(type(dependent_param)))

            for key, value_params in list(dependent_param.items()):
                print("value_params : ",value_params)
                if (value_params == ""):
                    print("value is empty")
                    value_params = "*"
                if (type(value_params) == "str"):
                    source_req_keys = source_req_keys + value_params + ","
                if (type(value_params) == "dict"):
                    value = next(iter(list(value_params.values())))
                    replace_var = next(iter(list(value_params.keys())))
                    value_params = value + "-" + key + "-"+replace_var+","

                source_req_keys = source_req_keys + value_params + ","

            source_req_keys = source_req_keys.rstrip(",")

            print("Source Req Keys = {}".format(source_req_keys))
            #print dest_param_keys
            test_file = self.generate_filename_from_api_endpoint(api_endpoint)

            #test_file_path = framework_path+"/tests/testsuite/"+category + "/" + test_file+".robot"
            test_file_path = os.path.join(framework_path,"tests", "testsuite", category, test_file + ".robot")
            print("Path of TestSuite File = {}".format(test_file_path))


            # i should send variable file name of the api , dic of derived_params as argument to listener
            a = call(['python', '-m', 'robot', '-o ' + test_file, '--listener',
                      os.path.join(framework_path, "listener",
                                   "ApiDependencyUtil.py") + ':' + source_req_keys + ":" + str(
                              suite_source),
                      '--variable', 'ENV:' + env, test_file_path])
            print("\nRunning the dependent test {}".format(a))
            print("Values have been taken from the Dependent Test {}".format(api))

        print("Completed collecting all dependent values")

        suite = suite_source.replace('testsuite', 'variables')
        suite = suite.replace('.robot', '.py')
        variables_to_be_modified = self.get_variables_to_be_modified(suite)

        print("\n================ FILE CONTENTS ============ ")

        with open(suite, 'r') as f:
            d = dict(line.strip().split('=') for line in f)

        for key,val in list(d.items()):
            print("checking line : {}={}".format(key,val))
            if(key in variables_to_be_modified):
                print("Value to be set in builtin {}: {}".format(key,val))
                BuiltIn().set_test_variable("${" + key.strip() + "}", val)

        print("API Dependency Inject Completed.")
