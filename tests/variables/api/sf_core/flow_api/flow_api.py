check_eligible_upsell_request_body = {
    "request": {
        "requestInfo": {
            "clientId": "UPP",
            "apiAccessKey": "c1zonzmwbo0csjdeml1nlixzug3",
            "method": "checkEligibleUpsell",
            "service": "FlowAPI",
            "isloading": True
        },
        "flowId": "ppcFlow",
        "checkerList": [
            "DEP"
        ]
    }
}

check_eligible_upsell_without_flowid_request_body = {
    "request": {
        "requestInfo": {
            "clientId": "UPP",
            "apiAccessKey": "c1zonzmwbo0csjdeml1nlixzug3",
            "method": "checkEligibleUpsell",
            "service": "FlowAPI",
            "isloading": True
        },
        "flowId": "",
        "checkerList": [
            "DEP"
        ]
    }
}

get_next_page_request_body = {
    "request": {
        "requestInfo": {
            "service": "FlowAPI",
            "method": "getNextPage",
            "clientId": "UPP",
            "apiAccessKey": "c1zonzmwbo0csjdeml1nlixzug3"
        },
        "screenId": "none",
        "flowId": "none"
    }
}