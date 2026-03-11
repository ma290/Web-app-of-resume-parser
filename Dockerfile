FROM nginx:alpine

COPY widget/index.html /usr/share/nginx/html/index.html
COPY admin/index.html /usr/share/nginx/html/admin/index.html

RUN printf 'server {\n\
    listen 8000;\n\
    root /usr/share/nginx/html;\n\
    index index.html;\n\
\n\
    location = / {\n\
        try_files /index.html =404;\n\
    }\n\
\n\
    location = /admin {\n\
        try_files /admin/index.html =404;\n\
    }\n\
\n\
    location = /admin/ {\n\
        try_files /admin/index.html =404;\n\
    }\n\
}\n' > /etc/nginx/conf.d/default.conf

EXPOSE 8000

CMD ["nginx", "-g", "daemon off;"]
