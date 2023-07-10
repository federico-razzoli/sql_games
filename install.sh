#! /bin/bash


# Each game can be installed individually by running the `install.sql` file in its
# directory. This file simply calls all `install.sql` files one by one.
# Sorry if you expected something fancy.


cd anagram     ;  mariadb < ./install.sql;  cd ..
cd bulls_cows  ;  mariadb < ./install.sql;  cd ..
cd hangman     ;  mariadb < ./install.sql;  cd ..
