# bolt-docker 

Docker environment for Bolt CMS development.

## Containers

* mail (Mailhog, to intercept outgoing mail, see [http://localhost:8025](http://localhost:8025))
* mysql (Percona Server 5.7)
* nginx 
* php
  * PHP FPM 7.1 w/ xdebug
  * composer
  * nodejs 6
  * yarn
* redis 4 

## Setup

```
$ docker-compose up -d
$ docker/php-shell
$ www-data@b3cdd3cd0388:/srv/app$ composer install
```

Visit [http://localhost](http://localhost)
