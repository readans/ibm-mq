FROM icr.io/ibm-messaging/mq
ENV LICENSE accept
ENV MQ_QMGR_NAME QM1
ENV MQ_APP_PASSWORD 1234
WORKDIR /home
COPY ./scripts ./