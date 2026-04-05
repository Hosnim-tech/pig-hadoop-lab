#!/bin/bash
set -e

echo "=== Starting HDFS DataNode ==="
sleep 5
hdfs datanode &

echo "=== DataNode is ready! ==="
tail -f /dev/null
