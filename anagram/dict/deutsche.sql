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