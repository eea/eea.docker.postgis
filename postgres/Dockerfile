FROM eeacms/postgres:9.6-3.4

MAINTAINER michimau <mauro.michielon@eea.europa.eu>

ENV POSTGIS_MAJOR 2.4

RUN apt-get update \
      && apt-get install -y --no-install-recommends \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR-scripts \
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
