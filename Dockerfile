# Use an official Python runtime as a parent image
FROM python:3.11-slim-buster

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install the Python dependencies (matching what you pip installed)
RUN pip install \
    fastapi \
    uvicorn \
    google-agent-development-kit \
    google-cloud-bigquery \
    google-cloud-storage \
    google-cloud-aiplatform \
    google-api-python-client \
    google-auth-httplib2 \
    google-auth-oauthlib \
    python-dotenv \
    functions-framework

# Expose the port that the app runs on
EXPOSE 8080

# Run the application using Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
