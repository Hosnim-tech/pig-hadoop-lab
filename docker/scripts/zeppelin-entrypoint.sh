#!/bin/bash

echo "=== Waiting for HDFS ==="
until hdfs dfs -ls / > /dev/null 2>&1; do
    echo "Waiting for HDFS..."
    sleep 5
done

echo "=== Starting Apache Zeppelin 0.9.0 ==="
echo "=== Web UI: http://localhost:8080 ==="
echo "=== Pig interpreter: use %pig in notebook cells ==="

/opt/zeppelin/bin/zeppelin-daemon.sh start

tail -f /opt/zeppelin/logs/zeppelin*.log
