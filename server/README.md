El servidor en aws se tiene que depslegar en un entorno virtual estos son los comandos:
cd PI/server
python3 -m venv env
source env/bin/activate

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