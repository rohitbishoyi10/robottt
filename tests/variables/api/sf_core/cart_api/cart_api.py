empty_cart_api_request_body = {
    "request": {
        "requestInfo": {
            "service": "CartAPI",
            "method": "emptyCart",
            "clientId": "UPP",
            "apiAccessKey": "c1zonzmwbo0csjdeml1nlixzug3",
            "isloading": False
        }
    }
}

get_disclaimers_request_body = {
    "request": {
        "requestInfo": {
            "service": "CartAPI",
            "method": "getDisclaimers",
            "clientId": "AEM",
            "apiAccessKey": "o7qsuyqmznkscppcdro678vidbr"
        },
        "disclaimerId": "CTBBHPR2"
    }
}

get_cart_count_request_body = {
    "request": {
        "requestInfo": {
            "service": "CartAPI",
            "method": "getCartCount",
            "clientId": "UPP",
            "apiAccessKey": "c1zonzmwbo0csjdeml1nlixzug3",
            "isloading": False
        }
    }
}

get_cart_request_body = {
    "request": {
        "requestInfo": {
            "service": "CartAPI",
            "method": "getCart",
            "clientId": "UPP",
            "apiAccessKey": "c1zonzmwbo0csjdeml1nlixzug3",
            "isloading": True
        },
        "retrieveDisclaimers": False
    }
}

add_upsells_to_cart_request_body = {
    "request": {
        "requestInfo": {
            "service": "CartAPI",
            "method": "addUpsellsToCart",
            "clientId": "NSI",
            "apiAccessKey": "yneujmorzfuezfwrczobxjr5jdg",
            "isloading": True
        },
        "flowId": "none",
        "promo": "FREEPRIVACYNS",
        "upsellList": [
            {
                "productCode": "DOM",
                "domainEntries": [
                    "testxyz.site"
                ],
                "existingDomain": False
            },
            {
                "productCode": "PRI_REG_V2",
                "domainEntries": [
                    "testyoast123.net"
                ],
                "existingDomain": False
            }
        ],
        "domainEntries": [
            "testyoast123.net"
        ],
        "depDomainEntries": [
            "testyoast123.net"
        ]
    }
}