update_Domain_Security_Details_request_body = {
    "request": {
        "requestInfo": {
            "service": "DomainAPI",
            "method": "updateDomainSecurityDetails",
            "clientId": "NSI",
            "apiAccessKey": "yneujmorzfuezfwrczobxjr5jdg"
        },
        "domainName": "testingrajat123.com",
        "type": "SiteLock"
    }
}

update_Domain_Security_Details_with_invalid_request_body = {
    "request": {
        "requestInfo": {
            "service": "DomainAPI",
            "method": "updateDomainSecurityDetails",
            "clientId": "NS2",
            "apiAccessKey": "yneujmorzfuezfwrczobxjr5jdg"
        },
        "domainName": "testingrajat123.com",
        "type": "SiteLock"
    }
}

update_Domain_Security_Details_with_space_request_body = {
    "request": {
        "requestInfo": {
            "service": "DomainAPI",
            "method": "updateDomainSecurityDetails",
            "clientId": "NSI",
            "apiAccessKey": "yneujmorzfuezfwrczobxjr5jdg"
        },
        "domainName": "  testingrajat123.com",
        "type": "SiteLock"
    }
}
