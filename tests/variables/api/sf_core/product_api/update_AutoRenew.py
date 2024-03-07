update_AutoRenew_request_body = {
    "request": {
        "requestInfo": {
            "service": "ProductAPI",
            "method": "updateAutoRenew",
            "clientId": "NSI",
            "apiAccessKey": "yneujmorzfuezfwrczobxjr5jdg"
        },
        "renewData": [
            {
                "accountId": 41688528,
                "products": [
                    {
                        "productInstanceId": "WN.HP.321603502",
                        "productCode": "ECOMDASH_PREMIUM",
                        "productType": "Ecommerce"
                    }
                ],
                "autoRenew": "enable"
            }
        ]
    }
}
update_AutoRenew_negative_request_body={
    "request": {
        "requestInfo": {
            "service": "ProductAPI",
            "method": "updateAutoRenew",
            "clientId": "NSI",
            "apiAccessKey": "yneujmorzfuezfwrczobxjr5jdg"
        },
        "renewData": [
            {
                "accountId": 41688123,
                "products": [
                    {
                        "productInstanceId": "WN.HP.321603502",
                        "productCode": "ECOMDASH_PREMIUM",
                        "productType": "Ecommerce"
                    }
                ],
                "autoRenew": "enable"
            }
        ]
    }
}