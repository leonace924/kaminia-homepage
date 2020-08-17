# kaminia-homepage

Kaminia Website Homepage project for Craft CMS 3 Test


## Craft setup

### Requirements

- PHP 7
- Mysql
- Apache
- Composer

### Setup

1. Clone this repositorymark
   [git@github.com:serieseight/craft-starter.git](https://github.com/serieseight/craft-starter).
2. Run `composer install --ignore-platform-reqs` to install Craft dependencies.
3. Create an empty MySQL database called `craft-starter.test`.
- For MySQL
  Default Character Set: utf8
  Default Collation: utf8_unicode_ci
4. Copy `.env.example` to `.env` and edit the database settings *.
5. Add a config to your Apache `httpd-vhosts.conf` (see example below).
6. Add `127.0.0.1 craft-starter.test` to your `hosts` file.
7. Start your server and navigate to http://craft-starter.test/admin.
8. Follow the Craft install instructions on screen.
9. Once installed navigate in the admin UI to `settings > plugins` and install
   "Asset Rev" and "SEOmatic".


\* Everyone will also need to use the same security key in their `.env` file. To
generate a new key run `./craft setup/security-key` (this will be added to your
`.env` file).

## Apache example config

```
<VirtualHost *:80>
  DocumentRoot "/path/to/craft-starter/web"
  ServerName craft-starter.test
  <Directory />
    AllowOverride All
    Options -Indexes +FollowSymLinks
    Order allow,deny
    Allow from all
  </Directory>
</VirtualHost>
```

## CSS & JS

There is no defined build process. But the default template expects CSS and JS
to be output to `/web/assets/main.css` and `/web/assets/main.js`
respectively.

The `/assets` directory is not commited to the git repository, so deployment
will require a build process.
