# Local dev setup
mkdir -p ./nginx/certificates/live/shawfamily.online/

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout ./nginx/certificates/live/shawfamily.online/privkey.pem \
  -out ./nginx/certificates/live/shawfamily.online/fullchain.pem \
  -subj "/CN=shawfamily.online"

mkdir -p ./nginx/certificates/live/jonshaw199.com/

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout ./nginx/certificates/live/jonshaw199.com/privkey.pem \
  -out ./nginx/certificates/live/jonshaw199.com/fullchain.pem \
  -subj "/CN=jonshaw199.com"

sudo chmod 777 ./nginx/logs