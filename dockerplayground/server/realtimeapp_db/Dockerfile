# escape=`

FROM falco/arch:latest
MAINTAINER Falco Prescher

LABEL version="1.0"
LABEL description="This is a image for installing a couch database based upon the latest arch linux."

USER root
RUN pacman -Syy --noconfirm && pacman -S couchdb --noconfirm

RUN pacman -Scc --noconfirm && rm -R /var/cache/pacman/pkg

#Copy couchdb configuration
COPY ./config/local.ini /etc/couchdb/local.ini
COPY ./config/vm.args /etc/couchdb/vm.args

COPY ./config/install_server.sh .
RUN chmod +x ./install_server.sh && ./install_server.sh && rm ./install_server.sh

# CouchDB
EXPOSE 5984 5986

COPY ./config/couchdb.sh .
COPY ./config/entrypoint.sh .

RUN chmod 750 ./couchdb.sh ./entrypoint.sh

USER server
ENTRYPOINT ["tini", "-g", "--", "./entrypoint.sh"]
CMD ["start"]
# ENTRYPOINT ["top", "-b"]
# RUN cat /test.txt
# RUN echo 'Test'
