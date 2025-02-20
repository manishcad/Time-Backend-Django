# Use official Python image
FROM python:3.10

# Set the working directory
WORKDIR /app

# Copy project files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run migrations
RUN python manage.py migrate

# Expose port 8000
EXPOSE 8000

# Start Gunicorn server
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "Test.wsgi:application"]
