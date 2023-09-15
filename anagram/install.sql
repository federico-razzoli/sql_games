/*
        Copright 2015, 2016  Federico Razzoli
        
        This program is free software: you can redistribute it and/or modify
        it under the terms of the GNU Affero General Public License as published by
        the Free Software Foundation, version 3 of the License.
        
        This program is distributed in the hope that it will be useful,
        but WITHOUT ANY WARRANTY; without even the implied warranty of
        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
        GNU Affero General Public License for more details.
        
        You should have received a copy of the GNU Affero General Public License
        along with this program.  If not, see <http://www.gnu.org/licenses/>.  
*/


\W


DELIMITER ||
BEGIN NOT ATOMIC
    IF (
        SELECT COUNT(*)
            FROM information_schema.SCHEMATA
            WHERE SCHEMA_NAME = 'anagram'
    ) THEN
        SIGNAL SQLSTATE '45000' SET
            MESSAGE_TEXT = 'Database anagram exists'
        ;
    END IF;
END ||
DELIMITER ;


CREATE DATABASE anagram
        DEFAULT CHARACTER SET utf8mb4;
USE anagram;


CREATE TABLE language
(
        id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
        code CHAR(5) NOT NULL,
        label VARCHAR(50) NOT NULL,
        PRIMARY KEY (id),
        UNIQUE INDEX unq_code (code)
)
        ENGINE = InnoDB
;

CREATE TABLE word
(
        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
        word VARCHAR(100) NOT NULL,
        language TINYINT UNSIGNED NULL,
        word_length TINYINT UNSIGNED
                AS (CHAR_LENGTH(word)) PERSISTENT,
        PRIMARY KEY (id),
        UNIQUE INDEX unq_word (word),
        INDEX idx_lang_length (language, word_length),
        FOREIGN KEY fk_word_language (language)
                REFERENCES language (id)
                ON DELETE RESTRICT
                ON UPDATE RESTRICT
)
        ENGINE = InnoDB
;


CREATE TABLE word_letter
(
        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
        letter CHAR(1) NOT NULL,
        PRIMARY KEY (id)
)
        ENGINE = MEMORY
;


DELIMITER ||

CREATE PROCEDURE new()
        MODIFIES SQL DATA
        COMMENT 'Start new game'
BEGIN
        DECLARE x INT DEFAULT NULL;
        DECLARE cur_char CHAR(1) DEFAULT NULL;
        
        TRUNCATE TABLE word_letter;
        SET @_anagram_word := NULL;
        SET @_anagram_language_name := NULL;
        SET @_anagram_anagram := NULL;
        SET @_anagram_tries := 0;
        
        -- get random word
        SELECT LOWER(TRIM(w.word)), l.label
                INTO @_anagram_word, @_anagram_language_name
                FROM word w
                LEFT JOIN language l
                        ON w.language = l.id
                WHERE
                        -- filter by language (TODO: allow multiple languages)
                                (l.code LIKE IFNULL(@_anagram_language, 'en') OR l.code IS NULL)
                        -- filter by length
                        AND (@_anagram_min_length IS NULL OR word_length >= @_anagram_min_length)
                        AND (@_anagram_max_length IS NULL OR word_length <= @_anagram_max_length)
                ORDER BY RAND()
                LIMIT 1
        ;
        
        SET x := CHAR_LENGTH(@_anagram_word);
        
        -- store the letters in current order (with autoinc id)
        WHILE x > 0 DO
                SET cur_char := SUBSTRING(@_anagram_word FROM x FOR 1);
                INSERT INTO word_letter (letter) VALUES (cur_char);
                SET x := x - 1;
        END WHILE;
        
        -- compose a random anagram
        -- and make sure that anagram != word
        SET @_anagram_anagram := @_anagram_word;
        WHILE@_anagram_anagram = @_anagram_word  DO
                SET @_anagram_anagram := (
                        SELECT GROUP_CONCAT(letter ORDER BY RAND() SEPARATOR '')
                                FROM word_letter
                                ORDER BY RAND()
                );
        END WHILE;
        
        SELECT CONCAT_WS('',
                  '\nThe new anagram is: `', @_anagram_anagram, '` '
                , '(language: ', IFNULL(@_anagram_language_name, 'N/A'), ').'
                , '\nTry to guess() the word!'
                , '\n'
        ) AS `Message`;
        
        SET @_anagram_start_time := CAST(NOW() AS UNSIGNED);
END ||

CREATE PROCEDURE guess(IN p_guess VARCHAR(100))
        READS SQL DATA
        COMMENT 'Guess word'
BEGIN
        DECLARE v_time_elapsed INT UNSIGNED DEFAULT CAST(NOW() AS UNSIGNED) - @_anagram_start_time;
        
        SET @_anagram_tries := @_anagram_tries + 1;
        
        IF p_guess LIKE @_anagram_word THEN
                SELECT CONCAT_WS('',
                          '\nCorrect! You Win!'
                          '\nYou guessed with ', @_anagram_tries, ' attempts, in ', v_time_elapsed, ' seconds.'
                        , '\n'
                ) AS `Message`;
                
                TRUNCATE TABLE word_letter;
                SET @_anagram_word := NULL;
                SET @_anagram_anagram := NULL;
                SET @_anagram_tries := 0;
                SET @_anagram_language_name := NULL;
        ELSE
                SELECT CONCAT_WS(''
                        , '\nNope! That''s not the word. Try again!'
                        , '\n'
                ) AS `Message`;
        END IF;
END ||

CREATE PROCEDURE set_options(
          IN p_language VARCHAR(2)
        , IN p_min_length TINYINT UNSIGNED
        , IN p_max_length TINYINT UNSIGNED
)
        CONTAINS SQL
        COMMENT 'Set language, min+max length'
BEGIN
        SET @_anagram_language    := p_language;
        SET @_anagram_min_length  := p_min_length;
        SET @_anagram_max_length  := p_max_length;
        
END ||

CREATE PROCEDURE show_languages()
BEGIN
        SELECT * FROM language;
END ||

CREATE PROCEDURE help()
        CONTAINS SQL
        COMMENT 'How to play'
BEGIN
        SELECT CONCAT(
                          '\n'
                        , 'ANAGRAM\n'
                        , '=======\n'
                        , '\n'
                        , 'I''ll show you an anagram, you should guess the original word.\n'
                        , '\n'
                        , 'To start a game, type:\n'
                        , 'CALL new();\n'
                        , '\n'
                        , 'To try guessing the word, type:\n'
                        , 'CALL guess(''word'');\n'
                        , '\n'
                        , 'By default, anagrams are made from any English word (that is in my database).\n'
                        , 'I speak Italian, Spanish and German too.\n'
                        , 'To change the language and set a minimum/maximum length for the words:\n'
                        , 'CALL set_options(''es'', 4, 10);\n'
                        , 'Use NULL to avoid minimum or maximum bound.\n'
                        , '\n'
                        , 'To list all the available languages\n'
                        , 'CALL show_languages();\n'
                ) AS `Message`;
END ||

DELIMITER ;

-- create dictionaries

\. dict/_common.sql
\. dict/english.sql
\. dict/deutsche.sql
\. dict/italian.sql
\. dict/scots.sql
\. dict/spanish.sql
