import pendulum

from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.python import PythonOperator

from plugins.ingest_data import ingest_data
from plugins.backup_duckdb_to_s3 import backup_duckdb_to_s3


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


# Set dbt command to run inside the container
dbt_path = "/opt/dbt"
bash_command=f"cd {dbt_path} && dbt run --profiles-dir ." # run the model

dbt_task = BashOperator(
    task_id='dbt_run',
    bash_command=bash_command,
    dag=dag
)

# Set the backup task to upload a copy of duckdb database with timestamp to s3
backup_task = PythonOperator(
    task_id='backup_to_s3',
    python_callable=backup_duckdb_to_s3,
    dag=dag
)

# Serve the dashboards from the container
dashboard_task = BashOperator(
    task_id = "dashboard_start",
    bash_command='''cd /opt/evidence && npm install && npm run sources && npm run dev -- --host 0.0.0.0
                    ''',
    dag=dag
)

sling_task >> dbt_task >> backup_task >> dashboard_task


