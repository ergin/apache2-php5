# README #

This is a docker image to run PHP applications on Apache, based on tutum/apache-php, including SSL and PHP5 support.

In order to use this image effectively, you'll need to mount (create volumes):

- /var/www for your site content (e.g. using "-v /var/sites/mysite/:/var/www/")
- /var/log/apache2, optionally, if you want to store logfiles visibly outside the container
- /etc/ssl, optionally, if you wish to use SSL with real keys

## Some Examples ##

Assuming you have your content at /var/sites/mysite/, the below will be sufficient to serve it. Note that many Docker users encourage mounting data from a storage container, rather than directly from the filesystem.

- "It works!": `docker run -p 80:80 -d ergin/apache2-php5` and browse to the host's IP address using http.
- If you app uses .htaccess files you need to pass the ALLOW_OVERRIDE environment variable.
- ... htaccess support: `docker -p 80:80 -v /var/sites/mysite/:/var/www/ -d -e ALLOW_OVERRIDE=true ergin/apache2-php5`
- Serving actual content with SSL support: `docker run -p 80:80 -p 443:443 -v /var/sites/mysite/:/var/www/ -d ergin/apache2-php5`
- ... without SSL support: `docker -p 80:80 -v /var/sites/mysite/:/var/www/ -d ergin/apache2-php5`
- ... using non-standard ports: `docker -p 8080:80 -p 8443:443 -v /var/sites/mysite/:/var/www/ -d ergin/apache2-php5`
- Working with MySQL, Memcached and ALLOW_OVERRIDE set as true: `docker run --name erginbulut.com --link mysql-container:mysql-container --link memcached-container:memcached-container -p 80:80 -p 443:443 -v /var/sites/mysite/:/var/www/ -d -e ALLOW_OVERRIDE=true ergin/apache2-php5`

## A note on SSL ##

As per the defaults, Apache will use the bundled "snakeoil" key when serving SSL. Obviously this isn't sufficient or 
advisable for production, so you'll want to mount your real keys onto /etc/ssl/. If you name them 
"certs/ssl-cert-snakeoil.pem" and "private/ssl-cert-snakeoil.key", you'll be able to get by with the default config. 
Otherwise, you'll want to include a revised site definition. If you don't want to use SSL, you can avoid forwarding 
port 443 when launching the container (see below).

## Pre-Installed Applications ##
- curl
- wget

## Pre-Installed and Activated Apache Modules ##
- access_compat
- alias
- auth_basic
- authn_core
- authn_file
- authz_host
- authz_user
- autoindex
- deflate
- dir
- env
- expires
- filter
- headers
- mime
- mpm_prefork
- negotiation
- php5
- rewrite
- setenvif
- status


## Pre-Installed and Activated PHP Modules ##

- apc
- apcu
- bcmath
- bz2
- calendar
- Core
- ctype
- curl
- date
- dba
- dom
- ereg
- exif
- fileinfo
- filter
- ftp
- gd
- gettext
- hash
- iconv
- json
- libxml
- mbstring
- mcrypt
- mhash
- mysql
- mysqli
- newrelic
- openssl
- pcntl
- pcre
- PDO
- pdo_mysql
- Phar
- posix
- readline
- Reflection
- session
- shmop
- SimpleXML
- soap
- sockets
- SPL
- standard
- sysvmsg
- sysvsem
- sysvshm
- tokenizer
- wddx
- xml
- xmlreader
- xmlwriter
- Zend OPcache
- zip
- zlib
