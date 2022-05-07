# Dockerfile

## Ejecución del Dockerfile

## 1.  Primero vamos a ejecutar el comando que construye la imagen del Dockerfile con su contexto y ese es el siguiente:
* sudo docker build -t [nombre]:[versión] [ubicación del dockerfile]

Un ejemplo sería el siguiente:

Si mi dockerfile está en la ubicación del directorio actual entonces basta con señalar ese directorio con un ".", si no lo está entonces se coloca la ruta del directorio

* ejemplo1: sudo docker build -t anderson:v01 .
* ejemplo2: sudo docker build -t anderson:v01 /home/


## 2. Después de tener ya construida nuestra imagen del dockerfile, entonces vamos a verificar que si se haya construido con el siguiente comando:
* sudo docker image ls

Deberá aparecer los tags con el que creaste la imagen, en este caso aparecería primero anderson y al lado v01

## 3. Una vez comprobemos que si está la imagen y todo salió bien, entonces corremos la imagen en un contenedor nuevo en modo demonio, es decir, en segundo plano.

Para correr un nuevo contenedor con la imagen que creamos, utilizamos el siguiente comando:
* sudo docker run [forma de ejecución] [parametro de puerto] [puerto maquina local]:[puerto expuesto en contenedor] [imagen a correr]

En este caso, nosotros lo vamos a correr en forma de demonio para que podamos seguir trabajando en nuestro servidor, también, como en el dockerfile se especificó que el contenedor se expusiera el puerto 80 entonces vamos a enlazar nuestro puerto 80 con el del contenedor y correremos la imagen que construimos anteriormente que fue para esta situación la llamada "anderson:v01"

Dicho lo anterior, la forma de ejecución de la imagen en un nuevo contenedor quedó con el siguiente comando:
* **sudo docker run -d -p 80:80 anderson:v01**
----------------------------------------------------------------------------------------------------------------------------------------------

A continuación, la explicación de cada comando del Dockerfile:

**FROM ubuntu** 
* Descarga la imagen de ubuntu base.

**RUN apt update** 
* Ejecuta el comando update para que se actualicen todos los ficheros del sistema y que todo quede al día.

**RUN apt install tzdata -y** 
* Se instala los ficheros encargados de ajustar la hora y señalamos con "-y" que acepte todas las condiciones que nos proponga la instalación.

**ENV TZ="America/Bogota"** 
* Se configura el tiempo ajustandolo a nuestra zona horaria, Bogotá.

**RUN apt install git -y** 
* se instala todos los ficheros relacionados a git para clonar y modificar repositorios, y se aceptan todas las condiciones que proponga la instalación.

**RUN apt install apache2 -y** 
* Se instala el servicio de apache2 para que se ejecute y se exponga de manera correcta el servicio web, y se aceptan todas las condiciones que proponga la instalación.

**RUN git clone https://github.com/Andercq17/pagina_prueba** 
* Se clona con git el repositorio donde se encuentra la pagina realizada.

**RUN rm /var/www/html/index.html** 
* Como se instaló el servicio de apache2, entonces este viene con un archivo html por defecto llamado "index", entonces lo borramos para que no interfiera con los archivos clonados.

**RUN cp -r pagina_prueba/\* /var/www/html/** 
* Se copian todos los archivos de la carpeta "pagina_prueba" los cuales son de la pagina que se va a exponer, y se trasladan a la zona donde se lee el index la cual es /var/www/html/

**EXPOSE 80** 
* Se expone el puerto 80 del contenedor para poder enlazarlo con el de la maquina.

**CMD apachectl -D FOREGROUND** 
* Se le dice al contenedor que corra el servicio de apache2 en segundo plano, así nuestro contenedor estará ejecutando un proceso y no se nos cerrará cuando se corra el contenedor.
