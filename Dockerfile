FROM nginx:alpine

# Copy widget (served at /widget.js and /)
COPY widget/index.html /usr/share/nginx/html/index.html

# Copy admin panel
COPY admin/index.html /usr/share/nginx/html/admin/index.html

# Nginx config for Koyeb port 8000
RUN printf 'server {\n\
    listen 8000;\n\
    root /usr/share/nginx/html;\n\
    index index.html;\n\
    location / { try_files $uri $uri/ /index.html; }\n\
    location /admin { try_files $uri $uri/ /admin/index.html; }\n\
}\n' > /etc/nginx/conf.d/default.conf

EXPOSE 8000

CMD ["nginx", "-g", "daemon off;"]
