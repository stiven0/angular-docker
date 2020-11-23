![docker_angular_nginx](https://miro.medium.com/max/900/1*Cc1X8aWvAXyEwEhuNWZp9g.png)

# Ejemplo basico sobre integracion de Angular y Docker montado sobre nginx

## Primero descarguen o clonen el repositorio
```
git clone https://github.com/stiven0/angular-docker.git
```

## Ahora asegurese de tener [docker](https://docs.docker.com/get-docker/) instalado y corra los siguientes comandos
```
docker build -t angular-docker .
docker run -d -p 80:80 angular-docker
```

### Ahora abra el localhost en el navegador y vera la aplicacion de Angular funcionando sobre nginx y docker, ahora considere los siguientes puntos:

- En el archivo ``nginx-config`` encontrara la configuracion basica de nginx para trabajar en este caso con Angular (router y renderizado)

- En el archivo Dockerfile por supuesto tendra la configuracion para crear la imagen de Docker y a su vez la integracion con ``nginx`` 
