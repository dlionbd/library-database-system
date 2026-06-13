USE master;
--użyłem innej lokalizacji na moim komputerze przez problemy z dockerem i WSL
GO
CREATE DATABASE biblioteka
ON
( NAME = biblioteka_dat,
--FILENAME = 'C:\BD\biblioteka_dat.mdf',
  FILENAME = '/var/opt/mssql/data/biblioteka_dat.mdf',
  MAXSIZE = 512MB,
  FILEGROWTH = 8MB )
LOG ON
( NAME = biblioteka_log,
--FILENAME = 'C:\BD\biblioteka_log.ldf'
  FILENAME = '/var/opt/mssql/data/biblioteka_log.ldf',
  MAXSIZE = 512MB,
  FILEGROWTH = 8MB );
GO
