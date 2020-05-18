Рецепты apache
==============

403 Forbidden You don't have permission to access / on this server
------------------------------------------------------------------

`httpd.conf/apache.conf`:

	<Directory />
	    #Options FollowSymLinks
	    Options Indexes FollowSymLinks Includes ExecCGI
	    AllowOverride All
	    Order deny,allow
	    Allow from all
	</Directory>

[stackoverflow answer](http://stackoverflow.com/questions/10873295/error-message-forbidden-you-dont-have-permission-to-access-on-this-server)

nginx to apache
---------------

[DigitalOcean tutorial](https://www.digitalocean.com/community/tutorials/how-to-configure-nginx-as-a-front-end-proxy-for-apache)

rewrite if file not found
-------------------------

# If requested resource exists as a file or directory go to it
RewriteCond %{REQUEST_FILENAME} -f [OR]
RewriteCond %{REQUEST_FILENAME} -d
RewriteRule (.*) - [L]

# Else rewrite requests for non-existent resources to /index.php
RewriteRule (.*) /index.php?q=$1 [L]

[stackOverflow question](http://stackoverflow.com/questions/595005/redirect-requests-only-if-the-file-is-not-found)