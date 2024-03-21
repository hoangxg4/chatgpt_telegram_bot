# Use an official Ubuntu runtime as a parent image
FROM ubuntu:latest

# Install Docker and Docker Compose
RUN apt-get update \
    && apt-get install -y \
        docker.io \
        docker-compose \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the contents of the current directory into the container at /app
COPY . /app

# Set the entrypoint to run the docker-compose command with the provided env file
ENTRYPOINT ["docker-compose", "--env-file", "config/config.env", "up", "--build"]
