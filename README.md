![Side by side of psql running against the proxy and against the database](https://tonic.ai/uploads/masquerade-a-postgres-proxy.gif)

** Check out our [blog post](https://www.tonic.ai/post/masquerade-a-postgres-proxy/) on Masquerade!! **

# Masquerade: A Postgres proxy that masks sensitive datasets
Masquerade is two things.  It is a TCP proxy that sits between your Postgres Database and client and proxies data back and forth.  The proxy listens to all messages sent from the database to the client and provides a hook for users to modify data in-transit and before being received by the client.  Second, it is a masker.  It has built-in functionality that can mask sensitive data in the database so that it cannot be seen by the client.

Masquerade works out of the box and you can start masking your data immediately.  Simply run the proxy (see below) and begin issues SQL queries as you would normally do and you'll see the masked reults.

Masquerade is developed by [Tonic.ai](https://tonic.ai)

# Requirements
* Docker and docker-compose
* [dotnet core runtime](https://dotnet.microsoft.com/download) (v2+)

# Getting started

This project comes with a Postgres database inside a Docker container.  The database contains a toy dataset which you can use to try out the proxy before connecting it to your own database.

Start the docker-container via
```bash
docker-compose up -d
```
This will start a Postgres database on local port 15432.  The default configuration of the proxy will connect to this database.  If you want to connect to your own database see below.

Run the proxy by navigating to the repository's parent folder and executing

```bash
dotnet run
```

This will run the proxy with a default configuration.  The default configuration applies a masking function to all supported data types (see Issue #1 below).

Connect to the proxy as you would to the real database but change the host and port to that which the proxy is running on.  The default ip and port of the proxy is 127.0.0.1:20000.  You'll need to provide the username, password, and database to the postgres client but ensure you enter the IP and Port of the proxy.

For example, to connect to our Postgres database with psql you would do the following:

```bash
psql "host=localhost port=20000 dbname=test_data" user
```

The Schema of the included database is found in data/init.sql.  Currently, it is a single table called 'events' that has a variety of columns.

## Connecting to your own database

If you would like to connect to your own database instead of the toy database then open up config.json to modify the connection details of database.  You should modify the values in the "db_connection_details" object.

```json
"db_connection_details": {
        "port": 15432,
        "host": "127.0.0.1",
        "user":"user",
        "password":"password",
        "database":"test_data"
    },
```

To connect to the proxy enter the username, password, and database into your Postgres clientbut make sure you enter the IP and Port of the proxy.

**Note: You must set sslmode=disable on your given Postgres client**

# Configuration and Additional Setup
The configuration can be found in the config.json file in the root directory of this repository.  Below is a description.

| Config Variable | Description |
| ----------------|-----------------|
|proxy_port|Local port on which Proxy will listen for client connections|
|proxy_source_ip|Local IP address on which Proxy will listen for client connections|
|db_connection_details| Connection details of the Postgres Database.  See the config.json for a list of required fields.|
|masking_options| Details for how you want to mask your data.  Includes information on how to handle primary and foreign keys, how to mask based on column names or data types.  See below for a more detailed description|

## Masking Options

| Config Variable | Description |
| ----------------|-----------------|
|preserve_keys| true/false denoting whether or not primary and foreign keys should be masked|
|data_type_masks|Masking information to be applied to columns with specific data types.|
|column_masks|Masking information to be applied to specific columns based on the schema, table, and column name.|

*data_type_masks* expects an array of JSON objects which look like this:
```json
{
    "data_type": "bigint",
    "masking_function":"maskbigint"
}
```
where "data_type" is the Postgres data type and "masking_function" is the name of the function masking function to be applied to values of the respective column.

Likewise, *column_masks* are also an array of JSON objects and they look like this:
```json
{
    "column":"first_name",
    "table":"example",
    "schema":"public",
    "masking_function":"character_substitution"
}
```
You must specify the column, table, and schema names as well as the masking_function.

## Masking Functions
When masking you must provide a masking function.  A masking function is a function that takes the original value as input and returns a masked value.  You can create your own custom masking functions by creating a new function in the TonicPgProxy.Maskers namespace.  Here is an example function which replaces all of the characters of a value with 'x'.

```C#
static public string MaskX(string value)
{
    return new string('x',value.Length);
}
```

## Masking Priority

*data_type_masks* are overrided by *column_masks*.  To better understand lets use the *example* table below along with the following *masking_options*.

```sql
CREATE TABLE example
(
    first_name text,
    last_name text
);
```

```json
"masking_options": {
        "preserve_keys": false,
        "column_masks": [
            {
                "column":"first_name",
                "table":"example",
                "schema":"public",
                "masking_function":"maskx"
            }
        ],
        "data_type_masks": [
            {
                "data_type": "text",
                "masking_function":"character_substitution"
            },
        ]
}
```

Connecting to the proxy and performing a **SELECT \* FROM public.example** will result in the the *character_substitution* masking function being applied to the *last_name* column while the *first_name* column uses the *maskx* function.

# Known Issues
These are known issues and limitations of the product.  If any of these issues are blocking for you to use the proxy then please reach out to support@tonic.ai or file a Github issue.

## Issue 1
We currently do not support data type masking on the following data types:

box, bytea, cidr, circle, interval, line, lseg, path, point, polygon, tsquery, tsvector

This can lead to issues where data can potentially be leaked.  For example, imagine the following table

CREATE TABLE example
(
    val text
);

SELECT val::tsvector from example;

The SELECT statement will return unmasked data since tsvector doesn't have an assigned data type masker.

## Issue 2
Imagine the following table

CREATE TABLE example
(
    val text
);

SELECT val AS v from example;

Using the AS operator renames the Postgres Field Name from the column name 'val' to 'v'.  This will allow the field to bypass any associated column masker.  However, if a data type masker exists for the text data type it will still be applied.

## Issue 3
Proxy current supports only a single connection

## Issue 4
SSL is not yet supported.  If you connect with sslmode=require you will not be able to connect.

# Supported clients
At least some amount of testing has been done on the following Postgres clients:

* Datagrip
* pgAdmin
* Postico
* psql
