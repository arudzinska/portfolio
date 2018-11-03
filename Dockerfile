# Start with a Python image.
FROM python:3.6

MAINTAINER Ania

# Ensure that Python outputs everything that's printed inside
# the application rather than buffering it.
ENV PYTHONUNBUFFERED 1

# Set timezone
RUN ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime

# Install some necessary things.
RUN apt update && apt install -y \
  dpkg-dev \
  libssl-dev \
  netcat \
  swig \
  vim

# Local directory with project source and requirements
ENV APP_SRC="portfolio"
ENV APP_REQ="."
# Directory in container for project source files
ENV APP_OPTPROJ="/opt/app"
ENV CONFIG_FILE="$APP_OPTPROJ/portfolio/config.json"

# Create operation directory
RUN mkdir -p $APP_OPTPROJ
RUN mkdir -p $APP_OPTPROJ/log
WORKDIR $APP_OPTPROJ

# Copy requirements.txt and code and init data
COPY $APP_REQ/requirements.txt $APP_OPTPROJ/requirements.txt
COPY $APP_SRC $APP_OPTPROJ
RUN chmod 740 $APP_OPTPROJ/manage.py

# Install the requirements.
RUN pip3 install -U pip && pip3 install -Ur $APP_OPTPROJ/requirements.txt --timeout 30

# Port to expose
EXPOSE 8000

COPY ./docker_entrypoint.sh /

# Specify the command to run when the image is run.
# ENTRYPOINT /docker_entrypoint.sh

# Startup the app
CMD gunicorn portfolio.wsgi:application \
    --bind 0.0.0.0:8000 \
    --workers 3


