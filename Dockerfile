FROM alpine:3.6

ENV PGHOST='localhost:5432'
ENV PGDATABASE='postgres'
ENV PGUSER='postgres@postgres'
ENV PGPASSWORD='password'

RUN apk -v --update add \
        postgresql \
        bash \
        curl
RUN mkdir /app

WORKDIR /app

COPY dumpDatabase.sh .

RUN chmod 755 dumpDatabase.sh

CMD [ "./dumpDatabase.sh" ]
