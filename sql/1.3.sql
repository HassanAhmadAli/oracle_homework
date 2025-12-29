CREATE USER homeworku IDENTIFIED BY hassan DEFAULT TABLESPACE homeworkts PROFILE homeworkpf;
GRANT CONNECT,
    RESOURCE TO homeworku;
GRANT CREATE VIEW TO homeworku;
GRANT CREATE SYNONYM TO homeworku;
GRANT CREATE DATABASE LINK TO homeworku;
ALTER USER homeworku QUOTA UNLIMITED ON homeworkts;
-- these are required by task 3
GRANT CREATE MATERIALIZED VIEW TO homeworku;
GRANT QUERY REWRITE TO homeworku;
---