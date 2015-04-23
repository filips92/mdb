CREATE TABLE COVERS
(
  COVER_ID NUMBER NOT NULL,
  FILENAME VARCHAR2(100),
  IMAGE_COL ORDImage,
  IMG_MODIF ORDImage,
  CONSTRAINT COVERS_PK PRIMARY KEY (COVER_ID)
);

ALTER TABLE GAMES
ADD
(
  COVER_ID NUMBER,
  CONSTRAINT GAMES_COVERS_FK FOREIGN KEY (COVER_ID) REFERENCES COVERS (COVER_ID)
);