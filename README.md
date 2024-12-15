## Open Source pipeline

This stack is built on a combination of tools including:

- [Airflow](https://airflow.apache.org/)
- [DuckDB](https://duckdb.org)
- [dbt](https://www.getdbt.com)
- [dbt-duckdbt](https://github.com/jwills/dbt-duckdb)
- [Evidence](https://evidence.dev)
- [Sling](https://slingdata.io)

## Requirements

You will need Python installed. This was all tested on Python 3.10.12
From a virtual environment, run

```python
pip install -r requirements.txt
```
Most of the dependencies will be installed through Python.


## Building the images
Build the airflow image
Build the evidence.Dockerfile image 

```
docker build -t airflow_bikestore .
docker build -f evidence.Dockerfile -t evidence_image .
```
## Run the pipeline
```
docker-compose up
```


