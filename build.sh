apt install -y mongodb-clients wget
docker build --no-cache -t alulema/mongodb-config -f Dockerfile-config .
docker network create --driver bridge mongonet

docker create --name configServer --network=mongonet --rm -p 30000:27017 -v /tmp/data/configsvr:/data/db alulema/mongodb-config
echo "Launching config server..."
docker start configServer
docker cp configServer:/home/core/mongodb-keyfile mongodb-keyfile
mongo localhost:30000 < scripts/createUsers.js
wget https://raw.githubusercontent.com/ozlerhakan/mongodb-json-files/master/datasets/countries.json
mongoimport --host localhost:30000 --db geodb --collection countries --file countries.json

docker build --no-cache -t alulema/mongodb -f Dockerfile-mongodb .
docker create --name sharding1 --network=mongonet --rm -p 30001:27017 -v /tmp/data/1:/data/db alulema/mongodb
echo "Launching sharding1..."
docker start sharding1
mongoimport --host localhost:30001 --db geodb --collection countries --file countries.json

docker create --name sharding2 --network=mongonet --rm -p 30002:27017 -v /tmp/data/2:/data/db alulema/mongodb
echo "Launching sharding1..."
docker start sharding2
mongoimport --host localhost:30002 --db geodb --collection countries --file countries.json
echo "Finishing!"
