# Use an official lightweight Python base image
FROM python:3.11-slim

# Prevents Python from writing .pyc files and buffers  
ENV PYTHONDONTWRITEBYTECODE=1  
ENV PYTHONUNBUFFERED=1

# Set working directory in container  
WORKDIR /app

# Copy only requirements first (to leverage Docker cache)  
COPY requirements.txt .

# Install dependencies  
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code  
COPY . .

# Expose the port your Flask app uses  
EXPOSE 5000

# Command to run the app  
CMD ["python", "run.py"]
