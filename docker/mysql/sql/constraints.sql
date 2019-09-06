ALTER TABLE BOYING_GRUPPER ADD CONSTRAINT PK_BOYING_GRUPPER PRIMARY KEY (BOY_GRUPPE);

ALTER TABLE BOYING ADD CONSTRAINT PK_BOYING PRIMARY KEY (BOY_NUMMER, BOY_GRUPPE);
ALTER TABLE BOYING ADD CONSTRAINT FK_BOYING_BOYING_GRUPPER FOREIGN KEY (BOY_GRUPPE) REFERENCES BOYING_GRUPPER (BOY_GRUPPE);

ALTER TABLE PARADIGME ADD CONSTRAINT PK_PARADIRME PRIMARY KEY (PARADIGME_ID);
ALTER TABLE PARADIGME ADD CONSTRAINT FK_PARADIGME_BOY_GRUPPE FOREIGN KEY (BOY_GRUPPE) REFERENCES BOYING_GRUPPER (BOY_GRUPPE);

ALTER TABLE PARADIGME_BOYING ADD CONSTRAINT PK_PARADIGME_BOYING PRIMARY KEY (PARADIGME_ID, BOY_NUMMER, BOY_GRUPPE);
ALTER TABLE PARADIGME_BOYING ADD CONSTRAINT FK_PARADIGME_BOYING_PARADIGME FOREIGN KEY (PARADIGME_ID) REFERENCES PARADIGME (PARADIGME_ID);
ALTER TABLE PARADIGME_BOYING ADD CONSTRAINT FK_PARADIGME_BOYING_BOYING FOREIGN KEY (BOY_NUMMER, BOY_GRUPPE) REFERENCES BOYING (BOY_NUMMER, BOY_GRUPPE);

ALTER TABLE LEMMA ADD CONSTRAINT PK_LEMMA PRIMARY KEY LEMMA (LEMMA_ID);

ALTER TABLE LEMMA_PARADIGME ADD CONSTRAINT PK_LEMMA_PARADIGME PRIMARY KEY (LEMMA_ID, PARADIGME_ID);
    DELETE FROM LEMMA_PARADIGME WHERE LEMMA_ID = 159286; -- PATCH
ALTER TABLE LEMMA_PARADIGME ADD CONSTRAINT FK_LEMMA_PARADIGME_LEMMA FOREIGN KEY (LEMMA_ID) REFERENCES LEMMA (LEMMA_ID);
ALTER TABLE LEMMA_PARADIGME ADD CONSTRAINT FK_LEMMA_PARADIGME_PARADIGME FOREIGN KEY (PARADIGME_ID) REFERENCES PARADIGME (PARADIGME_ID);

ALTER TABLE FULLFORMSLISTE ADD CONSTRAINT PK_FULLFORMSLISTE PRIMARY KEY (LEMMA_ID, OPPSLAG, TAG, PARADIGME_ID, BOY_NUMMER);
    DELETE FROM FULLFORMSLISTE WHERE LEMMA_ID NOT IN (SELECT LEMMA_ID FROM LEMMA); -- PATCH
ALTER TABLE FULLFORMSLISTE ADD CONSTRAINT FK_FULLFORMSLISTE_LEMMA FOREIGN KEY (LEMMA_ID) REFERENCES LEMMA (LEMMA_ID);

ALTER TABLE LEDDANALYSE ADD CONSTRAINT PK_LEDDANALYSE PRIMARY KEY (LEDDANALYSE_ID);
ALTER TABLE LEDDANALYSE ADD CONSTRAINT FK_LEDDANALYSE_LEMMA FOREIGN KEY (LEMMA_ID) REFERENCES LEMMA (LEMMA_ID);