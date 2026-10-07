# CI-CD-Assignment

A containerized Flask application that provides system host information and health check endpoints. This project demonstrates a complete CI/CD pipeline setup with Docker and GitHub Actions deployment automation.

## Overview

**CI-CD-Assignment** is a lightweight REST API built with Flask that exposes system information including hostname, platform details, Python version, and CPU count. The application is fully containerized and ready for deployment using Docker and Docker Compose.

## Features

-  **RESTful API** - Simple Flask-based HTTP endpoints
-  **Host Information** - Retrieve system and platform details
-  **Health Check** - Built-in health check endpoint
-  **Docker Ready** - Includes Dockerfile and docker-compose configuration
-  **CI/CD Pipeline** - GitHub Actions integration for automated deployment

## Tech Stack

- **Language**: Python 3.12
- **Framework**: Flask 3.1.2
- **Containerization**: Docker
- **Orchestration**: Docker Compose
- **CI/CD**: GitHub Actions

## Project Structure

```
├── hostinfo.py                 # Main Flask application
├── requirements.txt            # Python dependencies
├── Dockerfile                  # Docker image configuration
├── docker-compose.yml          # Docker Compose setup
├── github-actions-deploy       # SSH private key for deployment
├── github-actions-deploy.pub   # SSH public key for deployment
├── .gitignore                  # Git ignore rules
└── .github/                    # GitHub Actions workflows
```

## API Endpoints

### 1. Host Information Endpoint

**GET** `/`

Returns comprehensive host and system information.

**Response Example:**
```json
{
  "message": "Host Information API by Abdullah",
  "hostname": "server-name",
  "platform": "Linux-5.15.0-x86_64-with-glibc2.31",
  "system": "Linux",
  "release": "5.15.0",
  "architecture": "x86_64",
  "python_version": "3.12.0",
  "cpu_count": 4
}
```

### 2. Health Check Endpoint

**GET** `/health`

Returns the health status of the application.

**Response Example:**
```json
{
  "status": "healthy"
}
```

## Installation & Setup

### Prerequisites

- Docker >= 20.10
- Docker Compose >= 1.29
- Python >= 3.12 (for local development)

### Local Development Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/AbdullahMLOps-cloud/CI-CD-Assignment.git
   cd CI-CD-Assignment
   ```

2. **Create a virtual environment:**
   ```bash
   python3 -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

4. **Run the application:**
   ```bash
   python hostinfo.py
   ```

   The API will be available at `http://localhost:8080`

## Docker Setup

### Using Docker Directly

1. **Build the Docker image:**
   ```bash
   docker build -t hostinfo:latest .
   ```

2. **Run the container:**
   ```bash
   docker run -p 8080:8080 hostinfo:latest
   ```

### Using Docker Compose

1. **Start the service:**
   ```bash
   docker-compose up -d
   ```

2. **Stop the service:**
   ```bash
   docker-compose down
   ```

The API will be available at `http://localhost:8080`

## Configuration

### Environment Variables

- **PYTHONDONTWRITEBYTECODE=1** - Prevents Python from creating `.pyc` files
- **PYTHONUNBUFFERED=1** - Ensures Python output is immediately flushed to stdout

### Docker Compose Configuration

- **Image**: `abiengineer/hostinfo:latest`
- **Container Name**: `hostinfo`
- **Port Mapping**: `8080:8080`
- **Restart Policy**: `unless-stopped`

## Testing the Application

### Using cURL

```bash
# Get host information
curl http://localhost:8080/

# Check health status
curl http://localhost:8080/health
```

### Using Python Requests

```python
import requests

response = requests.get('http://localhost:8080/')
print(response.json())
```

## CI/CD Pipeline

This repository includes GitHub Actions workflows for automated deployment. The pipeline is configured to:

- Automatically trigger on code changes
- Build and push Docker images
- Deploy to target infrastructure using SSH keys

**SSH Keys Configuration:**
- Private key: `github-actions-deploy`
- Public key: `github-actions-deploy.pub`

These keys are used for secure authentication during deployment workflows.

## Dependencies

| Package | Version |
|---------|---------|
| Flask | 3.1.2 |
| Python | 3.12 |

See `requirements.txt` for complete dependency list.

## Docker Image Details

**Base Image**: `python:3.12-slim`

**Size**: Optimized using slim Python image for minimal footprint

**Exposed Port**: 8080

**Health Check**: `/health` endpoint available for monitoring

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Author

**Abdullah**

GitHub: [@AbdullahMLOps-cloud](https://github.com/AbdullahMLOps-cloud)

## License

This project is currently unlicensed. See the repository for more information.

## Support

For issues, questions, or suggestions, please open an issue on the [GitHub Issues](https://github.com/AbdullahMLOps-cloud/CI-CD-Assignment/issues) page.

---

**Status**: Active Development | **Repository**: Public | **Created**: October 2026
