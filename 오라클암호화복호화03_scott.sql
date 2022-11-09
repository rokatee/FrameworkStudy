SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT USER
FROM DUAL;
--==>> SCOTT

--���� �ۼ��� ��ȣȭ/��ȣȭ ��Ű�� �׽�Ʈ ����--

--�� �ǽ� ���̺� ����
CREATE TABLE TBL_EXAM
( ID NUMBER
, PW VARCHAR2(30)
);
--==>> Table TBL_EXAM��(��) �����Ǿ����ϴ�.


--�� ������ �Է�(��ȣȭ)
INSERT INTO TBL_EXAM(ID, PW) VALUES(1, 'super1234');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� ������ ��ȸ
SELECT *
FROM TBL_EXAM;
--==>>
/*
        ID PW                            
---------- ------------------------------
         1 super1234
*/
--�� �ѹ�
Rollback;
--==>> �ѹ� �Ϸ�.


--�� ��ȣȭ/��ȣȭ ��Ű���� ��ȣȭ �Լ��� Ȱ���Ͽ� ������ �Է�
INSERT INTO TBL_EXAM(ID, PW) VALUES(1, CRYPTPACK.ENCRYPT('super1234', 'SUPERMAN'));
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� ������ ��ȸ
SELECT *
FROM TBL_EXAM;
--==>>
/*
        ID PW                            
---------- ------------------------------
         1 ????2?pMS?
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� �׽�Ʈ �� ����
SELECT ID, PW
FROM TBL_EXAM;
--==>>
/*
        ID PW                            
---------- ------------------------------
         1 ????2?pMS? 
*/

SELECT ID, CRYPTPACK.DECRYPT(PW, 'SUPERMAN') AS PW
FROM TBL_EXAM;
--==>> 1	super1234

SELECT ID, CRYPTPACK.DECRYPT(PW, 'BATMAN') AS PW
FROM TBL_EXAM;
--==>> 1	G?X?>m?

SELECT ID, CRYPTPACK.DECRYPT(PW, 'SPIDERMAN') AS PW
FROM TBL_EXAM;
--==>> 1	(??T%??G?