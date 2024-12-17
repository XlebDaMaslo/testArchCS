FROM nginx:latest
COPY index.html /usr/share/nginx/html
EXPOSE 80

USER root
RUN apk add --no-cache docker
USER jenkins
