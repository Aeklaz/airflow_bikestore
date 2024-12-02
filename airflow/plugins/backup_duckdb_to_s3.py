import os
import boto3
from datetime import datetime
import logging

def backup_duckdb_to_s3():
    """
    Backup DuckDB database to S3 with timestamp
    
    Requires AWS credentials and environment variables:
    - DUCKDB_BACKUP_PATH: Local path to the DuckDB database
    - S3_BACKUP_BUCKET: S3 bucket name for backups
    - S3_BACKUP_PREFIX: Optional S3 prefix/folder 
    """
    # Configure logging
    logging.basicConfig(level=logging.INFO, 
                        format='%(asctime)s - %(levelname)s - %(message)s')
    logger = logging.getLogger(__name__)

    try:
        # Retrieve environment variables
        duckdb_path = os.getenv('DUCKDB_BACKUP_PATH')
        s3_bucket = os.getenv('S3_BACKUP_BUCKET')
        s3_prefix = os.getenv('S3_BACKUP_PREFIX')
        evidence_path = os.getenv('EVIDENCE_PATH')

        # Validate required environment variables
        if not s3_bucket:
            raise ValueError("S3_BACKUP_BUCKET environment variable is not set")

        # Create timestamp for backup filename
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        backup_filename = f"dev_duckdb_backup_{timestamp}.duckdb"
        local_backup_path = f"/tmp/{backup_filename}"
        

        # Create a local backup copy
        import shutil
        shutil.copy2(duckdb_path, local_backup_path)
        shutil.copy2(duckdb_path, evidence_path)
        logger.info(f"Local backup created at {local_backup_path}")
        logger.info(f"evidence dashboard copy created at {evidence_path}")

        # Initialize S3 client
        s3_client = boto3.client('s3')

        # Upload to S3
        s3_key = f"{s3_prefix}{backup_filename}"
        s3_client.upload_file(local_backup_path, s3_bucket, s3_key)
        logger.info(f"Backup uploaded to s3://{s3_bucket}/{s3_key}")

        # Optional: Remove local temporary backup
        os.remove(local_backup_path)
        logger.info("Temporary local backup removed")

    except Exception as e:
        logger.error(f"Backup failed: {str(e)}")
        raise