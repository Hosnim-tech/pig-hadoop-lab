#!/bin/bash

# Format namenode if not already formatted
if [ ! -d "/hadoop/dfs/name/current" ]; then
    echo "=== Formatting HDFS NameNode ==="
    hdfs namenode -format -force -nonInteractive
fi

echo "=== Starting HDFS NameNode ==="
hdfs namenode &
NAMENODE_PID=$!

# Wait for namenode to be ready (up to 60 seconds)
echo "Waiting for NameNode to be ready..."
for i in $(seq 1 30); do
    if hdfs dfs -ls / > /dev/null 2>&1; then
        echo "NameNode is ready!"
        break
    fi
    echo "  Attempt $i/30 - waiting..."
    sleep 2
done

# Wait for safe mode to exit
echo "Waiting for safe mode to exit..."
hdfs dfsadmin -safemode wait 2>/dev/null || true

# Create directories (ignore errors if they already exist)
hdfs dfs -mkdir -p /user/root/pig_data 2>/dev/null || true
hdfs dfs -mkdir -p /user/root/pig_output 2>/dev/null || true
hdfs dfs -chmod -R 777 /user 2>/dev/null || true

echo "=== NameNode is ready! ==="
echo "=== Web UI: http://localhost:9870 ==="

# Keep container running by waiting on the namenode process
wait $NAMENODE_PID
