FROM nginx:latest

USER root
RUN apk add --no-cache docker
USER jenkins

COPY index.html /usr/share/nginx/html
EXPOSE 80

