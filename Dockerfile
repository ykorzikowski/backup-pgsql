FROM alpine:3.9

ENV PGHOST='localhost:5432'
ENV PGDATABASE='postgres'
ENV PGUSER='postgres@postgres'
ENV PGPASSWORD='password'

RUN apk -v --update add \
        postgresql \
        bash \
        curl
RUN mkdir /app /pg_backup

WORKDIR /app

COPY dumpDatabase.sh .

RUN chmod 755 dumpDatabase.sh
RUN chgrp -R 0 /app /pg_backup && chmod -R g=u /app /pg_backup

CMD [ "./dumpDatabase.sh" ]
