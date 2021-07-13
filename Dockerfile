# FROM python base image
 FROM python:2-alpine
 # COPY startup script
 RUN wget  https://github.com/secfigo/django.nv/archive/1.1.zip  /app
 WORKDIR /app
 RUN apk add --no-cache gawk sed bash grep bc coreutils
 RUN pip install -r requirements.txt
 RUN chmod +x reset_db.sh && bash reset_db.sh
 # EXPOSE port 8000 for communication to/from server
 EXPOSE 8000
 # CMD specifcies the command to execute container starts running.
 CMD ["/app/run_app_docker.sh"]