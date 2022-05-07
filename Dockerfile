FROM ubuntu
RUN apt update
RUN apt install tzdata -y
ENV TZ="America/Bogota"
RUN apt install git -y
RUN apt install apache2 -y
RUN git clone https://github.com/Andercq17/pagina_prueba
RUN rm /var/www/html/index.html
RUN cp -r pagina_prueba/* /var/www/html/
EXPOSE 80
CMD apachectl -D FOREGROUND
