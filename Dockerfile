FROM    alpine:latest

ENV     RELAY_FROM_HOSTS=10.0.0.0/8:172.16.0.0/12:192.168.0.0/16

RUN     apk --no-cache add \
            exim \
            libcap

RUN     install -d -v -o exim /var/log/exim /var/spool/exim /usr/lib/exim && \
        chmod 0755 /usr/sbin/exim && \
        setcap cap_net_bind_service=+ep /usr/sbin/exim && \
        apk del libcap

COPY    ./entrypoint.sh /
RUN     chmod +x ./entrypoint.sh

COPY    ./exim.conf /etc/exim

USER    exim

VOLUME  ["/var/log/exim", "/var/spool/exim"]

EXPOSE  25

ENTRYPOINT  ["/entrypoint.sh"]
CMD         ["exim", "-bdf", "-q30m"]
