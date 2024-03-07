get_Domain_HostRecords_request_body = {
    "request": {
        "requestInfo": {
            "service": "DomainAPI",
            "method": "getDomainHostRecords",
            "clientId": "NSI",
            "apiAccessKey": "yneujmorzfuezfwrczobxjr5jdg"
        },
        "domainName": "thirdpartydomaintest.com",
        "startIndex": 0,
        "requestedSize": 100
    }
}

get_Domain_HostRecords_with_invalid_request_body = {
    "request": {
        "requestInfo": {
            "service": "DomainAPI",
            "method": "getDomainHostRecords",
            "clientId": "NS2",
            "apiAccessKey": "yneujmorzfuezfwrczobxjr5jdg"
        },
        "domainName": "TEST-WP-BASIC-2023042801.COM",
        "startIndex": 0,
        "requestedSize": 100
    }
}

get_Domain_HostRecords_with_space_request_body = {
    "request": {
        "requestInfo": {
            "service": "DomainAPI",
            "method": "getDomainHostRecords",
            "clientId": "NS2",
            "apiAccessKey": "yneujmorzfuezfwrczobxjr5jdg"
        },
        "domainName": "TEST-WP-BASIC-2023042801.COM",
        "startIndex": 0,
        "requestedSize": 100
    }
}