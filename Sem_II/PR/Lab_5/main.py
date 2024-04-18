import smtplib
import imaplib
import poplib
import email
import os
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.image import MIMEImage
from email.mime.audio import MIMEAudio
from email.mime.base import MIMEBase

# Configure connection parameters for Fastmail
SMTP_SERVER = 'smtp.fastmail.com'
SMTP_PORT = 587
IMAP_SERVER = 'imap.fastmail.com'
IMAP_PORT = 993
POP3_SERVER = 'pop.fastmail.com'
POP3_PORT = 995

FASTMAIL_USERNAME = 'stanislavchirita991@fastmail.com'
FASTMAIL_PASSWORD = 'fn4chi9P'

def send_email(subject, message, to_email, attachment=None, reply_to=None):
    # Create an MIMEMultipart object to build the email
    msg = MIMEMultipart()
    msg['From'] = FASTMAIL_USERNAME
    msg['To'] = to_email
    msg['Subject'] = subject

    if reply_to:
        msg.add_header('reply-to', reply_to)

    # Add the plain text message to the email
    msg.attach(MIMEText(message, 'plain'))

    if attachment:
        # Open the attached file and add it to the email as an attachment
        with open(attachment, 'rb') as f:
            part = MIMEBase('application', 'octet-stream')
            part.set_payload(f.read())
            part.add_header('Content-Disposition', f'attachment; filename="{attachment}"')
            msg.attach(part)

    # Connect to the SMTP server and send the email
    with smtplib.SMTP(SMTP_SERVER, SMTP_PORT) as server:
        server.ehlo()
        server.starttls()
        server.login(FASTMAIL_USERNAME, FASTMAIL_PASSWORD)
        server.send_message(msg)

def receive_email_imap():
    # Connect to the IMAP server and authenticate
    with imaplib.IMAP4_SSL(IMAP_SERVER, IMAP_PORT) as server:
        server.login(FASTMAIL_USERNAME, FASTMAIL_PASSWORD)

        # Select the inbox
        server.select('inbox')

        # Search for messages and retrieve their IDs
        _, message_ids = server.search(None, 'ALL')

        messages = []
        for message_id in message_ids[0].split():
            # Retrieve the message
            _, msg_data = server.fetch(message_id, '(RFC822)')
            messages.append(msg_data[0][1])

        return messages

def receive_email_pop3():
    # Connect to the POP3 server and authenticate
    server = poplib.POP3_SSL(POP3_SERVER, POP3_PORT)
    server.user(FASTMAIL_USERNAME)
    server.pass_(FASTMAIL_PASSWORD)

    # Get information about the messages in the mailbox
    message_count, _ = server.stat()

    messages = []
    for i in range(1, message_count + 1):
        # Retrieve the message
        _, msg_lines, _ = server.retr(i)
        msg = b'\r\n'.join(msg_lines)
        messages.append(msg.decode('latin-1'))  # Decode the message using 'latin-1' encoding

    server.quit()  # Close the connection

    return messages
    
def parse_email_message(message):
    msg = email.message_from_bytes(message) if isinstance(message, bytes) else email.message_from_string(message)

    sender = msg["From"]
    subject = msg["Subject"]
    attachments = []

    if msg.is_multipart():
        # If the message is multipart, iterate over its parts
        content = ""
        for part in msg.walk():
            if part.get_content_type() == "text/plain":
                payload = part.get_payload(decode=True)
                if isinstance(payload, bytes):
                    content += payload.decode("utf-8")
                else:
                    content += payload
            else:
                # Check if the part is an attachment
                filename = part.get_filename()
                if filename:
                    # Generate a unique filename
                    filepath = os.path.join(os.getcwd(), filename)
                    save_attachment(part, filepath)
                    attachments.append(filepath)

    else:
        # If the message is not multipart, it's a simple text message
        payload = msg.get_payload(decode=True)
        if isinstance(payload, bytes):
            content = payload.decode("utf-8")
        else:
            content = payload

    return sender, subject, content, attachments


def save_attachment(part, filepath):
  
    # Retrieve the attachment payload as bytes
    payload = part.get_payload(decode=True)

    with open(filepath, 'wb') as file:
        file.write(payload)

# Sending email
send_email("prez", "prezentare attachment", "stanislavchirita991@fastmail.com",attachment="C:\\Users\\Adminstrator\\Desktop\\UTM_2023-2024\\Sem_II\\PR\\Lab_5\\main.py")

# Receiving emails using IMAP
received_messages_imap = receive_email_imap()
with open('imap.txt', 'w') as file:
    file.write("imap\n\n")
    for message in received_messages_imap:
        sender, subject, content, attachments = parse_email_message(message)
        file.write("Sender: {}\n".format(sender))
        file.write("Subject: {}\n".format(subject))
        file.write("Content:\n{}\n".format(content))
        file.write("Attachments: {}\n".format(attachments))
        file.write("-----------\n")

# Receiving emails using POP3
received_messages_pop3 = receive_email_pop3()
with open('pop3.txt', 'w') as file:
    file.write("pop3\n\n")
    for message in received_messages_pop3:
        sender, subject, content, attachments = parse_email_message(message)
        file.write("Sender: {}\n".format(sender))
        file.write("Subject: {}\n".format(subject))
        file.write("Message:\n{}\n".format(content))
        file.write("Attachments: {}\n".format(attachments))
        file.write("-----------\n")
        



