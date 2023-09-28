# IBM MQ

Es middleware de mensajería y gestión de colas

## Uso

### Creación gestor de colas (Servidor)

Para poder generar el servidor a partir del Dockerfile, se necesita seguir los siguientes pasos:

#### Generación de la imágen

```bash
$ docker build -t ibm-mq-queue-manager:0.1.0 .
```

#### Ejecución del contenedor

```bash
$ docker run --name queue-manager -p 1414:1414 -p 9443:9443 ibm-mq-queue-manager:0.1.0
```

#### Administrar contenedor

```bash
$ docker exec -it queue-manager /bin/bash
```

```bash
$ runmqsc
```

```bash
$ DEFINE QLOCAL(DEV.MSGQ)
$ DISPLAY QLOCAL(DEV.MSGQ)
```

### Consumo desde un cliente REST

Desde un software de peticiones http, enviar las distintas solicitudes para manejo de colas

```bash
$ curl -k https://localhost:9443/ibmmq/rest/v1/messaging/qmgr/QM1/queue/DEV.MSGQ/message -X POST -u app:1234 -H "ibm-mq-rest-csrf-token: value" -H "Content-Type: text/plain;charset=utf-8" --data "Hello World!"
```

```bash
$ curl -k https://localhost:9443/ibmmq/rest/v1/messaging/qmgr/QM1/queue/DEV.MSGQ/message -X POST -u app:1234 -H "ibm-mq-rest-csrf-token: value" -H "Content-Type: text/plain;charset=utf-8" --data "Hello World!"
```

```bash
$ curl -k https://localhost:9443/ibmmq/rest/v1/messaging/qmgr/QM1/queue/DEV.MSGQ/message -u app:1234
```

```bash
$ curl -k https://localhost:9443/ibmmq/rest/v1/messaging/qmgr/QM1/queue/DEV.MSGQ/message -X DELETE -u app:1234 -H "ibm-mq-rest-csrf-token: value"
```
