get_create_Wallet_For_CC_request_body = {
    "request": {
        "requestInfo": {
            "service": "WalletAPI",
            "method": "createWalletForCC",
            "clientId": "AEM",
            "apiAccessKey": "o7qsuyqmznkscppcdro678vidbr"
        },
        "priority": "accountHolder",
        "makeAsPrimaryPaymentMethod": "false",
        "cardholderName": "Rohit",
        "creditCardNumber": "4111111111111111",
        "lastFourDigits": "1111",
        "expirationMonth": "11",
        "expirationYear": "2092",
        "accountId": 41688528,
        "billingContactType": "accountHolder",
        "paymentMethodType": "CREDITCARD",
        "type": "VISA",
        "postalCode": "32256",
        "city": "JACKSONVILLE",
        "streetAddress": "5335 GATE PKWY",
        "stateprov": "FL",
        "country": "US",
        "paymentLocation": "STOREFRONT",
        "email": "rajat.goyal@newfold.com",
        "currencyCode": "USD",
        "walletId": "",
        "maskedNumber": "",
        "address": {
            "address1": "5335 GATE PKWY",
            "address2": "",
            "city": "JACKSONVILLE",
            "stateProv": "FL",
            "country": "US",
            "postalCode": "32256"
        },
        "id": "c1449f3a-b9e0-4b36-9f43-7b91ed230837",
        "data": "GBfhM6AdJL2a1yobv39azKuI8tyKOH5a6iH2sJaj4PLH3cJFkFqdSELu8y/b/QcBCcwSeM75accIJX+Gw/0r/ouFc9nWJH616O5O0l00Rj/kkOPAmTZDj1xzyKcAj2hoJ6wSbNGk88IFrAKuR0s/9tBB1HRnhvwZpTDU3TVFFtQ=",
        "isSecurePay": "true"
    }
}
get_create_Wallet_For_CC_invalid_request_body = {
    "request": {
        "requestInfo": {
            "service": "WalletAPI",
            "method": "createWalletForCC",
            "clientId": "AEM",
            "apiAccessKey": "o7qsuyqmznkscppcdro678viabc"
        },
        "priority": "primary",
        "makeAsPrimaryPaymentMethod": "false",
        "cardholderName": "Rajat",
        "creditCardNumber": "4111111111111111",
        "lastFourDigits": "1111",
        "expirationMonth": "07",
        "expirationYear": "2025",
        "accountId": 41688528,
        "billingContactType": "primary",
        "paymentMethodType": "CREDITCARD",
        "type": "VISA",
        "postalCode": "32256",
        "city": "JACKSONVILLE",
        "streetAddress": "5335 GATE PKWY",
        "stateprov": "FL",
        "country": "US",
        "paymentLocation": "STOREFRONT",
        "email": "rajat.goyal@newfold.com",
        "currencyCode": "USD",
        "walletId": "",
        "maskedNumber": "",
        "address": {
            "address1": "5335 GATE PKWY",
            "address2": "",
            "city": "JACKSONVILLE",
            "stateProv": "FL",
            "country": "US",
            "postalCode": "32256"
        },
        "id": "c1449f3a-b9e0-4b36-9f43-7b91ed230837",
        "data": "GBfhM6AdJL2a1yobv39azKuI8tyKOH5a6iH2sJaj4PLH3cJFkFqdSELu8y/b/QcBCcwSeM75accIJX+Gw/0r/ouFc9nWJH616O5O0l00Rj/kkOPAmTZDj1xzyKcAj2hoJ6wSbNGk88IFrAKuR0s/9tBB1HRnhvwZpTDU3TVFFtQ=",
        "isSecurePay": "true"
    }
}