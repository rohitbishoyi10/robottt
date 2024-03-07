get_update_Wallet_For_CC_request_body = {
    "request": {
        "requestInfo": {
            "service": "WalletAPI",
            "method": "updateWalletForCC",
            "clientId": "AEM",
            "apiAccessKey": "o7qsuyqmznkscppcdro678vidbr"
        },
        "priority": "null",
        "makeAsPrimaryPaymentMethod": "false",
        "cardholderName": "test",
        "cVV2": "123",
        "lastFourDigits": "1111",
        "expirationMonth": "05",
        "expirationYear": "2079",
        "accountId": 41688528,
        "billingContactType": "accountHolder",
        "paymentMethodType": "CREDITCARD",
        "type": "VISA",
        "postalCode": "33256",
        "city": "Jacksonville",
        "streetAddress": "5335 Gate Pakwy",
        "stateprov": "FL",
        "country": "US",
        "paymentLocation": "STOREFRONT",
        "email": "rajat.goyal@newfold.com",
        "currencyCode": "USD",
        "walletId": "",
        "maskedNumber": "xxxxxxxxxxxx1111",
        "address": {
            "address1": "5335 Gate Pakwy",
            "address2": "",
            "city": "Jacksonville",
            "stateProv": "FL",
            "country": "US",
            "postalCode": "33256"
        },
        "isSecurePay": "false"
    }
}
update_Wallet_For_CC_invalid_request_body = {
    "request": {
        "requestInfo": {
            "service": "WalletAPI",
            "method": "updateWalletForCC",
            "clientId": "AEM",
            "apiAccessKey": "o7qsuyqmznkscppcdro678vidbr"
        },
        "priority": "PRIMARY",
        "makeAsPrimaryPaymentMethod": "false",
        "cardholderName": "test",
        "cVV2": "123",
        "lastFourDigits": "1111",
        "expirationMonth": "12",
        "expirationYear": "2025",
        "accountId": 41688528,
        "billingContactType": "accountHolder",
        "paymentMethodType": "CREDITCARD",
        "type": "VISA",
        "postalCode": "33256",
        "city": "Jacksonville",
        "streetAddress": "5335 Gate Pakwy",
        "stateprov": "FL",
        "country": "US",
        "paymentLocation": "STOREFRONT",
        "email": "rajat.goyal@newfold.com",
        "currencyCode": "USD",
        "walletId": 123456789,
        "maskedNumber": "xxxxxxxxxxxx1111",
        "address": {
            "address1": "5335 Gate Pakwy",
            "address2": "",
            "city": "Jacksonville",
            "stateProv": "FL",
            "country": "US",
            "postalCode": "33256"
        },
        "isSecurePay": "false"
    }
}