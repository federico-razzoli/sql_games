# Bulls and Cows SQL

This is the popular Bulls and Cows game, implemented in MariaDB using the stored procedures.

It can run on Percona Server or Oracle MySQL, but will probably require some small changes, since I may have used MariaDB-specific features.

To install this program:

`mysql -uroot -p<your_pwd> < bulls_cows.sql`

Type `CALL help()` to get a brief explaination about the game.

I suspect that Mr Codd didn't elaborate the relational theory to let people play games.
Oh, well, he would probably appreciate.

