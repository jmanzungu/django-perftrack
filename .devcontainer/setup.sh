#!/bin/bash

# Start PostgreSQL service
sudo service postgresql start

# Create database and user
sudo -u postgres psql -c "CREATE USER perftrack WITH PASSWORD 'perftrack';"
sudo -u postgres psql -c "CREATE DATABASE perftrack OWNER perftrack;"

# Run database migrations
python manage.py migrate

# Create superuser
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin', 'admin@example.com', 'admin123')" | python manage.py shell

# Collect static files
python manage.py collectstatic --noinput
