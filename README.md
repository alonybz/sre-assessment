# SRE Assessment

## Overview

This project demonstrates the implementation of a monitoring stack using Docker Compose and Prometheus as part of an SRE interview assessment.

### Objectives

1. Generate an input CSV file using the provided script
2. Configure and run a service stack using Docker Compose
3. Add Prometheus as a metrics collector
4. Start the environment and verify that Prometheus is scraping the target
5. Produce or visualize at least one metric in the Prometheus dashboard
6. (Optional) Implement a CI/CD workflow if additional time remains

## Project Structure

```
.
├── gencsv.sh
├── inputFile
├── docker-compose.yml
├── prometheus.yml
└── csvserver.env
```

## Implementation Guide

### Step 1: Generate the CSV Input File

Execute the script to generate the required input file:

```bash
./gencsv.sh START END
```

This file serves as the data source for the CSV server component.

### Step 2: Configure Docker Compose

Update the `docker-compose.yml` file to include a Prometheus service. Ensure that:
- Prometheus loads the `prometheus.yml` configuration file
- The service can establish connectivity to the csvserver target

### Step 3: Deploy the Environment

Start all services using Docker Compose:

```bash
docker-compose up -d
```

Verify that all containers are running successfully.

### Step 4: Prometheus Access and Validation

Access the Prometheus web interface:

```
http://0.0.0.0:<port>
```

Navigate to the **Targets** section to confirm that the service is being properly scraped and monitored.

### Step 5: Metrics Visualization

Utilize the Prometheus dashboard to query and visualize at least one metric from the monitored service.

## Optional Enhancement: CI/CD Pipeline

If time permits, implement a GitHub Actions workflow that includes:

- Shell script linting and validation
- Docker Compose file validation
- Additional quality assurance checks

## Requirements

- Docker
- Docker Compose
- Basic understanding of Prometheus configuration