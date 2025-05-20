## Activacion del entorno virtual en aws
El servidor en aws se tiene que depslegar en un entorno virtual estos son los comandos:

```shell
cd PI/server
python3 -m venv env
source env/bin/activate
```

## Instalación de dependencias

Para instalar las dependencias necesarias, ejecuta el siguiente comando en la terminal:

```shell
pip install flask python-socketio eventlet python-dotenv mysql-connector-python
```

Este comando instalará todos los paquetes requeridos para el funcionamiento del servidor.

## Ejecución del servidor

Una vez instaladas las dependencias y posicionado en el directorio del server, ejecuta el siguiente comando:

```shell
python index.py
```


## Ejecutar el script para que cree las tablas en la base de datos

Tenemos que irnos a la carpeta de server y en ella hacer estos dos comandos para activar el entorno virtual y ejecutar el script:

```shell
source env/bin/activate
python scripts/create_tables.py
```