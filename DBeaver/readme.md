# DBeaver

## Installation

Install the community edition on Windows by either:

- Use the script as part of the Windows Sandbox 
- Downloading the zip or installer from https://dbeaver.io/download/
- Use Chocolatey: choco install dbeaver
- Microsoft Store

On MacOS you can use either:

- Download the zip, installer or dmg from https://dbeaver.io/download/
- Use brew: brew cask install dbeaver-community

On Linux you can use either:

- Download the zip, Debian or RPM package from https://dbeaver.io/download/
- Use snap (on Ubuntu): snap install dbeaver-ce

DBeaver is also available as an Eclipse plugin if you want.



## First steps

After installing, start DBeaver and create a connection to your database by either clicking on the connect icon on the toolbar or by selecting from the menu: File > New and then select DBeaver > Database Connection.

<img src=".\img\dbeaver_new_wizard.png" style="zoom:40%;" />

Press Next.

Select the type of database you want to connect to, for example: PostgreSQL.

Press Next.

Enter the connection details. 

When the drivers for the chosen database are not yet on your system, you get a popup to download the driver. Press the Download button to do so.

<img src=".\img\dbeaaver_download_driver.png" style="zoom:30%;" />

If you do not have a database ready to access and you have Docker on your system, then use one of the following command to start a local database instance:

### Relational database

For PostgreSQL: `docker run --name mypostgresqldb -e POSTGRES_DB=mydb -e POSTGRES_PASSWORD=mysecretpassword -p 5433:5432 -d postgres`. This will install the latest version. For more info: https://hub.docker.com/_/postgres. The login user is: postgres.

For Oracle: see https://github.com/oracle/docker-images/tree/master/OracleDatabase/SingleInstance or use: `docker run --name myorcldb -p 1521:1521 -e ORACLE_PWD=mysecretpassword -v oracledb:/opt/oracle/oradata oracleinanutshell/oracle-xe-11g:latest`

For SQL Server: `docker run --name mysqlserver -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=yourStrong(!)Password' -p 1433:1433 -d mcr.microsoft.com/mssql/server:2017-CU8-ubuntu`

For MySQL: `docker run --name mysqldb -p 3306:3306 -e MYSQL_ROOT_PASSWORD=mysecretpassword -d mysql:8.0.3`. The login user is: root.



### NoSQL databases

If you want to use some other type of database, you can install a time series database, like TimescaleDB or InlfuxDB. But InfluxDB is only supported on the enterprise version of DBeaver.

For Timescale (timeseries database based on PostgreSQL): `docker run --name mytsdb -e POSTGRES_DB=mydb -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 -d timescale/timescaledb`. 

See for more info about timescale: https://github.com/timescale/timescaledb and https://docs.timescale.com/latest/introduction.



For InfluxDB: `docker run --name myinfluxdb -p 8086:8086 -v influxdb:/var/lib/influxdb -e INFLUXDB=mydb -e INFLUX_ADMIN_USER=admin -e INFLUXDB_ADMIN_PASSWORD=mysecretpassword -d influxdb`



For MongoDB: `docker run --name mymongodb -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=mongoadmin -e MONGO_INITDB_ROOT_PASSWORD=mysecretpassword -d mongo`

### Cleanup docker container and images

Delete Docker container: `docker rm <name container>` . Add `--force` when the container is still running.

Delete Docker image: `docker image rm <name image>`



## Sample data

For PostgreSQL there are 2 scripts to create some sample tables and populate it with data:

- [Create tables](./demo_create_tables_psql.sql)
- [Sample data](./demo_insert_table_data_psql.sql)

