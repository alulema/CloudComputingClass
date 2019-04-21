docker stop $(docker ps -qa)
docker rm $(docker ps -qa)
docker network rm $(docker network ls -q)
