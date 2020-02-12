ALTER TABLE NN_BOYING_GRUPPER ADD CONSTRAINT NN_PK_BOYING_GRUPPER PRIMARY KEY (BOY_GRUPPE);

ALTER TABLE NN_BOYING ADD CONSTRAINT NN_PK_BOYING PRIMARY KEY (BOY_NUMMER, BOY_GRUPPE);
ALTER TABLE NN_BOYING ADD CONSTRAINT NN_FK_BOYING_BOYING_GRUPPER FOREIGN KEY (BOY_GRUPPE) REFERENCES NN_BOYING_GRUPPER (BOY_GRUPPE);

ALTER TABLE NN_PARADIGME ADD CONSTRAINT NN_PK_PARADIRME PRIMARY KEY (PARADIGME_ID);
ALTER TABLE NN_PARADIGME ADD CONSTRAINT NN_FK_PARADIGME_BOY_GRUPPE FOREIGN KEY (BOY_GRUPPE) REFERENCES NN_BOYING_GRUPPER (BOY_GRUPPE);

ALTER TABLE NN_PARADIGME_BOYING ADD CONSTRAINT NN_PK_PARADIGME_BOYING PRIMARY KEY (PARADIGME_ID, BOY_NUMMER, BOY_GRUPPE);
ALTER TABLE NN_PARADIGME_BOYING ADD CONSTRAINT NN_FK_PARADIGME_BOYING_PARADIGME FOREIGN KEY (PARADIGME_ID) REFERENCES NN_PARADIGME (PARADIGME_ID);
ALTER TABLE NN_PARADIGME_BOYING ADD CONSTRAINT NN_FK_PARADIGME_BOYING_BOYING FOREIGN KEY (BOY_NUMMER, BOY_GRUPPE) REFERENCES NN_BOYING (BOY_NUMMER, BOY_GRUPPE);

ALTER TABLE NN_LEMMA ADD CONSTRAINT NN_PK_LEMMA PRIMARY KEY LEMMA (LEMMA_ID);

ALTER TABLE NN_LEMMA_PARADIGME ADD CONSTRAINT NN_PK_LEMMA_PARADIGME PRIMARY KEY (LEMMA_ID, PARADIGME_ID);
    DELETE FROM NN_LEMMA_PARADIGME WHERE LEMMA_ID = 132349; -- PATCH
    DELETE FROM NN_LEMMA_PARADIGME WHERE LEMMA_ID = 132350; -- PATCH
ALTER TABLE NN_LEMMA_PARADIGME ADD CONSTRAINT NN_FK_LEMMA_PARADIGME_LEMMA FOREIGN KEY (LEMMA_ID) REFERENCES NN_LEMMA (LEMMA_ID);
ALTER TABLE NN_LEMMA_PARADIGME ADD CONSTRAINT NN_FK_LEMMA_PARADIGME_PARADIGME FOREIGN KEY (PARADIGME_ID) REFERENCES NN_PARADIGME (PARADIGME_ID);

ALTER TABLE NN_FULLFORMSLISTE ADD CONSTRAINT NN_PK_FULLFORMSLISTE PRIMARY KEY (LEMMA_ID, OPPSLAG, TAG, PARADIGME_ID, BOY_NUMMER);
    DELETE FROM NN_FULLFORMSLISTE WHERE LEMMA_ID NOT IN (SELECT LEMMA_ID FROM NN_LEMMA); -- PATCH
ALTER TABLE NN_FULLFORMSLISTE ADD CONSTRAINT NN_FK_FULLFORMSLISTE_LEMMA FOREIGN KEY (LEMMA_ID) REFERENCES NN_LEMMA (LEMMA_ID);

ALTER TABLE NN_LEDDANALYSE ADD CONSTRAINT NN_PK_LEDDANALYSE PRIMARY KEY (LEDDANALYSE_ID);
ALTER TABLE NN_LEDDANALYSE ADD CONSTRAINT NN_FK_LEDDANALYSE_LEMMA FOREIGN KEY (LEMMA_ID) REFERENCES NN_LEMMA (LEMMA_ID);
