# Dockerfile

A continuación, la explicación de cada comando del Dockerfile:

**FROM ubuntu ->** Descarga la imagen de ubuntu base.

**RUN apt update ->** Ejecuta el comando update para que se actualicen todos los ficheros del sistema y que todo quede al día.

**RUN apt install tzdata -y ->** Se instala los ficheros encargados de ajustar la hora y señalamos con "-y" que acepte todas las condiciones que nos proponga la instalación.

**ENV TZ="America/Bogota" ->** Se configura el tiempo ajustandolo a nuestra zona horaria, Bogotá.

**RUN apt install git -y ->** se instala todos los ficheros relacionados a git para clonar y modificar repositorios, y se aceptan todas las condiciones que proponga la instalación.

**RUN apt install apache2 -y ->** Se instala el servicio de apache2 para que se ejecute y se exponga de manera correcta el servicio web, y se aceptan todas las condiciones que proponga la instalación.

**RUN git clone https://github.com/Andercq17/pagina_prueba ->** Se clona con git el repositorio donde se encuentra la pagina realizada.

**RUN rm /var/www/html/index.html ->** como se instaló el servicio de apache2, entonces este viene con un archivo html por defecto llamado "index", entonces lo borramos para que no interfiera con los archivos clonados.

**RUN cp -r pagina_prueba/* /var/www/html/ ->** Se copian todos los archivos de la carpeta "pagina_prueba" los cuales son de la pagina que se va a exponer, y se trasladan a la zona donde se lee el index la cual es /var/www/html/

**EXPOSE 80 ->** Se expone el puerto 80 del contenedor para poder enlazarlo con el de la maquina.

**CMD apachectl -D FOREGROUND ->** Se le dice al contenedor que corra el servicio de apache2 en segundo plano, así nuestro contenedor estará ejecutando un proceso y no se nos cerrará cuando se corra el contenedor.
