FROM apache/airflow

USER root

RUN apt-get update\
    && apt-get -y install git \
    && apt-get clean

# Install Node.js and npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# Verify installation
RUN node -v && npm -v

COPY requirements.txt requirements.txt


USER airflow

RUN pip install --no-cache-dir -r requirements.txt
