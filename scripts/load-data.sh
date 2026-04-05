#!/bin/bash
echo "=== Loading Lab Data into HDFS ==="

until hdfs dfs -ls / > /dev/null 2>&1; do
    echo "Waiting for HDFS..."
    sleep 3
done

echo "Waiting for safe mode to exit..."
hdfs dfsadmin -safemode wait

hdfs dfs -mkdir -p /user/root/pig_data
hdfs dfs -mkdir -p /user/root/pig_output

echo "Uploading students.csv..."
hdfs dfs -put -f /data/students.csv /user/root/pig_data/

echo "Uploading courses.csv..."
hdfs dfs -put -f /data/courses.csv /user/root/pig_data/

echo "Uploading enrollments.csv..."
hdfs dfs -put -f /data/enrollments.csv /user/root/pig_data/

echo "Uploading sales.csv..."
hdfs dfs -put -f /data/sales.csv /user/root/pig_data/

echo ""
echo "=== Verifying ==="
hdfs dfs -ls /user/root/pig_data/
echo ""
echo "=== All data loaded successfully! ==="
