/*
    hangman_sql
	Copyright Federico Razzoli  2013
	
	This file is part of hangman_sql.
	
    hangman_sql is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, version 3 of the License.
	
    hangman_sql is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.
	
    You should have received a copy of the GNU Affero General Public License
    along with hangman_sql.  If not, see <http://www.gnu.org/licenses/>.
*/


DELIMITER ||

CREATE DATABASE IF NOT EXISTS `hangman`
	DEFAULT CHARACTER SET 'utf8';


CREATE TABLE IF NOT EXISTS `hangman`.`image`
(
	`num_fails` TINYINT UNSIGNED NOT NULL,
	`image` VARCHAR(200) NOT NULL
	
)
	ENGINE = InnoDB;


INSERT IGNORE INTO `hangman`.`image` (`num_fails`, `image`) VALUES
	(
		5,
		CONCAT_WS('\n',
				'\n',
				'      -------',
				'      |     |',
				'      |     @',
				'      |    /|\\',
				'      |     |',
				'      |    / \\',
				'  .---|----------.',
				' /    |         /|',
				'.--------------. |',
				'|______________|/',
				'\n',
				'    You lose!',
				'\n'
			)
	),
	(
		4,
		CONCAT_WS('\n',
				'\n',
				'      -------',
				'      |     |',
				'      |     @',
				'      |    /|\\',
				'      |     |',
				'      |    /',
				'  .---|----------.',
				' /    |         /|',
				'.--------------. |',
				'|______________|/',
				'\n'
			)
	),
	(
		3,
		CONCAT_WS('\n',
				'\n',
				'      -------',
				'      |     |',
				'      |     @',
				'      |    / \\',
				'      |',
				'      |',
				'  .---|----------.',
				' /    |         /|',
				'.--------------. |',
				'|______________|/',
				'\n'
			)
	),
	(
		2,
		CONCAT_WS('\n',
				'\n',
				'      -------',
				'      |     |',
				'      |     @',
				'      |    /',
				'      |',
				'      |',
				'  .---|----------.',
				' /    |         /|',
				'.--------------. |',
				'|______________|/',
				'\n'
			)
	),
	(
		1,
		CONCAT_WS('\n',
					'\n',
					'      -------',
					'      |     |',
					'      |     @',
					'      |',
					'      |',
					'      |',
					'  .---|----------.',
					' /    |         /|',
					'.--------------. |',
					'|______________|/',
					'\n'
				)
	),
	(
		0,
		CONCAT_WS('\n',
					'\n',
					'      -------',
					'      |     |',
					'      |',
					'      |',
					'      |',
					'      |',
					'  .---|----------.',
					' /    |         /|',
					'.--------------. |',
					'|______________|/',
					'\n'
				)
	);


CREATE TABLE IF NOT EXISTS `hangman`.`word`
(
	`word` VARCHAR(50) NOT NULL PRIMARY KEY
)
	ENGINE = InnoDB;

INSERT IGNORE INTO `hangman`.`word` VALUES
	('Hangman'),
	('Long live and prosper'),
	('Debian'),
	('Fedora'),
	('Free as in free beer'),
	('CREATE TABLE'),
	('It rains cats and dogs'),
	('Paradise lost'),
	('Structured Query Language'),
	('Mr Tambourine Man'),
	('password'),
	('The good the bad and the ugly'),
	('The TRUE the FALSE and the UNKNOWN'),
	('GNU/Linux'),
	('CAPS LOCK'),
	('HyperText Markup Language'),
	('DataBase Management System'),
	('You will not guess this'),
	('Rocka rolla!'),
	('Waterfall'),
	('Moron'),
	('Rainbow'),
	('Right click'),
	('Associative array'),
	('Black and white'),
	('Heavy Metal'),
	('Batched Key Access'),
	('Recursive factorial'),
	('Negative integers'),
	('Rigel'),
	('Betelgeuse'),
	('XtraDB'),
	('Storage Engine'),
	('Comanche'),
	('Kernel'),
	('Dungeons and Dragons'),
	('Lullaby');


DROP PROCEDURE IF EXISTS `hangman`.`new`;
CREATE PROCEDURE `hangman`.`new`()
	READS SQL DATA
	COMMENT 'Start new game!'
BEGIN
	SET @num_fails = 0;
	SET @cur_ch = '';
	SET @found_chars = '';
	
	SELECT `word` FROM `hangman`.`word` ORDER BY RAND() LIMIT 1 INTO @word;
	SET @hidden = get_hidden_word(@word);
	
	SELECT CONCAT(
			(SELECT `image` FROM `hangman`.`image` WHERE `num_fails` = 0),
			'\n\n',
			@hidden
		) AS `Hangman`;
END;


DROP PROCEDURE IF EXISTS `hangman`.`guess`;
CREATE PROCEDURE `hangman`.`guess`(IN ch TEXT)
	READS SQL DATA
	COMMENT 'Guess next letter!'
`whole_proc`:
BEGIN
	IF @num_fails IS NULL THEN
		SELECT 'Please, call new() first.' AS `Hangman`;
		LEAVE `whole_proc`;
	ELSEIF @num_fails >= 5 THEN
		SELECT 'Hey, stop it! You lost!' AS `Hangman`;
		LEAVE `whole_proc`;
	ELSEIF @hidden NOT LIKE CONCAT('%\_%') THEN
		-- no more hidden chars
		SELECT 'You won, can''t you see?' AS `Hangman`;
		LEAVE `whole_proc`;
	END IF;
	
	IF LENGTH(ch) < 1 THEN
		SELECT 'Maybe you should try to guess a letter.' AS `Hangman`;
	ELSEIF LENGTH(ch) > 1 THEN
		IF ch LIKE @word THEN
			SET @hidden = @word;
		ELSE
			SET @num_fails = 5;
		END IF;
	ELSE
		IF @word NOT LIKE CONCAT('%', ch, '%') THEN
			SET @num_fails = @num_fails + 1;
		ELSE
			SET @found_chars = CONCAT(@found_chars, ch);
			SET @cur_ch = ch;
			SET @hidden = get_hidden_word(@word);
		END IF;
	END IF;
	
	SELECT CONCAT(
			(SELECT `image` FROM `hangman`.`image` WHERE `num_fails` = @num_fails),
			'\n\n',
			@hidden
		) AS `Hangman`;
END;


DROP PROCEDURE IF EXISTS `hangman`.`help`;
CREATE PROCEDURE `hangman`.`help`()
	READS SQL DATA
	COMMENT 'Print help'
BEGIN
	SELECT CONCAT_WS('\n',
			'Welcome to Hangman!',
			'',
			'To start a new game, CALL new().',
			'To guess next letter, CALL guess(''x'').',
			'To guess the whole word(s): CALL guess(''whole word(s)'').',
            'You have 5 attempts. But if you try to guess the whole word,',
            'you win or lose.'
		) AS `Hangman`;
END;


DROP FUNCTION IF EXISTS `hangman`.`get_hidden_word`;
CREATE FUNCTION `hangman`.`get_hidden_word`(word TEXT)
	RETURNS TEXT
	NOT DETERMINISTIC
	CONTAINS SQL
	COMMENT 'hide alpha chars'
BEGIN
	DECLARE i TINYINT UNSIGNED DEFAULT 1;
	DECLARE len TINYINT UNSIGNED DEFAULT LENGTH(word);
	DECLARE ch CHAR(1) CHARACTER SET utf8;
	DECLARE outstr TEXT DEFAULT '';
	
	WHILE i <= len DO
		SET ch = SUBSTRING(word FROM i FOR 1);
		IF ch = ' ' THEN
			-- handle spaces separately
			SET outstr = CONCAT(outstr, ' ');
		ELSEIF UPPER(ch) BETWEEN _utf8'A' AND _utf8'Z' AND NOT
			(@found_chars LIKE CONCAT('%', ch, '%') OR ch = @cur_ch) THEN
			-- hide alpha chars if not yet found
			SET outstr = CONCAT(outstr, '_');
		ELSE
			-- show found alpha chars
			SET outstr = CONCAT(outstr, ch);
		END IF;
		SET i = i + 1;
	END WHILE;
	
	RETURN outstr;
END;


COMMIT;

||
DELIMITER ;
