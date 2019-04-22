docker stop $(docker ps -qa)
docker rm $(docker ps -qa)
docker network rm $(docker network ls -q)
docker rmi alulema/mongodb-config
docker rmi alulema/mongodb
rm countries.json*
rm mongodb-keyfile
