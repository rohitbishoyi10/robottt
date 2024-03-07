get_ctb_purchase_info_request_body = {
    "request": {
        "requestInfo": {
            "service": "OrderAPI",
            "method": "getCTBPurchaseInfo",
            "clientId": "AEM",
            "apiAccessKey": "o7qsuyqmznkscppcdro678vidbr"
        },
        "productCode": "PRI_REG_V2",
        "purchaseTermUnit": "YEAR",
        "accountId": 41688528,
        "coupon": "",
        "upgradeCode": "",
        "parentProdInstId": "WN.D.622818005"
    }
}

get_ctb_purchase_info_invalid_product_code_request_body = {
    "request": {
        "requestInfo": {
            "service": "OrderAPI",
            "method": "getCTBPurchaseInfo",
            "clientId": "AEM",
            "apiAccessKey": "o7qsuyqmznkscppcdro678vidbr"
        },
        "productCode": "PRI_REG_V1234",
        "purchaseTermUnit": "YEAR",
        "accountId": 41688528,
        "coupon": "",
        "upgradeCode": "",
        "parentProdInstId": "WN.D.622818005"
    }
}

get_ctb_purchase_info_invalid_purchase_term_unit_request_body = {
    "request": {
        "requestInfo": {
            "service": "OrderAPI",
            "method": "getCTBPurchaseInfo",
            "clientId": "AEM",
            "apiAccessKey": "o7qsuyqmznkscppcdro678vidbr"
        },
        "productCode": "PRI_REG_V2",
        "purchaseTermUnit": "abc12",
        "accountId": 41688528,
        "coupon": "",
        "upgradeCode": "",
        "parentProdInstId": "WN.D.622818005"
    }
}