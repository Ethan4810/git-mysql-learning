CREATE Database EduManager
GO


USE EduManager
GO


CREATE TABLE COURSE (
  COU_ID       INT         NOT NULL,  -- ���� ��ȣ
  COU_NAME     VARCHAR(20)    NULL,  -- ������
  TEA_NAME     VARCHAR(20)    NULL,  -- �����
  PRIMARY KEY(COU_ID)   -- ���� ��ȣ�� �⺻Ű�� ����
)
GO

CREATE TABLE STUDENT (
  STU_ID       INTEGER       NOT NULL, -- �л���ȣ, �� �� ��� �� ��
  STU_NAME     VARCHAR(20)      NULL, -- �л���
  AGE          INTEGER           NULL, -- ����
  STU_EMAIL    VARCHAR(20)      NULL, -- �̸���
  COU_ID       INTEGER           NULL,-- �Ҽӵ� ������ ���� ��ȣ
  SEX          VARCHAR(1)   NULL    DEFAULT 'M', -- ���� ����
  PRIMARY KEY(STU_ID),            -- �л���ȣ�� �⺻Ű�� ����
  -- -- ���� ��ȣ�� �ܷ�Ű�� ����
  FOREIGN KEY(COU_ID) REFERENCES COURSE(COU_ID)
)
GO

--���� ���̺� ������ �Է�
INSERT INTO course VALUES(10,'�����','������')
INSERT INTO course VALUES(20,'�ڹ�','������')
INSERT INTO course VALUES(30,'������','Ȳ����')
INSERT INTO course VALUES(40,'��ǥ��','������')

--�л� ���̺� ������ �Է�
INSERT INTO STUDENT VALUES(101,'������', 24,'moon@nate.com',10,'M')
INSERT INTO STUDENT VALUES(102,'���Ѽ�', 22,'five@nate.com',20,'M')
INSERT INTO STUDENT VALUES(103,'���뼮', 22,'again@nate.com',20,'M')
INSERT INTO STUDENT VALUES(104,'����ö', 22,'cook@nate.com',20,'M')
INSERT INTO STUDENT VALUES(105,'��ȫ��', 24,'red@nate.com',10,'M')
INSERT INTO STUDENT VALUES(106,'������', 21,'kim@nate.com',20,'M')
INSERT INTO STUDENT VALUES(107,'�ڽ���', 22,'season@nate.com',20,'M')
INSERT INTO STUDENT VALUES(108,'������', 27,'brother@nate.com',10,'M')
INSERT INTO STUDENT VALUES(109,'������', 22,'sun@nate.com',20,'F')
INSERT INTO STUDENT VALUES(110,'�ڱ⼮', 34,'flag@nate.com',10,'M')
INSERT INTO STUDENT VALUES(111,'��ȿ��', 24,'good@nate.com',30,'F')
INSERT INTO STUDENT VALUES(112,'��â��', 34,'window@nate.com',30,'M')
INSERT INTO STUDENT VALUES(113,'������', 28,'empty@nate.com',10,'M')
INSERT INTO STUDENT VALUES(114,'�̺���', 29,'bbong@nate.com',10,'M')
INSERT INTO STUDENT VALUES(115,'��â��', 24,'chang@nate.com',30,'M')
INSERT INTO STUDENT VALUES(116,'����', 34,'shine@nate.com',10,'M')

