# Pig on Hadoop/HDFS Lab with Apache Zeppelin

Docker-based lab: Apache Pig on Hadoop HDFS (1 NameNode + 2 DataNodes) with Zeppelin GUI.

## Quick Start (Students)

```bash
git clone https://github.com/med0712/pig-hadoop-lab.git
cd pig-hadoop-lab
docker compose pull
docker compose up -d
# Wait 60 seconds, then:
docker exec namenode bash /scripts/load-data.sh
```

## Access

| Service     | URL                   |
|-------------|-----------------------|
| HDFS Web UI | http://localhost:9870 |
| Zeppelin    | http://localhost:8080 |

## Test Pig (CLI)

```bash
docker exec -it namenode pig -x mapreduce /scripts/demo.pig
```

## Test Pig (Zeppelin GUI)

1. Open http://localhost:8080
2. Create new note
3. In a cell, type:

```
%pig

sales = LOAD '/user/root/pig_data/sales.csv' USING PigStorage(',')
    AS (order_id:int, order_date:chararray, category:chararray,
        product:chararray, price:double, city:chararray);
DUMP sales;
```

4. Press Shift+Enter

## Cleanup

```bash
docker compose down -v
```
