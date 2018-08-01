1) `docker build -t phoenix .`
2) `docker run --name pg -p 5432:5432 -v <absolute path to snapshot dir>:/snapshot phoenix:latest`
3) Run this sql statement to align postgis installation: `ALTER EXTENSION postgis UPDATE;`
