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


DROP DATABASE IF EXISTS anagram;
CREATE DATABASE anagram
        DEFAULT CHARACTER SET utf8;
USE anagram;


CREATE TABLE language
(
        id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
        code CHAR(2) NOT NULL,
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

\. anagram/dict/_common.sql

INSERT INTO language (code, label) VALUES ('en', 'English');

INSERT INTO word (language, word) VALUES
          (LAST_INSERT_ID(), 'jupiter')
        , (LAST_INSERT_ID(), 'windmill')
        , (LAST_INSERT_ID(), 'whirlwind')
        , (LAST_INSERT_ID(), 'agnostic')
        , (LAST_INSERT_ID(), 'archaic')
        , (LAST_INSERT_ID(), 'submarine')
        , (LAST_INSERT_ID(), 'earthquake')
        , (LAST_INSERT_ID(), 'abomination')
        , (LAST_INSERT_ID(), 'underground')
        , (LAST_INSERT_ID(), 'mountain')
        , (LAST_INSERT_ID(), 'overkill')
        , (LAST_INSERT_ID(), 'rainbow')
        , (LAST_INSERT_ID(), 'wartime')
        , (LAST_INSERT_ID(), 'peaceful')
        , (LAST_INSERT_ID(), 'friendly')
        , (LAST_INSERT_ID(), 'lantern')
        , (LAST_INSERT_ID(), 'fireplace')
        , (LAST_INSERT_ID(), 'anagram')
        , (LAST_INSERT_ID(), 'ridicolous')
        , (LAST_INSERT_ID(), 'waterfall')
        , (LAST_INSERT_ID(), 'firefox')
        , (LAST_INSERT_ID(), 'hurricane')
        , (LAST_INSERT_ID(), 'galaxy')
        , (LAST_INSERT_ID(), 'android')
        , (LAST_INSERT_ID(), 'alphabetical')
        , (LAST_INSERT_ID(), 'mechanism')
        , (LAST_INSERT_ID(), 'graveyard')
        , (LAST_INSERT_ID(), 'tombstone')
        , (LAST_INSERT_ID(), 'phantom')
        , (LAST_INSERT_ID(), 'undead')
        , (LAST_INSERT_ID(), 'starship')
        , (LAST_INSERT_ID(), 'metheor')
        , (LAST_INSERT_ID(), 'anachronistical')
        , (LAST_INSERT_ID(), 'purpose')
        , (LAST_INSERT_ID(), 'theoretically')
        , (LAST_INSERT_ID(), 'empirical')
        , (LAST_INSERT_ID(), 'magically')
        , (LAST_INSERT_ID(), 'propaedeutic')
        , (LAST_INSERT_ID(), 'meaningful')
        , (LAST_INSERT_ID(), 'surrogate')
        , (LAST_INSERT_ID(), 'atheist')
        , (LAST_INSERT_ID(), 'humanity')
        , (LAST_INSERT_ID(), 'insanity')
        , (LAST_INSERT_ID(), 'mellifluous')
        , (LAST_INSERT_ID(), 'spiderweb')
        , (LAST_INSERT_ID(), 'forgetting')
        , (LAST_INSERT_ID(), 'usually')
        , (LAST_INSERT_ID(), 'forever')
        , (LAST_INSERT_ID(), 'nevermore')
        , (LAST_INSERT_ID(), 'logically')
        , (LAST_INSERT_ID(), 'brainstorm')
        , (LAST_INSERT_ID(), 'sandwich')
        , (LAST_INSERT_ID(), 'enchanment')
        , (LAST_INSERT_ID(), 'arrogance')
        , (LAST_INSERT_ID(), 'sarcastic')
        , (LAST_INSERT_ID(), 'organization')
        , (LAST_INSERT_ID(), 'informal')
        , (LAST_INSERT_ID(), 'bullshit')
        , (LAST_INSERT_ID(), 'disaster')
        , (LAST_INSERT_ID(), 'empathy')
        , (LAST_INSERT_ID(), 'twilight')
        , (LAST_INSERT_ID(), 'afterlife')
        , (LAST_INSERT_ID(), 'dwarf')
        , (LAST_INSERT_ID(), 'goblin')
        , (LAST_INSERT_ID(), 'dawn')
        , (LAST_INSERT_ID(), 'nice')
        , (LAST_INSERT_ID(), 'button')
        , (LAST_INSERT_ID(), 'press')
        , (LAST_INSERT_ID(), 'hero')
        , (LAST_INSERT_ID(), 'week')
        , (LAST_INSERT_ID(), 'year')
        , (LAST_INSERT_ID(), 'month')
        , (LAST_INSERT_ID(), 'time')
        , (LAST_INSERT_ID(), 'onion')
        , (LAST_INSERT_ID(), 'tree')
        , (LAST_INSERT_ID(), 'three')
        , (LAST_INSERT_ID(), 'windy')
        , (LAST_INSERT_ID(), 'sunny')
        , (LAST_INSERT_ID(), 'funny')
        , (LAST_INSERT_ID(), 'legs')
        , (LAST_INSERT_ID(), 'head')
        , (LAST_INSERT_ID(), 'wealth')
        , (LAST_INSERT_ID(), 'health')
        , (LAST_INSERT_ID(), 'eyes')
        , (LAST_INSERT_ID(), 'node')
        , (LAST_INSERT_ID(), 'mouth')
        , (LAST_INSERT_ID(), 'smile')
        , (LAST_INSERT_ID(), 'tear')
        , (LAST_INSERT_ID(), 'rest')
        , (LAST_INSERT_ID(), 'sleep')
        , (LAST_INSERT_ID(), 'bedtime')
        , (LAST_INSERT_ID(), 'cookie')
        , (LAST_INSERT_ID(), 'spider')
        , (LAST_INSERT_ID(), 'season')
        , (LAST_INSERT_ID(), 'wall')
        , (LAST_INSERT_ID(), 'coffee')
        , (LAST_INSERT_ID(), 'seven')
        , (LAST_INSERT_ID(), 'actor')
        , (LAST_INSERT_ID(), 'actress')
        , (LAST_INSERT_ID(), 'magician')
        , (LAST_INSERT_ID(), 'bottle')
        , (LAST_INSERT_ID(), 'glass')
        , (LAST_INSERT_ID(), 'view')
        , (LAST_INSERT_ID(), 'chair')
        , (LAST_INSERT_ID(), 'important')
        , (LAST_INSERT_ID(), 'leaf')
        , (LAST_INSERT_ID(), 'crash')
        , (LAST_INSERT_ID(), 'woman')
        , (LAST_INSERT_ID(), 'girl')
        , (LAST_INSERT_ID(), 'heel')
        , (LAST_INSERT_ID(), 'foot')
        , (LAST_INSERT_ID(), 'boot')
        , (LAST_INSERT_ID(), 'hellish')
        , (LAST_INSERT_ID(), 'salt')
        , (LAST_INSERT_ID(), 'black')
        , (LAST_INSERT_ID(), 'white')
        , (LAST_INSERT_ID(), 'grey')
        , (LAST_INSERT_ID(), 'blue')
        , (LAST_INSERT_ID(), 'green')
        , (LAST_INSERT_ID(), 'yellow')
        , (LAST_INSERT_ID(), 'pink')
        , (LAST_INSERT_ID(), 'false')
        , (LAST_INSERT_ID(), 'true')
        , (LAST_INSERT_ID(), 'plane')
        , (LAST_INSERT_ID(), 'count')
        , (LAST_INSERT_ID(), 'scene')
        , (LAST_INSERT_ID(), 'lion')
        , (LAST_INSERT_ID(), 'fresh')
        , (LAST_INSERT_ID(), 'north')
        , (LAST_INSERT_ID(), 'south')
        , (LAST_INSERT_ID(), 'east')
        , (LAST_INSERT_ID(), 'west')
        , (LAST_INSERT_ID(), 'first')
        , (LAST_INSERT_ID(), 'last')
        , (LAST_INSERT_ID(), 'least')
        , (LAST_INSERT_ID(), 'horse')
        , (LAST_INSERT_ID(), 'house')
        , (LAST_INSERT_ID(), 'music')
        , (LAST_INSERT_ID(), 'steel')
        , (LAST_INSERT_ID(), 'wood')
        , (LAST_INSERT_ID(), 'sword')
        , (LAST_INSERT_ID(), 'arrow')
        , (LAST_INSERT_ID(), 'shield')
        , (LAST_INSERT_ID(), 'knife')
        , (LAST_INSERT_ID(), 'razor')
        , (LAST_INSERT_ID(), 'cloth')
        , (LAST_INSERT_ID(), 'growing')
        , (LAST_INSERT_ID(), 'mass')
        , (LAST_INSERT_ID(), 'size')
        , (LAST_INSERT_ID(), 'poetry')
        , (LAST_INSERT_ID(), 'book')
        , (LAST_INSERT_ID(), 'pages')
        , (LAST_INSERT_ID(), 'social')
        , (LAST_INSERT_ID(), 'energy')
        , (LAST_INSERT_ID(), 'fantasy')
        , (LAST_INSERT_ID(), 'sock')
        , (LAST_INSERT_ID(), 'shoe')
        , (LAST_INSERT_ID(), 'begin')
        , (LAST_INSERT_ID(), 'screen')
        , (LAST_INSERT_ID(), 'life')
        , (LAST_INSERT_ID(), 'death')
        , (LAST_INSERT_ID(), 'spectre')
        , (LAST_INSERT_ID(), 'banshee')
        , (LAST_INSERT_ID(), 'monster')
        , (LAST_INSERT_ID(), 'blood')
        , (LAST_INSERT_ID(), 'universe')
        , (LAST_INSERT_ID(), 'asteroid')
        , (LAST_INSERT_ID(), 'collision')
        , (LAST_INSERT_ID(), 'relationship')
        , (LAST_INSERT_ID(), 'darkness')
        , (LAST_INSERT_ID(), 'lightning')
        , (LAST_INSERT_ID(), 'vanishing')
        , (LAST_INSERT_ID(), 'hardest')
        , (LAST_INSERT_ID(), 'flying')
        , (LAST_INSERT_ID(), 'window')
        , (LAST_INSERT_ID(), 'colorful')
        , (LAST_INSERT_ID(), 'escaped')
        , (LAST_INSERT_ID(), 'workaround')
        , (LAST_INSERT_ID(), 'caribou')
        , (LAST_INSERT_ID(), 'skyscraper')
;

INSERT INTO language (code, label) VALUES ('it', 'Italiano');

INSERT INTO word (language, word) VALUES
          (LAST_INSERT_ID(), 'italiano')
        , (LAST_INSERT_ID(), 'catapecchia')
        , (LAST_INSERT_ID(), 'accetta')
        , (LAST_INSERT_ID(), 'mozzicone')
        , (LAST_INSERT_ID(), 'aragosta')
        , (LAST_INSERT_ID(), 'giraffa')
        , (LAST_INSERT_ID(), 'fachiro')
        , (LAST_INSERT_ID(), 'fagocitare')
        , (LAST_INSERT_ID(), 'astronave')
        , (LAST_INSERT_ID(), 'spartano')
        , (LAST_INSERT_ID(), 'periodico')
        , (LAST_INSERT_ID(), 'divertimento')
        , (LAST_INSERT_ID(), 'uragano')
        , (LAST_INSERT_ID(), 'zanzariera')
        , (LAST_INSERT_ID(), 'formichiere')
        , (LAST_INSERT_ID(), 'clessidra')
        , (LAST_INSERT_ID(), 'oligarchia')
        , (LAST_INSERT_ID(), 'mongolfiera')
        , (LAST_INSERT_ID(), 'ologramma')
        , (LAST_INSERT_ID(), 'tonnellata')
        , (LAST_INSERT_ID(), 'capogiro')
        , (LAST_INSERT_ID(), 'girasole')
        , (LAST_INSERT_ID(), 'sequoia')
        , (LAST_INSERT_ID(), 'garofano')
        , (LAST_INSERT_ID(), 'telefono')
        , (LAST_INSERT_ID(), 'castello')
        , (LAST_INSERT_ID(), 'mareggiata')
        , (LAST_INSERT_ID(), 'miriade')
        , (LAST_INSERT_ID(), 'coraggio')
        , (LAST_INSERT_ID(), 'anarchia')
        , (LAST_INSERT_ID(), 'bassorilievo')
        , (LAST_INSERT_ID(), 'acquazzone')
        , (LAST_INSERT_ID(), 'tempestoso')
        , (LAST_INSERT_ID(), 'galeone')
        , (LAST_INSERT_ID(), 'coleottero')
        , (LAST_INSERT_ID(), 'deltaplano')
        , (LAST_INSERT_ID(), 'aliante')
        , (LAST_INSERT_ID(), 'zuccherato')
        , (LAST_INSERT_ID(), 'cioccolato')
        , (LAST_INSERT_ID(), 'accacchi')
        , (LAST_INSERT_ID(), 'capoccia')
        , (LAST_INSERT_ID(), 'ristorante')
        , (LAST_INSERT_ID(), 'pizzeria')
        , (LAST_INSERT_ID(), 'acciaio')
        , (LAST_INSERT_ID(), 'rosmarino')
        , (LAST_INSERT_ID(), 'balisico')
        , (LAST_INSERT_ID(), 'prezzemolo')
        , (LAST_INSERT_ID(), 'paradosso')
        , (LAST_INSERT_ID(), 'armadietto')
        , (LAST_INSERT_ID(), 'crepuscolo')
        , (LAST_INSERT_ID(), 'alba')
        , (LAST_INSERT_ID(), 'tetto')
        , (LAST_INSERT_ID(), 'ferro')
        , (LAST_INSERT_ID(), 'farro')
        , (LAST_INSERT_ID(), 'risaia')
        , (LAST_INSERT_ID(), 'giorno')
        , (LAST_INSERT_ID(), 'anno')
        , (LAST_INSERT_ID(), 'carte')
        , (LAST_INSERT_ID(), 'scacchi')
        , (LAST_INSERT_ID(), 'gioco')
        , (LAST_INSERT_ID(), 'prato')
        , (LAST_INSERT_ID(), 'pomodoro')
        , (LAST_INSERT_ID(), 'patata')
        , (LAST_INSERT_ID(), 'zucca')
        , (LAST_INSERT_ID(), 'vita')
        , (LAST_INSERT_ID(), 'morte')
        , (LAST_INSERT_ID(), 'fumo')
        , (LAST_INSERT_ID(), 'grigio')
        , (LAST_INSERT_ID(), 'nero')
        , (LAST_INSERT_ID(), 'bianco')
        , (LAST_INSERT_ID(), 'lettera')
        , (LAST_INSERT_ID(), 'busta')
        , (LAST_INSERT_ID(), 'sacco')
        , (LAST_INSERT_ID(), 'zaino')
        , (LAST_INSERT_ID(), 'zeta')
        , (LAST_INSERT_ID(), 'fune')
        , (LAST_INSERT_ID(), 'corda')
        , (LAST_INSERT_ID(), 'corsa')
        , (LAST_INSERT_ID(), 'calza')
        , (LAST_INSERT_ID(), 'collana')
        , (LAST_INSERT_ID(), 'collare')
        , (LAST_INSERT_ID(), 'colla')
        , (LAST_INSERT_ID(), 'faccia')
        , (LAST_INSERT_ID(), 'occhio')
        , (LAST_INSERT_ID(), 'naso')
        , (LAST_INSERT_ID(), 'pericolo')
        , (LAST_INSERT_ID(), 'guancia')
        , (LAST_INSERT_ID(), 'ragno')
        , (LAST_INSERT_ID(), 'mosca')
        , (LAST_INSERT_ID(), 'erba')
        , (LAST_INSERT_ID(), 'sasso')
        , (LAST_INSERT_ID(), 'cotone')
        , (LAST_INSERT_ID(), 'lana')
        , (LAST_INSERT_ID(), 'seta')
        , (LAST_INSERT_ID(), 'lino')
        , (LAST_INSERT_ID(), 'stoffa')
        , (LAST_INSERT_ID(), 'viola')
        , (LAST_INSERT_ID(), 'rosso')
        , (LAST_INSERT_ID(), 'cavallo')
        , (LAST_INSERT_ID(), 'nord')
        , (LAST_INSERT_ID(), 'ovest')
        , (LAST_INSERT_ID(), 'vero')
        , (LAST_INSERT_ID(), 'falso')
        , (LAST_INSERT_ID(), 'forse')
        , (LAST_INSERT_ID(), 'porto')
        , (LAST_INSERT_ID(), 'nave')
        , (LAST_INSERT_ID(), 'barca')
        , (LAST_INSERT_ID(), 'legno')
        , (LAST_INSERT_ID(), 'gelato')
        , (LAST_INSERT_ID(), 'ghiaccio')
        , (LAST_INSERT_ID(), 'pomata')
        , (LAST_INSERT_ID(), 'dolore')
        , (LAST_INSERT_ID(), 'rocca')
        , (LAST_INSERT_ID(), 'sette')
        , (LAST_INSERT_ID(), 'dieci')
        , (LAST_INSERT_ID(), 'catena')
        , (LAST_INSERT_ID(), 'amore')
        , (LAST_INSERT_ID(), 'odiato')
        , (LAST_INSERT_ID(), 'paura')
        , (LAST_INSERT_ID(), 'terrore')
        , (LAST_INSERT_ID(), 'orrore')
        , (LAST_INSERT_ID(), 'testo')
        , (LAST_INSERT_ID(), 'tosse')
        , (LAST_INSERT_ID(), 'albero')
        , (LAST_INSERT_ID(), 'fiore')
        , (LAST_INSERT_ID(), 'pietra')
        , (LAST_INSERT_ID(), 'fiume')
        , (LAST_INSERT_ID(), 'ramoscello')
        , (LAST_INSERT_ID(), 'maglia')
        , (LAST_INSERT_ID(), 'griglia')
        , (LAST_INSERT_ID(), 'verso')
        , (LAST_INSERT_ID(), 'cervo')
        , (LAST_INSERT_ID(), 'daino')
        , (LAST_INSERT_ID(), 'antico')
        , (LAST_INSERT_ID(), 'cuore')
        , (LAST_INSERT_ID(), 'rumore')
        , (LAST_INSERT_ID(), 'suono')
        , (LAST_INSERT_ID(), 'musica')
        , (LAST_INSERT_ID(), 'ritmo')
        , (LAST_INSERT_ID(), 'legumi')
        , (LAST_INSERT_ID(), 'pranzo')
        , (LAST_INSERT_ID(), 'candela')
        , (LAST_INSERT_ID(), 'universo')
        , (LAST_INSERT_ID(), 'asteroide')
        , (LAST_INSERT_ID(), 'oscuro')
        , (LAST_INSERT_ID(), 'collisione')
        , (LAST_INSERT_ID(), 'elettromagnetismo')
        , (LAST_INSERT_ID(), 'elettrostatico')
        , (LAST_INSERT_ID(), 'ricercatrice')
        , (LAST_INSERT_ID(), 'dottoressa')
        , (LAST_INSERT_ID(), 'professoressa')
        , (LAST_INSERT_ID(), 'artistico')
        , (LAST_INSERT_ID(), 'insensato')
        , (LAST_INSERT_ID(), 'transatlantico')
        , (LAST_INSERT_ID(), 'zattera')
        , (LAST_INSERT_ID(), 'palizzata')
        , (LAST_INSERT_ID(), 'ideogramma')
        , (LAST_INSERT_ID(), 'elettroencefalogramma')
        , (LAST_INSERT_ID(), 'soqquadro')
        , (LAST_INSERT_ID(), 'bequadro')
        , (LAST_INSERT_ID(), 'bemolle')
        , (LAST_INSERT_ID(), 'diesis')
        , (LAST_INSERT_ID(), 'pianoforte')
        , (LAST_INSERT_ID(), 'violoncello')
        , (LAST_INSERT_ID(), 'contrabbasso')
        , (LAST_INSERT_ID(), 'emisfero')
        , (LAST_INSERT_ID(), 'enoteca')
        , (LAST_INSERT_ID(), 'spumante')
        , (LAST_INSERT_ID(), 'deterrente')
        , (LAST_INSERT_ID(), 'rovistare')
        , (LAST_INSERT_ID(), 'ristoratore')
        , (LAST_INSERT_ID(), 'giocatrice')
;

INSERT INTO language (code, label) VALUES ('es', 'Español');

INSERT INTO word (language, word) VALUES
          (LAST_INSERT_ID(), 'español')
        , (LAST_INSERT_ID(), 'cataluña')
        , (LAST_INSERT_ID(), 'andalucia')
        , (LAST_INSERT_ID(), 'aragona')
        , (LAST_INSERT_ID(), 'extremadura')
        , (LAST_INSERT_ID(), 'castellano')
        , (LAST_INSERT_ID(), 'verdadero')
        , (LAST_INSERT_ID(), 'esfuerzo')
        , (LAST_INSERT_ID(), 'adelante')
        , (LAST_INSERT_ID(), 'muchacha')
        , (LAST_INSERT_ID(), 'cucaracha')
        , (LAST_INSERT_ID(), 'verano')
        , (LAST_INSERT_ID(), 'caliente')
        , (LAST_INSERT_ID(), 'planeta')
        , (LAST_INSERT_ID(), 'cariño')
        , (LAST_INSERT_ID(), 'historia')
        , (LAST_INSERT_ID(), 'perrito')
        , (LAST_INSERT_ID(), 'gatito')
        , (LAST_INSERT_ID(), 'campesino')
        , (LAST_INSERT_ID(), 'revolucionario')
        , (LAST_INSERT_ID(), 'corazon')
        , (LAST_INSERT_ID(), 'olvidado')
        , (LAST_INSERT_ID(), 'pregunta')
        , (LAST_INSERT_ID(), 'lenguage')
        , (LAST_INSERT_ID(), 'idioma')
        , (LAST_INSERT_ID(), 'quedado')
        , (LAST_INSERT_ID(), 'descansar')
        , (LAST_INSERT_ID(), 'matador')
        , (LAST_INSERT_ID(), 'tradicion')
        , (LAST_INSERT_ID(), 'felicidad')
        , (LAST_INSERT_ID(), 'amable')
        , (LAST_INSERT_ID(), 'soledad')
        , (LAST_INSERT_ID(), 'desarrollo')
        , (LAST_INSERT_ID(), 'zapatero')
        , (LAST_INSERT_ID(), 'guatemalteco')
        , (LAST_INSERT_ID(), 'frijoles')
        , (LAST_INSERT_ID(), 'tortillas')
        , (LAST_INSERT_ID(), 'astronomo')
        , (LAST_INSERT_ID(), 'esperanza')
        , (LAST_INSERT_ID(), 'lejano')
        , (LAST_INSERT_ID(), 'imagen')
        , (LAST_INSERT_ID(), 'ecuatorial')
        , (LAST_INSERT_ID(), 'compudadora')
        , (LAST_INSERT_ID(), 'final')
        , (LAST_INSERT_ID(), 'semana')
        , (LAST_INSERT_ID(), 'pelicula')
        , (LAST_INSERT_ID(), 'estrella')
        , (LAST_INSERT_ID(), 'palabra')
        , (LAST_INSERT_ID(), 'limpio')
        , (LAST_INSERT_ID(), 'linda')
        , (LAST_INSERT_ID(), 'tamaño')
        , (LAST_INSERT_ID(), 'gordo')
        , (LAST_INSERT_ID(), 'perro')
        , (LAST_INSERT_ID(), 'pelo')
        , (LAST_INSERT_ID(), 'mesa')
        , (LAST_INSERT_ID(), 'mensa')
        , (LAST_INSERT_ID(), 'vida')
        , (LAST_INSERT_ID(), 'muerte')
        , (LAST_INSERT_ID(), 'sangre')
        , (LAST_INSERT_ID(), 'comunidad')
        , (LAST_INSERT_ID(), 'rojo')
        , (LAST_INSERT_ID(), 'nigro')
        , (LAST_INSERT_ID(), 'blanco')
        , (LAST_INSERT_ID(), 'claro')
        , (LAST_INSERT_ID(), 'indigeno')
        , (LAST_INSERT_ID(), 'fuerza')
        , (LAST_INSERT_ID(), 'mujer')
        , (LAST_INSERT_ID(), 'niño')
        , (LAST_INSERT_ID(), 'selva')
        , (LAST_INSERT_ID(), 'acero')
        , (LAST_INSERT_ID(), 'hierro')
        , (LAST_INSERT_ID(), 'pueblo')
        , (LAST_INSERT_ID(), 'peligroso')
        , (LAST_INSERT_ID(), 'igual')
        , (LAST_INSERT_ID(), 'cerebro')
        , (LAST_INSERT_ID(), 'piernas')
        , (LAST_INSERT_ID(), 'pies')
        , (LAST_INSERT_ID(), 'tobillo')
        , (LAST_INSERT_ID(), 'terror')
        , (LAST_INSERT_ID(), 'veloz')
        , (LAST_INSERT_ID(), 'hola')
        , (LAST_INSERT_ID(), 'dulce')
        , (LAST_INSERT_ID(), 'hecho')
        , (LAST_INSERT_ID(), 'avion')
        , (LAST_INSERT_ID(), 'carro')
        , (LAST_INSERT_ID(), 'coche')
        , (LAST_INSERT_ID(), 'camione')
        , (LAST_INSERT_ID(), 'cerveza')
        , (LAST_INSERT_ID(), 'demasiado')
        , (LAST_INSERT_ID(), 'sensillo')
        , (LAST_INSERT_ID(), 'porque')
        , (LAST_INSERT_ID(), 'fuente')
        , (LAST_INSERT_ID(), 'ropa')
        , (LAST_INSERT_ID(), 'comida')
        , (LAST_INSERT_ID(), 'cigarro')
        , (LAST_INSERT_ID(), 'realidad')
        , (LAST_INSERT_ID(), 'ventana')
        , (LAST_INSERT_ID(), 'caballero')
        , (LAST_INSERT_ID(), 'empezar')
        , (LAST_INSERT_ID(), 'informacion')
        , (LAST_INSERT_ID(), 'sendero')
        , (LAST_INSERT_ID(), 'esclavo')
        , (LAST_INSERT_ID(), 'democracia')
        , (LAST_INSERT_ID(), 'altiplano')
        , (LAST_INSERT_ID(), 'altura')
        , (LAST_INSERT_ID(), 'bravura')
        , (LAST_INSERT_ID(), 'desconocido')
        , (LAST_INSERT_ID(), 'elefante')
        , (LAST_INSERT_ID(), 'aguilon')
        , (LAST_INSERT_ID(), 'mercado')
        , (LAST_INSERT_ID(), 'rascacielos')
        , (LAST_INSERT_ID(), 'biblioteca')
        , (LAST_INSERT_ID(), 'calle')
        , (LAST_INSERT_ID(), 'urbano')
        , (LAST_INSERT_ID(), 'ciudades')
        , (LAST_INSERT_ID(), 'cartera')
        , (LAST_INSERT_ID(), 'astronauta')
        , (LAST_INSERT_ID(), 'aprendizaje')
        , (LAST_INSERT_ID(), 'posada')
        , (LAST_INSERT_ID(), 'descubrimiento')
        , (LAST_INSERT_ID(), 'viajero')
        , (LAST_INSERT_ID(), 'despues')
        , (LAST_INSERT_ID(), 'galeon')
        , (LAST_INSERT_ID(), 'mariposa')
        , (LAST_INSERT_ID(), 'plataforma')
;


CREATE TABLE word_letter
(
        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
        letter CHAR(1) NOT NULL,
        PRIMARY KEY (id)
)
        ENGINE = MEMORY
;

INSERT INTO language (code, label) VALUES ('de', 'Deutsche');

INSERT INTO word (language, word) VALUES
          (LAST_INSERT_ID(), 'autobahn')
        , (LAST_INSERT_ID(), 'eszet')
        , (LAST_INSERT_ID(), 'engländer')
        , (LAST_INSERT_ID(), 'mädchen')
        , (LAST_INSERT_ID(), 'familie')
        , (LAST_INSERT_ID(), 'bruder')
        , (LAST_INSERT_ID(), 'schwester')
        , (LAST_INSERT_ID(), 'station')
        , (LAST_INSERT_ID(), 'beifall')
        , (LAST_INSERT_ID(), 'zeitung')
        , (LAST_INSERT_ID(), 'löwe')
        , (LAST_INSERT_ID(), 'soldaten')
        , (LAST_INSERT_ID(), 'mannschaft')
        , (LAST_INSERT_ID(), 'heute')
        , (LAST_INSERT_ID(), 'gestern')
        , (LAST_INSERT_ID(), 'morgen')
        , (LAST_INSERT_ID(), 'sprache')
        , (LAST_INSERT_ID(), 'philosophie')
        , (LAST_INSERT_ID(), 'mathematik')
        , (LAST_INSERT_ID(), 'donnerstag')
        , (LAST_INSERT_ID(), 'hund')
        , (LAST_INSERT_ID(), 'universität')
        , (LAST_INSERT_ID(), 'liebe')
        , (LAST_INSERT_ID(), 'leben')
        , (LAST_INSERT_ID(), 'tote')
        , (LAST_INSERT_ID(), 'angst')
        , (LAST_INSERT_ID(), 'stadt')
        , (LAST_INSERT_ID(), 'schlagzeug')
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
        
        -- make random anagram
        -- and make sure anagram != word
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
                ) AS `Message`;
END ||

DELIMITER ;

