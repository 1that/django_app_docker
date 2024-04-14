FROM alpine:3.19.1
RUN apk add python3 py3-pip && \
    pip install --no-cache-dir --upgrade pip setuptools --break-system-packages
COPY /project/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt --break-system-packages && \
    rm -rf /var/cache/apk/*
WORKDIR /project
COPY /project .
USER 1000:1000
CMD python3 manage.py migrate && \
    python3 manage.py runserver 0.0.0.0:8000
