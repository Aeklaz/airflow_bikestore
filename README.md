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
pip install -e .'[dev]'
```
Most of the dependencies will be installed through Python.

For Evidence.dev, you will need [nodejs](https://nodejs.org/en/download) installed

Install [Sling] via Python pip for getting data from Postgres.

```
# On Mac, view the website for other platforms
brew install slingdata-io/sling/sling
```

## Visualization

Evidence.dev is used for visualization.

First, go the `dbt_bikestore` folder

```
cd dbt_bikestore

npm --prefix ./reports install
npm --prefix ./reports run dev -- --port 4000
```

