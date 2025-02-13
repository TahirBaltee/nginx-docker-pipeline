#Base Image
FROM nginx:latest

#Copy custom index.html
COPY index.html usr/share/nginx/html/index.html

EXPOSE 80
