#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Zabbix SMTP Alert script for zoho mail.
"""

import sys
import smtplib
from email.MIMEText import MIMEText
from email.Header import Header
from email.Utils import formatdate

# Mail Account
MAIL_ACCOUNT = 'dashboard@wisilica.com'
MAIL_PASSWORD = 'W1s1l1c@123'

# Sender Name
SENDER_NAME = u'dashboard@wisilica.com'

# Mail Server
SMTP_SERVER = 'smtp.zoho.com'
SMTP_PORT = 587

def send_mail(recipient, subject, body, encoding='utf-8'):
    session = None
    msg = MIMEText(body, 'plain', encoding)
    msg['Subject'] = Header(subject, encoding)
    msg['From'] = Header(SENDER_NAME, encoding)
    msg['To'] = recipient
    msg['Date'] = formatdate()
    try:
        session = smtplib.SMTP(SMTP_SERVER, SMTP_PORT)
        # session.set_debuglevel(1)
        session.starttls()
        session.login(MAIL_ACCOUNT, MAIL_PASSWORD)
        session.sendmail(MAIL_ACCOUNT, recipient, msg.as_string())
    except Exception as e:
        raise e
    finally:
        # close session
        if session:
            session.quit()

if __name__ == '__main__':
    """
    recipient = sys.argv[1]
    subject = sys.argv[2]
    body = sys.argv[3]
    """
    if len(sys.argv) == 4:
        send_mail(
            recipient=sys.argv[1],
            subject=sys.argv[2],
            body=sys.argv[3])
    else:
        print u"""requires 3 parameters (recipient, subject, body)
\t$ zabbix-gmail.sh recipient subject body
"""
