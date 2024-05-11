import ssl

context = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
context.load_cert_chain('/home/jupyter/certs/certificate.crt', '/home/jupyter/certs/private-key.key')
