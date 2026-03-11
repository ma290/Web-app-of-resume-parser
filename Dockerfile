FROM nginx:alpine

COPY widget/index.html /usr/share/nginx/html/index.html
COPY admin/index.html /usr/share/nginx/html/admin/index.html

RUN printf 'server {\n\
    listen ${PORT:-8000};\n\
    root /usr/share/nginx/html;\n\
    index index.html;\n\
    location = / { try_files /index.html =404; }\n\
    location = /admin { try_files /admin/index.html =404; }\n\
    location = /admin/ { try_files /admin/index.html =404; }\n\
}\n' > /etc/nginx/templates/default.conf.template

EXPOSE 8000

CMD ["/docker-entrypoint.sh", "nginx", "-g", "daemon off;"]
