### Instructions

##### Setup Compose Snapshot Directory

* Find the snapshot directory within your compose backup
* in the `conf` directory make the following changes (this will be scripted in future revisions)
  * in `postgresql.conf` add the following lines: `listen_addresses = '*'`, `port = 5432`
  * in `pg_hba.conf` add the following line: `host all all all trust`

##### Build Image

* `docker build -t phoenix .`

##### Run Image

* To Startup: `docker run --name pg -p 5432:5432 -v <absolute path to snapshot dir>:/snapshot phoenix:latest`
* Run this sql statement to align postgis installation: `ALTER EXTENSION postgis UPDATE;`
* Run this sql statement to verify postgis installation: `SELECT PostGIS_Version();`
