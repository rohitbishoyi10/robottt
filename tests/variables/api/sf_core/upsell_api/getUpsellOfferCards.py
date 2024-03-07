post_get_welcome_interstitial_request_body = {
    "request": {
        "requestInfo": {
            "service": "AccountAPI",
            "method": "getUpsellOfferCards",
            "clientId": "NSI",
            "apiAccessKey": "yneujmorzfuezfwrczobxjr5jdg"
        },
        "numberOfCards": 10,
        "offerLocation": "interstitial"
    }
}

post_get_upsell_invalid_request_body = {
    "request": {
        "requestInfo": {
            "service": "AccountAPI",
            "method": "getUpsellOfferCards",
            "clientId": "NSI",
            "apiAccessKey": "yneujmorzfuezfwrczobxjr5jdg"
        },
        "numberOfCards": 10,
        "offerLocation": "abcxyz"
    }
}

post_get_homepage_cards_request_body = {
    "request": {
        "requestInfo": {
            "service": "AccountAPI",
            "method": "getUpsellOfferCards",
            "clientId": "NSI",
            "apiAccessKey": "yneujmorzfuezfwrczobxjr5jdg"
        },
        "numberOfCards": 10,
        "offerLocation": "homepage"
    }
}

post_get_renewal_cross_sell_pri_reg_request_body = {
    "request": {
        "requestInfo": {
            "clientId": "UPP",
            "apiAccessKey": "c1zonzmwbo0csjdeml1nlixzug3",
            "method": "getRenewalFlowCrossSellOffer",
            "service": "FlowAPI",
            "isloading": True
        },
        "productsBeingRenewed": [
            "WN.D.622818005"
        ]
    }
}

post_get_renewal_cross_sell_wp_hosting_request_body = {
    "request": {
        "requestInfo": {
            "clientId": "UPP",
            "apiAccessKey": "c1zonzmwbo0csjdeml1nlixzug3",
            "method": "getRenewalFlowCrossSellOffer",
            "service": "FlowAPI",
            "isloading": True
        },
        "productsBeingRenewed": [
            "WN.D.321576461", "321576532"
        ]
    }
}

post_get_renewal_cross_sell_ssl_request_body = {
    "request": {
        "requestInfo": {
            "clientId": "UPP",
            "apiAccessKey": "c1zonzmwbo0csjdeml1nlixzug3",
            "method": "getRenewalFlowCrossSellOffer",
            "service": "FlowAPI",
            "isloading": True
        },
        "productsBeingRenewed": [
            "WN.D.321603533", "321603542", "WN.HP.321603526"
        ]
    }
}

post_get_renewal_cross_sell_sitelock_essentials_request_body = {
    "request": {
        "requestInfo": {
            "clientId": "UPP",
            "apiAccessKey": "c1zonzmwbo0csjdeml1nlixzug3",
            "method": "getRenewalFlowCrossSellOffer",
            "service": "FlowAPI",
            "isloading": True
        },
        "productsBeingRenewed": [
            "WN.HP.322196936", "WN.C.321903712"
        ]
    }
}

post_get_renewal_cross_sell_ineligible_request_body = {
    "request": {
        "requestInfo": {
            "clientId": "UPP",
            "apiAccessKey": "c1zonzmwbo0csjdeml1nlixzug3",
            "method": "getRenewalFlowCrossSellOffer",
            "service": "FlowAPI",
            "isloading": True
        },
        "productsBeingRenewed": [
            "WN.HP.322488090"
        ]
    }
}
