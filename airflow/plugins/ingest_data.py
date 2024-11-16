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