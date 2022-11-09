SELECT USER
FROM DUAL;
--==>> SCOTT

--�� ��Ű�� ���� (���� �ۼ�)
CREATE OR REPLACE PACKAGE CRYPTPACK
AS
    FUNCTION ENCRYPT(STR VARCHAR2, HASH VARCHAR2) RETURN VARCHAR2;
    FUNCTION DECRYPT(XCRYPT VARCHAR2, HASH VARCHAR2) RETURN VARCHAR2;
END CRYPTPACK;
--==>> Package CRYPTPACK��(��) �����ϵǾ����ϴ�.


--�� ��Ű�� ���� (��ü�� �ۼ�)
/*
�� DESEncrypt, DESDecrpt �Լ���
   �μ��� VARCHAR2, RAW �� ���ν����� �ִ�.
   - RAW : 2�� ������
   - UTL_RAW.CAST_TO_RAW : ���ڿ��� 2�� �����ͷ� ��ȯ
   - INPUT_STRING   VARCHAR2(32) := 'abcd';
   - RAW_INPUT      RAW(128) := UTL_RAW.CAST_TO_RAW(INPUT_STRING);
   - STR            VARCHAR2(30) := UTL_RAW.CAST_TO_RAW(RAW_INPUT);
   
�� ���ν����� �����ϴ� �Ű������� ���� �Ͽ�
   �� ���ν����� ������ �� �Ű����� ���� ������ ������
   ȥ���ϰ� �� ���ɼ��� �ſ� ũ��
   �̿� ���� ��쿡�� ������ ���� ���·�
   �Ű������� �Է� ���� �����Ͽ� �����ϸ�
   �Ǽ��� ���� �� ������, ���ϰ� ����� �� �ִ�
   
   <���ν��� ����>
   EXEC Ȥ�� EXECUTE ���ν�����( �Ű�����1 => �Ű�����1�� �����ϴ� ��
                               , �Ű�����2 => �Ű�����2�� �����ϴ� ��
                               , �Ű�����5 => �Ű�����5�� �����ϴ� ��
                               );
   �� ��, ��=>�� ��ȣ�� �̿��Ͽ�
      �ش� �Ű�������� ���� �����ϴ� ���·� �����͸� ������ �� �ִ�.
*/

CREATE OR REPLACE PACKAGE BODY CRYPTPACK
AS
    -- ���� ����
    CRYPTED_STRING VARCHAR2(2000);
    
    -- ��ȣȭ �Լ� ����
    FUNCTION ENCRYPT(STR VARCHAR2, HASH VARCHAR2)
    RETURN VARCHAR2
    IS 
        PIECES_OF_EIGHT NUMBER := ((FLOOR(LENGTH(STR)/8+.9))*8);
    BEGIN
        DBMS_OBFUSCATION_TOOLKIT.DESENCRYPT
        ( INPUT_STRING      => RPAD(STR, PIECES_OF_EIGHT)
        , KEY_STRING        => RPAD(HASH, 8, '#')
        , ENCRYPTED_STRING  => CRYPTED_STRING
        );
        RETURN CRYPTED_STRING;
    END;
    
    -- ��ȣȭ �Լ� ����
    FUNCTION DECRYPT(XCRYPT VARCHAR2, HASH VARCHAR2)
    RETURN VARCHAR2
    IS 
    BEGIN
       DBMS_OBFUSCATION_TOOLKIT.DESDECRYPT
       ( INPUT_STRING      => XCRYPT
       , KEY_STRING        => RPAD(HASH, 8, '#')
       , DECRYPTED_STRING  => CRYPTED_STRING
       );
       RETURN TRIM(CRYPTED_STRING);
    END;
    
END CRYPTPACK;
--==>> Package Body CRYPTPACK��(��) �����ϵǾ����ϴ�.









