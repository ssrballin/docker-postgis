#--------- Generic stuff all our Dockerfiles should start with so we get caching ------------
FROM debian:stable
MAINTAINER Tim Sutton<tim@kartoza.com>

RUN apt -y update; apt -y install gnupg2 wget ca-certificates rpl pwgen
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

#-------------Application Specific Stuff ----------------------------------------------------
# We add postgis as well to prevent build errors (that we dont see on local builds)
# on docker hub e.g.
# The following packages have unmet dependencies:
RUN apt -y update; apt install -y postgresql-client-9.6 postgresql-common postgresql-9.6 postgresql-9.6-postgis-2.4 postgresql-9.6-pgrouting netcat

# Open port 5432 so linked containers can see them
EXPOSE 5432

# We will run any commands in this when the container starts
ADD start-postgis.sh /start-postgis.sh
RUN chmod 0777 /start-postgis.sh

WORKDIR /snapshot

CMD /start-postgis.sh
