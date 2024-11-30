# Orchestration

Orchestration is a critical part of our data pipeline, ensuring that tasks are executed in the correct order and dependencies are managed effectively. We use Apache Airflow to orchestrate our dbt jobs and other components, providing a robust and scalable solution.

The Airflow DAG (Directed Acyclic Graph) demonstrates the orchestration of the data pipeline. Here's a breakdown of the key components:

- The DAG is named **`dbt_sling_dag`** and is set to start on the current date, with no catchup behavior.
- **Tasks:**
  1. **ingest_data**:  
     A Python Operator that calls the `ingest_data()` function from the `plugins.ingest_data` module. This task ingests data from the PostgreSQL database to the DuckDB data warehouse using the Sling tool.
  2. **dbt_run**:  
     A Bash Operator that executes the `dbt run` command inside the `/opt/dbt` directory. This task runs the dbt models to transform and load the data into the desired schema.
  3. **backup_to_s3**:  
     A Python Operator that calls the `backup_duckdb_to_s3()` function from the `plugins.backup_duckdb_to_s3` module. This task creates a backup of the DuckDB database and uploads it to an S3 bucket.

The tasks are connected sequentially:
- **`ingest_data`** → **`dbt_run`** → **`backup_to_s3`**

This ensures that the data is first ingested, then transformed and finally backed up to S3 for safekeeping. By using Airflow to orchestrate these tasks, the data pipeline becomes more robust, scalable, and maintainable, allowing for easy monitoring, scheduling, and failure handling.
