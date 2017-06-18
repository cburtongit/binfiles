
#!/bin/sh

domain=${1:-devxom.tech}

openssl req \
    -newkey rsa:4096 -nodes -sha256 -keyout certs/${domain}.key \
    -x509 -days 365 -out certs/${domain}.crt \
    -subj "/C=BE/ST= /L= /O= /OU= /CN=${1:-domain}"