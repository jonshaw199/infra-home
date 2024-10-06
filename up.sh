
cd home
git pull
docker compose -f compose.yaml up --build -d
cd ..
git pull
docker compose -f docker-compose.yml up --build -d