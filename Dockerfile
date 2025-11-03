FROM python:3.9

ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1
WORKDIR /app/backend

# system packages needed for mysqlclient
RUN apt-get update \
 && apt-get install -y --no-install-recommends gcc default-libmysqlclient-dev pkg-config \
 && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/backend/requirements.txt
RUN pip install --upgrade pip \
 && pip install --no-cache-dir -r requirements.txt

COPY . /app/backend
EXPOSE 8000

CMD python /app/backend/manage.py runserver 0.0.0.0:8000

# FROM python:3.9

# WORKDIR /app/backend

# COPY requirements.txt /app/backend
# RUN pip install -r requirements.txt

# COPY . /app/backend

# EXPOSE 8000

# CMD python /app/backend/manage.py runserver 0.0.0.0:8000


# FROM python:3.9

# WORKDIR /app/backend

# COPY requirements.txt /app/backend
# RUN apt-get update \
#     && apt-get upgrade -y \
#     && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
#     && rm -rf /var/lib/apt/lists/*


# # Install app dependencies
# RUN pip install mysqlclient
# RUN pip install --no-cache-dir -r requirements.txt

# COPY . /app/backend

# EXPOSE 8000
# # RUN python manage.py migrate
# # RUN python manage.py makemigrations
# # CMD python /app/backend/manage.py runserver 0.0.0.0:8000
# # EXPOSE 8000
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
# # FROM python:3.9

# # WORKDIR /app/backend

# # COPY requirements.txt .
# # RUN apt-get update \
# #   && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
# #   && rm -rf /var/lib/apt/lists/*
# # RUN pip install --no-cache-dir mysqlclient \
# #   && pip install --no-cache-dir -r requirements.txt

# # COPY . .

# # EXPOSE 8000
# # CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
