# swagger-mock-api

## Getting Started

# Build

```bash
git clone --depth=1 https://github.com/locol23/swagger-mock-api
cd swagger-mock-api
docker build -t mock .
```

# Run

```bash
docker run -p 8080:8080 -d mock
```

Go to http://localhost:8080/docs/

# Stop

```bash
docker kill $(docker ps -q)
```
