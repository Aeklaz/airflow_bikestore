# Use an official Node.js runtime as a parent image
FROM node:20-slim

# Set the working directory in the container
WORKDIR /opt/evidence

# Install system dependencies
RUN apt-get update && apt-get install -y \
    bash \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy package.json and package-lock.json (if exists)
COPY evidence/package*.json ./

# Install npm dependencies
RUN npm install

# Copy the rest of the project files
#COPY evidence/ .

# Expose the port the app runs on
EXPOSE 3000

# Default command to run the application
#CMD ["bash", "-c", "npm run sources && npm run dev -- --host 0.0.0.0"]