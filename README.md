# OLake Data Pipeline

A modern data pipeline that demonstrates real-time data synchronization from MySQL to Apache Iceberg using OLake's Integration with Rest Catalog, with Apache Spark for data analysis.

![Image](https://github.com/user-attachments/assets/7d715b0b-3db3-4074-8fb7-153d454bbc95)

## Features

- Real-time data synchronization using OLake
- Seamless MySQL to Apache Iceberg integration
- Parquet file storage for efficient querying
- Apache Spark integration for data analysis
- Docker-based development environment
- REST Catalog integration for Iceberg tables
- OLake's discover and sync capabilities
- Automated schema discovery and synchronization

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
- Spark UI: localhost:4040
- REST Catalog: localhost:8181

## Project Structure

```
olake-pipeline/
├── config/                 # Configuration files
│   ├── source.json        # Source database configuration
│   ├── streams.json       # Stream configuration
│   ├── destination.json   # Destination configuration
│   └── catalog.json      # REST Catalog configuration
├── scripts/               # Utility scripts
├── warehouse/            # Data warehouse directory
└── docker-compose.yml    # Docker services configuration
```

## Data Flow

![Image](https://github.com/user-attachments/assets/15257391-9659-496d-b236-883d2257fa60)

1. MySQL Database (Source)
   - Stores the original data
   - Configured for OLake integration
   - Supports real-time data synchronization

2. OLake Integration
   - Schema discovery using `discover` command
   - Data synchronization using `sync` command
   - Automatic schema discovery
   - Transforms data to Iceberg format
   - Stores data in Parquet files
   - Integrates with REST Catalog

3. Apache Iceberg
   - Manages table metadata
   - Provides schema evolution
   - Supports time travel queries
   - REST Catalog integration

4. Apache Spark
   - Reads Parquet files
   - Performs data analysis
   - Provides SQL querying capabilities
   - Supports complex analytics

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

## Current Status

The pipeline is fully functional with the following features implemented:

1. **Data Synchronization**
   - MySQL to Iceberg sync working via OLake
   - Schema discovery using OLake's discover command
   - Real-time data synchronization using OLake's sync command

2. **Data Storage**
   - Parquet file format
   - Iceberg table format
   - REST Catalog integration

3. **Data Analysis**
   - Spark SQL queries working
   - Complex aggregations supported
   - Real-time data access

4. **Sample Data**
   - 190 orders in the system
   - Multiple status types (COMPLETED, PENDING, SHIPPED)
   - Various total amounts

## Development

- The project uses Docker for consistent development environments
- Configuration files are mounted as volumes
- Data is persisted in the warehouse directory
- REST Catalog provides table management
- OLake ensures real-time data synchronization

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request
