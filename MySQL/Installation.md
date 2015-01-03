Installation
============
1. Get ready with brew
----------------------
``` shell
brew update
brew doctor
brew upgrade
```

2. Install MySQL
----------------
brew install mysql

3. Postinstallation
-------------------
* Initialize the grant tables, and assign passwords to the accounts in the grant tables

use mysql_install_db program to generate new MySQL privilege tables.

Typically, mysql_install_db needs to be run only the first time you install MySQL.

``` shell
unset TMPDIR
mysql_install_db --verbose --user=`whoami` \\
--basedir="$(brew --prefix mysql)" \\
--datadir=/usr/local/var/mysql --tmpdir=/tmp
```
datadir: holds the grant tables and the test database

* Start the server
``` shell
mysql.server start
```

* Verify the server is running
``` shell
mysqladmin version
mysqladmin variables

mysqladmin -u root shutdown
mysqld_safe --user=mysql &
```

* run mysql_secure_installation program for security settings
``` shell
mysql.server start
mysql_secure_installation
```
or we can follow [this post](http://howtolamp.com/lamp/mysql/5.6/securing/) to do those settings manually. 