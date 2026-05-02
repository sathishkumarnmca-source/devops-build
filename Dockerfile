FROM nginx:alpine

# Copy the built files to Nginx's default public directory
COPY ./usr/share/nginx/html

# Expose the port Nginx listens on (default is 80)
EXPOSE 80

# Command to start Nginx
CMD ["nginx", "-g", "daemon off;"]
