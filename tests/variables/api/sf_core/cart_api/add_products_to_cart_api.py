add_products_to_cart_request_body = {
    "request": {
        "requestInfo": {
            "service": "CartAPI",
            "method": "addProductsToCart",
            "clientId": "NSI",
            "apiAccessKey": "yneujmorzfuezfwrczobxjr5jdg"
        },
        "productList": [
            {
                "productCode": "BH_DEDI_PREM_SSD_WIN",
                "domainName": "WN.D.321603533",
                "transactionType": 1,
                "termQuantity": 1,
                "termUnit": 1,
                "associatedProducts": [],
                "parentProdInstId": None,
                "add-ons": []
            }
        ]
    }
}

add_products_to_cart_invalid_term_unit_request_body = {
    "request": {
        "requestInfo": {
            "service": "CartAPI",
            "method": "addProductsToCart",
            "clientId": "NSI",
            "apiAccessKey": "yneujmorzfuezfwrczobxjr5jdg"
        },
        "productList": [
            {
                "productCode": "BH_DEDI_PREM_SSD_WIN",
                "domainName": "",
                "transactionType": 1,
                "termQuantity": 1,
                "termUnit": 0,
                "associatedProducts": [],
                "parentProdInstId": None,
                "add-ons": []
            }
        ]
    }
}

add_products_to_cart_invalid_product_code_request_body = {
    "request": {
        "requestInfo": {
            "service": "CartAPI",
            "method": "addProductsToCart",
            "clientId": "NSI",
            "apiAccessKey": "yneujmorzfuezfwrczobxjr5jdg"
        },
        "productList": [
            {
                "productCode": "abcxyz",
                "domainName": "",
                "transactionType": 1,
                "termQuantity": 1,
                "termUnit": 1,
                "associatedProducts": [],
                "parentProdInstId": None,
                "add-ons": []
            }
        ]
    }
}

add_products_to_cart_empty_product_code_request_body = {
    "request": {
        "requestInfo": {
            "service": "CartAPI",
            "method": "addProductsToCart",
            "clientId": "NSI",
            "apiAccessKey": "yneujmorzfuezfwrczobxjr5jdg"
        },
        "productList": [
            {
                "productCode": "",
                "domainName": "",
                "transactionType": 1,
                "termQuantity": 1,
                "termUnit": 1,
                "associatedProducts": [],
                "parentProdInstId": None,
                "add-ons": []
            }
        ]
    }
}