# Modern Data Stack

The modern data stack is currently a trendy analytics architecture that highlights the type of abstraction we expect to see more widely used over the next several years [Reis et al 2022]. Whereas past data stacks relied on expensive, monolithic toolsets, the main objective of the modern data stack is to use cloud-based, plug-and-play, easy-to-use, off-the-shelf components to create a modular and cost-effective data architecture [Reis et al 2022].

We can describe the modern data stack components by describing the component of the data pipline:

- **Ingestion**: The ingestion layer is responsible for extracting data from source systems and loading it into a data warehouse. Various tools can be used for data ingestion, such as Fivetran, data load tool, Airbyte, Sling and others.

- **Storage**: The storage layer is responsible for storing the data in a data warehouse. The data warehouse is a system that is used to store and analyze large amounts of data. Examples of data warehouses are Amazon Redshift, Google BigQuery, and Snowflake, Duckdb, Clickhouse, and others.

- **Transformation**: The transformation layer is responsible for transforming the data into a format that is suitable for analysis. The transformation layer is used to clean, enrich, and aggregate the data. Various tools can be used for data transformation, such as dbt, apache spark, pandas and many others.

- **Orchestration**: The orchestration layer is responsible for scheduling and monitoring the data pipeline. The orchestration layer is used to run the data pipeline on a regular basis, to monitor the data pipeline for errors, and to alert the data engineering team when errors occur. Various tools can be used for data orchestration, such as Apache Airflow, Prefect, Dagster, and others.

- **Serving**: The serving layer is responsible for serving the data to end users. The serving layer is used to build dashboards, reports, and data products that allow end users to interact with the data. Various tools can be used for data serving, such as Looker, Tableau, PowerBI, Metabase, and others.

## Chosen Stack

The stack chosen in this project is open source and free to use, so you can use it in your projects without any cost. The stack is composed by the following tools:

- **Ingestion**: [Sling](https://slingdata.io/)
- **Storage**: [Duckdb](https://duckdb.org/)
- **Transformation**: [dbt](https://www.getdbt.com/)
- **Orchestration**: [Airflow](https://airflow.apache.org/)
- **Serving**: [Evidence](https://evidence.dev/)
