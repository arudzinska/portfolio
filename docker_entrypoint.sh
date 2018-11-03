#!/bin/bash

# Start Gunicorn processes
echo "Starting Gunicorn."
exec gunicorn portfolio.wsgi:application \
    --config /opt/django/portfolio/conf/gunicorn.conf \
    --bind 0.0.0.0:8000 \
    --workers 3 \
    --log-level=info \
    --log-file=/opt/django/qing_solutions/log/gunicorn.log \
    --access-logfile=/opt/django/qing_solutions/log/access.log \
    "$@"
