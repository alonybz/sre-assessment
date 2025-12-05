# SRE Assessment

## Overview

This project demonstrates the implementation of a comprehensive monitoring stack using Docker Compose, Prometheus, and Grafana as part of an SRE interview assessment.

### Objectives

1. Generate an input CSV file using the provided script
2. Configure and run a service stack using Docker Compose
3. Add Prometheus as a metrics collector and Grafana for visualization
4. Start the environment and verify that Prometheus is scraping the target
5. Create a basic dashboard in Grafana to visualize metrics
6. Demonstrate monitoring and observability best practices
7. (Optional) Implement a CI/CD workflow if additional time remains

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
./gencsv.sh 0 100
```

This file serves as the data source for the CSV server component.

### Step 2: Deploy the Environment

Start all services using Docker Compose:

```bash
docker-compose up -d
```

This will start:
- **CSV Server** on port 9393
- **Prometheus** on port 9090
- **Grafana** on port 3000

Verify that all containers are running successfully:

```bash
docker-compose ps
```

### Step 3: Prometheus Validation

Access the Prometheus web interface:

```
http://localhost:9090
```

Navigate to **Status → Targets** to confirm that the CSV server is being properly scraped and shows as "UP".

### Step 4: Grafana Dashboard

1. Access Grafana: http://localhost:3000 (admin/admin)
2. Add Prometheus data source: http://prometheus:9090
3. Create dashboard with query: `up{job="csvserver"}`

## Optional Enhancement: CI/CD Pipeline

If time permits, implement a GitHub Actions workflow that includes:

- Shell script linting and validation
- Docker Compose file validation
- Prometheus configuration validation
- Additional quality assurance checks

## Key Demonstration Points

- **Observability Stack**: Complete metrics collection and visualization
- **Service Discovery**: Automatic target detection by Prometheus
- **Dashboard Creation**: Custom metrics visualization in Grafana
- **Container Orchestration**: Multi-service Docker Compose setup
- **Configuration Management**: Externalized configuration files
- **Monitoring Best Practices**: Health checks and metric exposition

## Requirements

- Docker
- Docker Compose
- Basic understanding of Prometheus and Grafana
- PromQL query knowledge (basic)