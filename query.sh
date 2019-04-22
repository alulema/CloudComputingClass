echo "======= Gathering data from IP 30000 ===================================="
mongo localhost:30000 < scripts/queryData.js
echo "======= Gathering data from IP 30001 ===================================="
mongo localhost:30001 < scripts/queryData.js
echo "======= Gathering data from IP 30002 ===================================="
mongo localhost:30002 < scripts/queryData.js
