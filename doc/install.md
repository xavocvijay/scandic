## Scandic Fusion Installation Instrucitons

Project has been built using PHP and relies on MySQL database and is suitable
for a classing LAMP setup on your server. No 3rd prarty modules are required.

There are several ways to install the project.

### Requirements

 - PHP 5.5 minimum
 - Linux operating system.

### Install method 1: Docker / Dokku-alt

The preferred instal requires you to run docker and dokku-alt on your Ubuntu
server. This setup guarantees the best security and great compatibility.

This method requires that you run "NGINX" as a reverse proxy on your server,
so it might be suitable if you already run some web applications.

1. Folow http://dokku-alt.github.io to install Dokku-alt and Docker.
2. Clone this repository locally and deploy into Dokku:

```
git clone https://github.com/agiletech/scandic-fusion.git
cd scandic-fusion
git remote add deploy dokku@yoursite.com:scandic
git push deploy master
```

3. Set up database through dokku

```
dokku mariadb:create scandic
dokku mariadb:link scandic scandic
dokku mariadb:console < doc/scandic.sql
```

4. Set up domain and SSL

```
dokku ssl:help
dokku domains:help

 ^ execute necessary commands to configure environments
```

### Install Method 2: Manual

For this method, you need a working Apache server with PHP 5.5 and MySQL.

1. Create database
2. Create dedicated user with access to database
3. Import doc/scandic.sql
4. Under admin/ an frontend/     
    * copy config-distrib.php into config-ph
    * tweak `$config['dsn']` with MySQL access credentials
    * change `$config['url_prefix']=''` # this is for mod_rewrite support    
5. Download composer (follow instructions on getcomposer.org)
6. Run php composer.phar install to download dependencies
7. Set up webroot by pointing it into /frontend/public/ folder
8. Manually configure SSL or Domains as required
