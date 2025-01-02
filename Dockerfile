# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Set environment variable to disable Python output buffering
# Ensures logs and print statements appear in real-time
ENV PYTHONUNBUFFERED=1  

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install debugpy  # Install debugpy for VS Code remote debugging

# Expose port 5000 for Flask app and 5678 for the debugger
EXPOSE 5000
EXPOSE 5678

# Run the application
#CMD ["python", "app.py"]
# Run the application with debugpy
CMD ["python", "-m", "debugpy", "--listen", "0.0.0.0:5678", "app.py"]
