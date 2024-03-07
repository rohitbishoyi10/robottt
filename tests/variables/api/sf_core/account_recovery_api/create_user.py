create_user_endpoint = '/api/v1.0/users'

create_user_request_body = {
    "userId": "TEST-TESTENG-19879870.COM",
    "password": "Password1234",
    "firstName": "testeng-19879870",
    "lastName": "Engineering",
    "address": {
        "line1": "123 Fake St.",
        "line2": "",
        "city": "New York",
        "state": "NY",
        "country": "US",
        "zipCode": "10012"
    },
    "email": "testeng-19879870@web.co",
    "phone": "2104567890",
    "company": "",
    "promoCommunications": False
}

create_user_invalid_request_body = {
    "userId": "TEST-TESTENG-19879870.COM",
    "password": "Password1234",
    "firstName": "testeng-19879870",
    "lastName": "Engineering",
    "address": {
        "line1": "",
        "line2": "",
        "city": "New York",
        "state": "NY",
        "country": "US",
        "zipCode": ""
    },
    "email": "testeng-19879870@web.co",
    "phone": "2104567890",
    "company": "",
    "promoCommunications": False
}