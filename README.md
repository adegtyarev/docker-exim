# docker exim

A Docker image for Exim, the Message Transfer Agent


## Software specification

* Base image: Alpine

* Installed package: exim

* Exposed ports:
  - `25/TCP`: SMTP

* Exported volumes:
  - `/var/log/exim`: log files
  - `/var/spool/exim`: mail queue

* Required Docker (any):
  - Docker Engine 1.10 and higher
  - Docker CE 17.03 and higher

* Optional software:
  - Docker Compose


## Quick start

Create a new container which will keep mail queue and log volumes:

    $ docker create --name maildata adegtyarev/exim


Run Exim in a new container:

    $ docker run --name exim --volumes-from maildata -d exim


The sever now should be up and ready.


## Configuration

In the default setup this image is configured to use the following environment
variables:

- `RELAY_FROM_HOSTS` Exim's `hostlist` to permit relaying from any host or IP
  address that matches the list

- `ROUTE_LIST` a string consisting of a sequence of routing rules, separated
  by semicolons.  Empty rules are ignored.


## Author

Alexey Degtyarev <alexey@renatasystems.org>
