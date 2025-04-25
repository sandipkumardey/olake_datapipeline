#!/bin/bash

$SPARK_HOME/bin/spark-submit \
  --master local[*] \
  --packages org.apache.iceberg:iceberg-spark-runtime-3.4_2.12:1.4.2 \
  --conf "spark.sql.extensions=org.apache.iceberg.spark.extensions.IcebergSparkSessionExtensions" \
  --conf "spark.sql.catalog.demo=org.apache.iceberg.spark.SparkCatalog" \
  --conf "spark.sql.catalog.demo.type=rest" \
  --conf "spark.sql.catalog.demo.uri=http://iceberg-rest:8181" \
  --conf "spark.sql.catalog.demo.warehouse=s3://warehouse" \
  --conf "spark.sql.catalog.demo.s3.endpoint=http://minio:9000" \
  --conf "spark.sql.catalog.demo.s3.access-key-id=minioadmin" \
  --conf "spark.sql.catalog.demo.s3.secret-access-key=minioadmin" \
  /workspace/debug_spark.py
