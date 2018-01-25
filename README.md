# sql_games

Games implemented as stored procedures for MariaDB. You can play them from the command-line client. Can be ran on Percona Server or Oracle MySQL, but will require some small changes because I've used some MariaDB-specific features. To work with MySQL Server, change `PERSISTENT` to `STORED` in `install.sql`.

Each game is in a separate directory. See the `README.md.` in each directory for a quick explanation of the game and how to play.

To install all the games, just pass the `install.sql` file in the root directory to the mysql command-line client. For example:

```
mysql -uroot -p < install.sql
```

To install an individual game, run the `install.sql` file in the game directory as described above.

Each game will be installed in a different database, which contains the necessary routines and tables. The only routine that you need to remember is:

```
CALL help();
```

This will show you a help that explains how to play.

