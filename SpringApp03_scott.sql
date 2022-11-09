SELECT USER
FROM DUAL;
--==>> SCOTT

--¡Û Å×ÀÌºí »ý¼º
CREATE TABLE TBL_MEMBERLIST
( ID    VARCHAR2(30)    NOT NULL
, PW    VARCHAR2(50)    NOT NULL
, NAME  VARCHAR2(50)    NOT NULL
, TEL   VARCHAR2(50)    NOT NULL
, EMAIL VARCHAR2(100)   NOT NULL
, CONSTRAINT MEMBERLIST_ID_PK PRIMARY KEY(ID)
);
--==>> Table TBL_MEMBERLISTÀÌ(°¡) »ý¼ºµÇ¾ú½À´Ï´Ù.


--¡Û µ¥ÀÌÅÍ ÀÔ·Â(¾ÏÈ£È­ ÆÐÅ°Áö »ç¿ë)
INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL)
VALUES('admin', CRYPTPACK.ENCRYPT('java002$', 'admin'), '°ü¸®ÀÚ', '010-1234-1234', 'admin@test.com');
--> ÇÑ ÁÙ ±¸¼º
INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL) VALUES('admin', CRYPTPACK.ENCRYPT('java002$', 'admin'), '°ü¸®ÀÚ', '010-1234-1234', 'admin@test.com')
;
--==>> 1 Çà ÀÌ(°¡) »ðÀÔµÇ¾ú½À´Ï´Ù.

--¡Û È®ÀÎ
SELECT *
FROM TBL_MEMBERLIST;
--==>> admin	??a?	°ü¸®ÀÚ	010-1234-1234	admin@test.com


--¡Û Ä¿¹Ô
COMMIT;
--==>> Ä¿¹Ô ¿Ï·á.


--¡Û ¸®½ºÆ® ÀüÃ¼ Á¶È¸ Äõ¸®¹® ±¸¼º
SELECT ID, NAME, TEL, EMAIL
FROM TBL_MEMBERLIST;
--> ÇÑ ÁÙ ±¸¼º
SELECT ID, NAME, TEL, EMAIL FROM TBL_MEMBERLIST
;
--==>> admin	°ü¸®ÀÚ	010-1234-1234	admin@test.com


--¡Û µ¥ÀÌÅÍ Ãß°¡ ÀÔ·Â(¿ø°Ý Á¢¼Ó ½Ç½ÀÀ» À§ÇÑ ÁØºñ - »çÀü È¯°æ ±¸¼º)
INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL)
VALUES('levi', CRYPTPACK.ENCRYPT('java002$', 'levi'), '·¹ºñ', '010-1111-1111', 'levi@gmail.com');
--==>> 1 Çà ÀÌ(°¡) »ðÀÔµÇ¾ú½À´Ï´Ù.

--¡Û È®ÀÎ
SELECT *
FROM TBL_MEMBERLIST;
--==>>
/*
admin	??a?	°ü¸®ÀÚ	010-1234-1234	admin@test.com
levi	???y	·¹ºñ	010-1111-1111	levi@gmail.com
*/

--¡Û Ä¿¹Ô
COMMIT;
--==>> Ä¿¹Ô ¿Ï·á.
