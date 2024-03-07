# Environment
protocol = 'https'
controlpanel_protocol = 'https'
api_environment = 'www.bluehost.com'
codeguard_Auth_Token = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6Imh1YXBpIn0.eyJzdWIiOiJ1cm46amFydmlzOmJsdWVob3N0OmFjY291bnQ6dGVzdF91YXBpIiwic2NvcGUiOiJ1c2VyLWZlIiwiYWN0Ijp7InN1YiI6ImphcnZpczpibHVlaG9zdDp1c2VyOnRlc3R1c2VyIiwicm9sZSI6ImFkbWluIn0sImF1ZCI6IlFBIiwiZXhwIjoxOTcyMTE0NTMwLCJpYXQiOjE2NTY1Mzg1MzB9.SwiMBHc_uL0_kp_DmbSoQwYxUfdCtiNPDFWty8HZOFx3x-FQZLdlZ1G-gPIJC8Lu95U6Un4TAzFAtUlwCb1UWyeV-7UwD-N1v3Mj9wdNM_UKnv5DqMX0SXjDFzL-bfYhDSuTFX_Oz8nATM58PYkmTUXuo3tA1tM1NS0JAd_yo10AzmLjg3u0iljjot2Y6TuGeiUADS8fbFFKCI1_vXEsd3qY6kwQwyvs9yVaq32bEgqh4gkDD1BQhOhOoPo-7rWZMheNXGc2N2sItTx7XAHDRiStiO-q2xF_e_K92vlbGyrdXqzeWxx6wTUxyuf97VzRV1u9nhdVC_2I1Qasm_IOxA'

# Login USER CREDENTIALS
authenticate_user_login_request_body = {
    "request": {
        "requestInfo": {
            "service": "UserAPI",
            "method": "authenticateUserLogin",
            "clientId": "NSI",
            "apiAccessKey": "yneujmorzfuezfwrczobxjr5jdg"
        },
        "userLoginName": "rajatbhstg",
        "password": "Password@123"
    }
}

# SUCCESS
SUCCESS_CODE = 200
SUCCESS_CODE_CREATED = 201
SUCCESS_CODE_ACCEPTED = 202

# ERROR
ERROR_CODE_400 = 400
ERROR_CODE_401 = 401
ERROR_CODE_403 = 403
ERROR_CODE_404 = 404
ERROR_CODE_409 = 409
ERROR_CODE_450 = 450
ERROR_CODE_451 = 451
ERROR_CODE_500 = 500
ERROR_CODE_512 = 512

# PROXY
proxy_url_variable = 'http://zproxy.stg.netsol.com:8080'
