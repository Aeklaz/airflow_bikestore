import json
import pendulum

from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.python import PythonOperator
from sling import Replication, ReplicationStream


def ingest_data():
# Define the source database
    source = "postgresql://postgres:1234@postgres:5432/bikestore?sslmode=disable"

    # Define the target database
    target = "duckdb:///opt/dbt/target/dev.duckdb"


    # Define the source schema.table
    tables = ['production.products', 'production.brands', 'production.categories', 'production.stocks',
              'sales.customers', 'sales.order_items', 'sales.orders', 'sales.staffs', 'sales.stores'
              ]

    streams = {}
    for table in tables:
        streams[table] = ReplicationStream(mode='full-refresh', object=table, primary_key='hash_id')

    # Initialize replication
    replication = Replication(
        source=source,
        target=target,
        streams=streams,
        env=dict(SLING_STREAM_URL_COLUMN='true', SLING_LOADED_AT_COLUMN='true'),
        debug=True
    )

# Run replication
    
    replication.run()


dbt_path = "/opt/dbt"
manifest_path = "/opt/dbt/target/manifest.json"

with open(manifest_path) as f:
    manifest = json.load(f)
    nodes = manifest["nodes"]


dag =  DAG(
    dag_id = "dbt_sling_dag",
    start_date=pendulum.today(),
    catchup=False,
) 
    # sling script to ingest data from postgres to duckdb
sling_task = PythonOperator(
    task_id='ingest_data',
    python_callable=ingest_data,
    dag=dag,
)

bash_command=f"cd {dbt_path} && dbt run --profiles-dir ." # run the model


dbt_task = BashOperator(
    task_id='dbt_run',
    bash_command=bash_command
)

sling_task >> dbt_task


