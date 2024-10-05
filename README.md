## Setup

- Run `setup.sh`

## TODO

- Investigate permissions for ./nginx/logs directory; containers need to be able to write to this directory
  - Confirmed; this needs to be fixed asap
  - For now, run `chmod 777 ./nginx/logs`

## Misc

### Use self-signed certs in local dev and lets encrypt in prod

A volume exists that maps `./nginx/certificates` to `/etc/letsencrypt` (for prod); in local dev, we will use self signed certs and then just place them where they are expected (in the lets encrypt directory). In other words, use `openssl` to generate certs and put them in `./nginx/certificates` which maps to `/etc/letsencrypt`:

```
mkdir -p ./nginx/certificates/live/shawfamily.online/

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout ./nginx/certificates/live/shawfamily.online/privkey.pem \
  -out ./nginx/certificates/live/shawfamily.online/fullchain.pem \
  -subj "/CN=shawfamily.online"
```

Breakdown of the `openssl` command:
-x509: This is the flag that specifies you want a self-signed certificate.
-nodes: This ensures the private key will not be encrypted (no passphrase required to use it).
-days 365: The certificate will be valid for 365 days.
-newkey rsa:2048: This creates a new RSA key that is 2048 bits long.
-keyout: The location of the generated private key (privkey.pem).
-out: The location of the generated certificate (fullchain.pem).
-subj: This is the subject of the certificate, where /CN= defines the Common Name (the domain the certificate is for).
