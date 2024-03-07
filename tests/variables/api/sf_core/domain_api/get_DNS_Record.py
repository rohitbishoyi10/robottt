get_DNS_Record_request_body = {
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

get_Domain_DNSRecords_with_invalid_request_body = {
    "requestInfo": {
        "service": "DomainAPI",
        "method": "getDomainHostRecords",
        "clientId": "NSI2",
        "apiAccessKey": "yneujmorzfuezfwrczobxjr5jdg"
    },
    "domainName": "testingbhgw.site",
    "startIndex": 0,
    "requestedSize": 100
}

get_Domain_DNSRecords_with_space_request_body = {
    "requestInfo": {
        "service": "DomainAPI",
        "method": "getDomainHostRecords",
        "clientId": "NSI",
        "apiAccessKey": "yneujmorzfuezfwrczobxjr5jdg"
    },
    "domainName": "   testingbhgw.site",
    "startIndex": 0,
    "requestedSize": 100
}