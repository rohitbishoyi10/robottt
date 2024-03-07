contact_email_replacement_endpoint = '/api/v1.0/users/{userId}/domains/{domainName}/contact-email-replacement'

cer_valid_userid = 'rajatgoyalqamain'
cer_invalid_userid = 'rajatgoyalqamain123'
cer_valid_domain = 'testingrajat123.com'
cer_invalid_domain = 'testpcr.online'

contact_email_replacement_request_body = {
    "firstName": "Aditya",
    "lastName": "Chaudhari",
    "replacementEmail": "aditya@test.com",
    "phone": "1234567890",
    "files": [
        {
            "fileName": "abcd.pdf",
            "fileContext": "a23412",
            "base64File": "123414"
        },
        {
            "fileName": "abcd.pdf",
            "fileContext": "a23412",
            "base64File": "123414"
        }
    ]
}
