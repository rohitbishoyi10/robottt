# Environment
protocol = 'https'
controlpanel_protocol = 'https'
api_environment = 'www.bluehost.com'

# Login USER CREDENTIALS
authenticate_user_login_request_body = {
    "request": {
        "requestInfo": {
            "service": "UserAPI",
            "method": "authenticateUserLogin",
            "clientId": "NSI",
            "apiAccessKey": "yneujmorzfuezfwrczobxjr5jdg"
        },
        "userLoginName": "rajatgoyalqamain",
        "password": "Password@123"
    }
}

# SUCCESS
SUCCESS_CODE = 200
SUCCESS_CODE_CREATED = 201
SUCCESS_CODE_ACCEPTED = 202

# REDIRECT
REDIRECT_CODE_301 = 301
REDIRECT_CODE_302 = 302

# ERROR
ERROR_CODE_400 = 400
ERROR_CODE_401 = 401
ERROR_CODE_403 = 403
ERROR_CODE_404 = 404
ERROR_CODE_409 = 409
ERROR_CODE_450 = 450
ERROR_CODE_451 = 451
ERROR_CODE_500 = 500

# PROXY
proxy_url_variable = 'http://zproxy.qamain.netsol.com:8080'
