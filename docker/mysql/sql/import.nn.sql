SHOW WARNINGS;

USE ordbank;

-- LEMMA
LOAD DATA LOCAL INFILE '/data/lemma_2012.txt' INTO TABLE NN_LEMMA

FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES

(@skip, LEMMA_ID, GRUNNFORM, @skip);

SHOW WARNINGS;

-- BOYING_GRUPPER

LOAD DATA LOCAL INFILE '/data/boying_grupper_2012.txt' INTO TABLE NN_BOYING_GRUPPER

FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES

(@skip, BOY_GRUPPE);

SHOW WARNINGS;

-- BOYING

LOAD DATA LOCAL INFILE '/data/boying_2012.txt' INTO TABLE NN_BOYING

FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES

(@skip, BOY_NUMMER, BOY_GRUPPE, BOY_TEKST, ORDBOK_TEKST);

SHOW WARNINGS;

-- FULLFORMSLISTE

LOAD DATA LOCAL INFILE '/data/fullformer_2012.txt' INTO TABLE NN_FULLFORMSLISTE

FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES

(@skip, LEMMA_ID, OPPSLAG, TAG, PARADIGME_ID, BOY_NUMMER, FRADATO, TILDATO, NORMERING);

SHOW WARNINGS;

-- PARADIGME

LOAD DATA LOCAL INFILE '/data/paradigme_2012.txt' INTO TABLE NN_PARADIGME

FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES

(@skip, PARADIGME_ID, BOY_GRUPPE, ORDKLASSE, ORDKLASSE_UTDYPING, FORKLARING, DOEME, ID);

SHOW WARNINGS;

-- LEMMA_PARADIGME

LOAD DATA LOCAL INFILE '/data/lemma_paradigme_2012.txt' INTO TABLE NN_LEMMA_PARADIGME

FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES

(@skip, LEMMA_ID, PARADIGME_ID, NORMERING, FRADATO, TILDATO, KOMMENTAR);

SHOW WARNINGS;

-- PARADIGME_BOYING

LOAD DATA LOCAL INFILE '/data/paradigme_boying_2012.txt' INTO TABLE NN_PARADIGME_BOYING

FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES

(@skip, PARADIGME_ID, BOY_NUMMER, BOY_GRUPPE, BOY_UTTRYKK);

SHOW WARNINGS;

-- LEDDANALYSE

LOAD DATA LOCAL INFILE '/data/leddanalyse_2012.txt' INTO TABLE NN_LEDDANALYSE

FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES

(@skip, LEDDANALYSE_ID, OPPSLAG, LEDDANALYSE, FORLEDD, FORLEDD_GRAM, FUGE, ETTERLEDD, ETTERLEDD_GRAM, LEDDMARKERT_BOB, NEG_FUGE, OPPSLAG_LEDD_MARKERT, BINDESTREKSFORM_FOR_LEMMA, LEMMA_ID);

SHOW WARNINGS;
