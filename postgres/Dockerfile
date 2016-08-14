FROM eeacms/postgres:9.5

MAINTAINER michimau <mauro.michielon@eea.europa.eu>
#file origin: https://github.com/appropriate/docker-postgis/blob/master/9.5-2.2/Dockerfile - Mike Dillon <mike@appropriate.io>

ENV POSTGIS_MAJOR 2.2
ENV POSTGIS_VERSION 2.2.2+dfsg-4.pgdg80+1

RUN apt-get update \
      && apt-get install -y --no-install-recommends \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR=$POSTGIS_VERSION \
           postgis=$POSTGIS_VERSION \
           vim \
      && rm -rf /var/lib/apt/lists/*

COPY sh/create_ssl_files.sh /
COPY sh/inject_pg_hba.conf.sh /
COPY sh/entrypoint.sh /

COPY conf/ssl.conf /postgresql.conf.d/
COPY conf/pg_hba.conf /

RUN echo "sh /inject_pg_hba.conf.sh" >> /docker-entrypoint-initdb.d/setup-schema.sh

#RUN mkdir -p /docker-entrypoint-initdb.d
COPY sh/initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["postgres"]
