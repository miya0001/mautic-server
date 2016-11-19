# Mautic server via PHP buit-in server

This is a shell script that enables you to run Mautic via PHP built-in server.

## Getting Started

Clone the Mautic.

```
$ git clone git@github.com:mautic/mautic.git
```

Install dependencies.

```
$ cd mautic
$ composer install
```

Run following.

```
$ curl https://raw.githubusercontent.com/miya0001/mautic-server/master/run.sh | bash
```

Then visit [http://127.0.0.1:8080/](http://127.0.0.1:8080/)

## Environment variables

|Name|Default|
|---|---|
|MAUTIC_DB_NAME|mautic-tests|
|MAUTIC_DB_USER|root|
|MAUTIC_DB_PASS|(empty)|

### Usage

Set `1234` for MySQL password.

```
$ export MAUTIC_DB_PASS=1234
$ curl https://raw.githubusercontent.com/miya0001/mautic-server/master/run.sh | bash
```
