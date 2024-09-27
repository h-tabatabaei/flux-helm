# Dockerfile
FROM nginx:latest

# Copy your custom index.html to the default NGINX html directory
COPY ./html/index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80
