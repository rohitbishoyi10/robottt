import os
import sys
from email.mime.application import MIMEApplication
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

import boto3
from botocore.exceptions import ClientError

# This address must be verified with Amazon SES.
SENDER = "alerts@maestro.bluehost.com"

# Still in sandbox, these addresses must be verified.
RECIPIENT1 = "sdetteam-hostingpillar@newfold.com"
RECIPIENT2 = "siddhant.wadhwani@newfold.com"
RECIPIENT3 = "ar.velayutham@newfold.com"

# Specify a configuration set. If you do not want to use a configuration
# set, comment the following variable, and the
# ConfigurationSetName=CONFIGURATION_SET argument below.
CONFIGURATION_SET = ""

# If necessary, replace us-east-1 with the AWS Region you're using for Amazon SES.
AWS_REGION = "us-east-1"

# The subject line for the email.
SUBJECT = "[BH-Apac] "+str(sys.argv[1])+" Test Automation Report (On "+str(sys.argv[4])+")"

# The email body for recipients with non-HTML email clients.
BODY_TEXT = "Please find the attached "+str(sys.argv[1])+" Test Automation Report (On "+str(sys.argv[4])+"):"

# The HTML body of the email.
BODY_HTML = """\
<html>
<head></head>
<body>
<h3>Hello all!</h3>
<p>Automation Test Result: </p>"""+str(sys.argv[5])+"""
<h3> BH Apac Automation Tests: </h3>"""+str(sys.argv[1])+"""
<h3> View Allure Report: </h3>"""+str(sys.argv[2])+"""
<h3> Download Allure Report: </h3>"""+str(sys.argv[3])+"""
<h3>Please find attached herewith:</h3>
<p>a. Automation Metrics Report</p>
<p>b. Static Code Analysis Report</p>
</body>
</html>
"""

# The character encoding for the email.
CHARSET = "utf-8"

# Create a new SES resource and specify a region.
client = boto3.client('ses', region_name=AWS_REGION)

# Create a multipart/mixed parent container.
msg = MIMEMultipart('mixed')
# Add subject, from and to lines.
msg['Subject'] = SUBJECT
msg['From'] = SENDER
msg['To'] = "sdetteam-hostingpillar@newfold.com"

# Create a multipart/alternative child container.
msg_body = MIMEMultipart('alternative')

# Encode the text and HTML content and set the character encoding. This step is
# necessary if you're sending a message with characters outside the ASCII range.
textpart = MIMEText(BODY_TEXT.encode(CHARSET), 'plain', CHARSET)
htmlpart = MIMEText(BODY_HTML.encode(CHARSET), 'html', CHARSET)

# Add the text and HTML parts to the child container.
msg_body.attach(textpart)
msg_body.attach(htmlpart)

# Attach the multipart/alternative child container to the multipart/mixed
# parent container.
msg.attach(msg_body)

# The full path to the file that will be attached to the email.
ATTACHMENTS = ["./regression_metrics.html", "./static_analysis_report.log"]

for attachment in ATTACHMENTS:
    # Define the attachment part and encode it using MIMEApplication.
    att = MIMEApplication(open(attachment, 'rb').read())
    # Add a header to tell the email client to treat this part as an attachment,
    # and to give the attachment a name.
    att.add_header('Content-Disposition', 'attachment', filename=os.path.basename(attachment))
    # Add the attachment to the parent container.
    msg.attach(att)

try:
    # Provide the contents of the email.
    response = client.send_raw_email(
        Source=SENDER,
        Destinations=[
            RECIPIENT1,
            RECIPIENT2,
            RECIPIENT3
        ],
        RawMessage={
            'Data': msg.as_string(),
        },
        ConfigurationSetName=CONFIGURATION_SET
    )
# Display an error if something goes wrong.
except ClientError as e:
    print(e.response['Error']['Message'])
else:
    print("Email sent! Message ID:"),
    print(response['MessageId'])
