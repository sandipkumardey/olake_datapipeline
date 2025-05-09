from pyspark.sql import SparkSession
from pyspark.sql.functions import col, unbase64, sum, expr
from pyspark.sql.types import StringType

# Initialize Spark session
spark = SparkSession.builder \
    .appName("OLake Orders Analysis") \
    .config("spark.sql.extensions", "org.apache.iceberg.spark.extensions.IcebergSparkSessionExtensions") \
    .getOrCreate()

# Read Parquet files
df = spark.read.parquet("/warehouse/olake_orders/olake_orders/orders")

# Decode base64 columns and convert to string
df = df.withColumn("decoded_status", expr("cast(unbase64(status) as string)")) \
       .withColumn("decoded_total_amount", expr("cast(unbase64(total_amount) as string)"))

# Convert total_amount to numeric
df = df.withColumn("total_amount_numeric", col("decoded_total_amount").cast("double"))

# Show schema
print("\nSchema:")
df.printSchema()

# Count total orders
total_orders = df.count()
print(f"\nTotal Orders: {total_orders}")

# Show sample data
print("\nSample Data:")
df.select("order_id", "customer_id", "decoded_status", "total_amount_numeric") \
  .show(5, truncate=False)

# Group by status and count
print("\nOrders by Status:")
df.groupBy("decoded_status") \
  .count() \
  .orderBy("decoded_status") \
  .show(truncate=False)

# Group by status and sum total amount
print("\nTotal Amount by Status:")
df.groupBy("decoded_status") \
  .sum("total_amount_numeric") \
  .orderBy("decoded_status") \
  .show(truncate=False)

# Stop Spark session
spark.stop() 