import os
from dotenv import load_dotenv
from sling import Replication, ReplicationStream

# Load environment variables
load_dotenv()

def ingest_data():
    """
    Perform data replication from PostgreSQL to DuckDB using Sling
    
    Returns:
    -------
    None
    """
    # Define the source database
    source = os.getenv("SLING_SOURCE_POSTGRES")
    # Define the target database
    target = os.getenv("SLING_TARGET_DUCKDB")
    
    # Validate source and target are not None
    if not source:
        raise ValueError("SLING_SOURCE_POSTGRES environment variable is not set")
    if not target:
        raise ValueError("SLING_TARGET_DUCKDB environment variable is not set")
    
    # Define the source schema.table
    tables = [
        'production.products',
        'production.brands',
        'production.categories',
        'production.stocks',
        'sales.customers',
        'sales.order_items',
        'sales.orders',
        'sales.staffs',
        'sales.stores'
    ]
    
    # Create streams for each table
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