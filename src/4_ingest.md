# Ingestion

The first step is to extract the data from postgres database and load it to Duckdb data warehouse.
we use Sling extraction tool to do this proccess:
By defining the source and target databases, along with the specific tables to be extracted, Sling creates individual replication streams for each table. This allows for a full-refresh approach, ensuring the DuckDB database is populated with the latest data from the PostgreSQL source. The Sling replication process is further enhanced by automatically generating hash IDs and loading timestamps for each record, providing valuable metadata for downstream data processing and analysis.
