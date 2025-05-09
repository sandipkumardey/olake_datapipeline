# OLake Data Pipeline

A modern data pipeline that demonstrates real-time data synchronization from MySQL to Apache Iceberg using OLake's Integration with Rest Catalog, with Apache Spark for data analysis.

## Features

- Real-time data synchronization using OLake
- Seamless MySQL to Apache Iceberg integration
- Parquet file storage for efficient querying
- Apache Spark integration for data analysis
- Docker-based development environment

## Prerequisites

- Docker and Docker Compose
- Python 3.8+
- Git

## Quick Start

1. Clone the repository:
```bash
git clone https://github.com/sandipkumardey/olake_datapipeline.git
cd olake-pipeline
```

2. Start the services:
```bash
docker compose up -d
```

3. The following services will be available:
- MySQL Database: localhost:3307
- MinIO (Object Storage): localhost:9000
- Spark UI: localhost:4040

## Project Structure

```
olake-pipeline/
├── config/                 # Configuration files
│   ├── source.json        # Source database configuration
│   ├── streams.json       # Stream configuration
│   └── destination.json   # Destination configuration
├── scripts/               # Utility scripts
├── warehouse/            # Data warehouse directory
└── docker-compose.yml    # Docker services configuration
```

## Data Flow

1. MySQL Database (Source)
   - Stores the original data
   - Configured for OLake integration

2. OLake Integration
   - Real-time data synchronization
   - Automatic schema discovery
   - Transforms data to Iceberg format
   - Stores data in Parquet files

3. Apache Spark
   - Reads Parquet files
   - Performs data analysis
   - Provides SQL querying capabilities

## Usage

1. Start the OLake sync process:
```bash
docker run -d --name olake-sync \
  -v $(pwd)/config:/mnt/config \
  -v $(pwd)/warehouse:/mnt/warehouse \
  olakego/source-mysql:latest \
  sync /mnt/config/source.json /mnt/config/streams.json /mnt/config/destination.json
```

2. Query data using Spark:
```bash
docker exec -it spark-iceberg spark-submit /workspace/query_orders.py
```

## Development

- The project uses Docker for consistent development environments
- Configuration files are mounted as volumes
- Data is persisted in the warehouse directory

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request
