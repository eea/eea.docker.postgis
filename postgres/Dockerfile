FROM eeacms/postgres:9.6

MAINTAINER michimau <mauro.michielon@eea.europa.eu>
#file origin: https://github.com/appropriate/docker-postgis/blob/master/9.5-2.2/Dockerfile - Mike Dillon <mike@appropriate.io>

ENV POSTGIS_MAJOR 2.3
ENV POSTGIS_VERSION 2.3.0+dfsg-2.pgdg80+1

RUN apt-get update \
      && apt-get install -y --no-install-recommends \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR=$POSTGIS_VERSION \
           postgis=$POSTGIS_VERSION \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR-scripts \
           postgresql-$PG_MAJOR-postgis-scripts \
           vim \
      && rm -rf /var/lib/apt/lists/*

COPY sh/create_ssl_files.sh /
COPY sh/inject_pg_hba.conf.sh /

COPY conf/additional.conf /postgresql.conf.d/

RUN sed -i -e 's/exec gosu postgres "$@"/sh \/inject_pg_hba.conf.sh \&\nexec gosu postgres "$@"/g' /master-entrypoint.sh
RUN sed -i -e 's/exec gosu postgres "$@"/sh \/create_ssl_files.sh \&\nexec gosu postgres "$@"/g' /master-entrypoint.sh

COPY sh/initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["postgres"]
