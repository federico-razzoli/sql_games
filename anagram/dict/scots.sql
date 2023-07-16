INSERT INTO language (code, label) VALUES ('scot', 'Scots');

INSERT INTO word (language, word) VALUES
          (LAST_INSERT_ID(), 'clarty')
        , (LAST_INSERT_ID(), 'gallus')
        , (LAST_INSERT_ID(), 'muckle')
        , (LAST_INSERT_ID(), 'lassie')
        , (LAST_INSERT_ID(), 'dreich')
        , (LAST_INSERT_ID(), 'dinnae')
        , (LAST_INSERT_ID(), 'fankle')
        , (LAST_INSERT_ID(), 'braw')
        , (LAST_INSERT_ID(), 'auld')
        , (LAST_INSERT_ID(), 'glaikit')
        , (LAST_INSERT_ID(), 'blether')
        , (LAST_INSERT_ID(), 'shoogly')
        , (LAST_INSERT_ID(), 'wheesht')
        , (LAST_INSERT_ID(), 'bairn')
        , (LAST_INSERT_ID(), 'hunners')
        , (LAST_INSERT_ID(), 'gitters')
        , (LAST_INSERT_ID(), 'plittering')
        , (LAST_INSERT_ID(), 'clabbered')
        , (LAST_INSERT_ID(), 'bumfle')
        , (LAST_INSERT_ID(), 'sassenach')
;
