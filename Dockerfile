FROM nginx:alpine

# Copy web app
COPY index.html /usr/share/nginx/html/index.html

# HuggingFace Spaces uses port 7860
RUN sed -i 's/listen       80;/listen       7860;/' /etc/nginx/conf.d/default.conf

EXPOSE 7860

CMD ["nginx", "-g", "daemon off;"]
