FROM nginx

RUN rm /etc/nginx/conf.d/default.conf
RUN touch /var/run/libra-django_site.sock
COPY uwsgi_params /etc/nginx/django_site/nginx/
COPY django_site_nginx.conf /etc/nginx/conf.d/
