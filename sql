SET SERVEROUTPUT ON

DROP TABLE Jelentkezes;
DROP TABLE Hirdetes;
DROP TABLE Uzenet;

DROP TABLE Adminisztrator;
DROP TABLE CV;


DROP TABLE Allaskereso;
DROP TABLE Ceg;
DROP TABLE Telepules;


-- Az Álláskereső tábla atribútumai: Á.mail, Jelszó, Telefonszám, Státusz, Név, Születési_dátum, Profilkép.
create table Allaskereso(
  a_mail VARCHAR2(40) PRIMARY KEY NOT NULL,
  jelszo VARCHAR2(100) NOT NULL,
  telefonszam NUMBER(9) NOT NULL,
  statusz VARCHAR2(7) NOT NULL,
  nev VARCHAR2(100) NOT NULL,
  szul_datum DATE NOT NULL,
  profilkep VARCHAR2(100)
);

-- A Település tábla atribútumai: Irányítószám, Név, Ország
create table Telepules(
  iranyitoszam VARCHAR2(10) PRIMARY KEY NOT NULL,
  nev VARCHAR2(100) NOT NULL,
  orszag VARCHAR2(100) NOT NULL
);

-- A Cég tábla atribútumai C.mail, Jelszó, Név, Telefonszám, Logó, Irányítószám.
create table Ceg(
  c_mail VARCHAR2(40) PRIMARY KEY NOT NULL,
  jelszo VARCHAR2(15) NOT NULL,
  nev VARCHAR2(100) NOT NULL,
  telefonszam NUMBER(9) NOT NULL,
  logo VARCHAR2(100),
  iranyitoszam VARCHAR2(10) NOT NULL,
  FOREIGN KEY(iranyitoszam) REFERENCES Telepules(iranyitoszam)
);



CREATE TABLE Adminisztrator ( 
   ad_mail Varchar2(40) PRIMARY KEY NOT NULL,
   jelszo Varchar2(15) NOT NULL,
   profilkep Varchar2(100) NOT NULL
);
   
CREATE TABLE CV ( 
   cv_id Number(4) PRIMARY KEY NOT NULL,
   nyelv Varchar2(20) NOT NULL,
   a_mail Varchar2(40) NOT NULL,
   leiras Varchar2(500) NOT NULL,
   Foreign key(a_mail) references Allaskereso(a_mail)
);
  
--A Hírdetés tábla atribútumai: h.id, munkakör, irányítószám, min, max, leírás, mail, dátum, ad.mail.
create table Hirdetes(
  h_id CHAR(5) PRIMARY KEY NOT NULL,
  munkakor VARCHAR2(50) NOT NULL,
  iranyitoszam VARCHAR2(10) NOT NULL,
  min NUMBER(15),
  max NUMBER(15),
  leiras VARCHAR2(500),
  a_mail VARCHAR2(40),
  c_mail VARCHAR2(40),
  datum DATE NOT NULL,
  ad_mail VARCHAR2(40),
  FOREIGN KEY(iranyitoszam) REFERENCES TELEPULES(iranyitoszam),
  CONSTRAINT FK_1 FOREIGN KEY(a_mail) REFERENCES Allaskereso(a_mail),
  CONSTRAINT FK_2 FOREIGN KEY(c_mail) REFERENCES Ceg(c_mail),
  CONSTRAINT FK_3 FOREIGN KEY(ad_mail) REFERENCES Adminisztrator(ad_mail)
);

CREATE TABLE Jelentkezes (  
   mail Varchar2(40) PRIMARY KEY NOT NULL,
   h_id Char(5) NOT NULL, 
   datum Date NOT NULL,  
   foreign key(h_id) references HIRDETES(h_id)
);



--Az üzenet tábla atribútumai ü.id, message, tárgy, feladó.mail, címzett.mail, dátum.
create table Uzenet(
  u_id NUMBER(4) PRIMARY KEY NOT NULL,
  message VARCHAR2(800) NOT NULL,
  targy VARCHAR2(50) NOT NULL,
  a_felado_mail VARCHAR2(40),
  c_felado_mail VARCHAR2(40),
  ad_felado_mail VARCHAR2(40),
  a_cimzett_mail VARCHAR2(40),
  c_cimzett_mail VARCHAR2(40),
  ad_cimzett_mail VARCHAR2(40),
  datum DATE NOT NULL,
  FOREIGN KEY(a_felado_mail) REFERENCES Allaskereso(a_mail),
  FOREIGN KEY(c_felado_mail) REFERENCES Ceg(c_mail),
  FOREIGN KEY(ad_felado_mail) REFERENCES Adminisztrator(ad_mail),
  FOREIGN KEY(a_cimzett_mail) REFERENCES Allaskereso(a_mail),
  FOREIGN KEY(c_cimzett_mail) REFERENCES Ceg(c_mail),
  FOREIGN KEY(ad_cimzett_mail) REFERENCES Adminisztrator(ad_mail)
);

-- Az Álláskereső tábla feltöltése.
INSERT INTO Allaskereso VALUES('S6fDSsVXc9@mailinator.com','JNUOyQHf0I',065164271,'aktiv','Aurora Serrano',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Aurora_Serrano.png');
INSERT INTO Allaskereso VALUES('EHYaXD13Gp@mailinator.com','z3eGvXA4tG',062696063,'inaktiv','Jonathan Gardner',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Jonathan_Gardner.png');
INSERT INTO Allaskereso VALUES('WpHydaukl8@mailinator.com','fjsT25VUhi',067862500,'aktiv','Max Johns',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Max_Johns.png');
INSERT INTO Allaskereso VALUES('IGRMkntCpT@mailinator.com','FdTPdF1qWj',061407507,'inaktiv','Darla Holman',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Darla_Holman.png');
INSERT INTO Allaskereso VALUES('r7pnHoYYA4@mailinator.com','ien1lLXLhl',067592562,'aktiv','Carissa Larson',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Carissa_Larson.png');
INSERT INTO Allaskereso VALUES('dzKjN1HIWu@mailinator.com','kskmwBTZvy',067766449,'aktiv','Terrell Velasquez',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Terrell_Velasquez.png');
INSERT INTO Allaskereso VALUES('CZDz0NYYFy@mailinator.com','uCelGUq91y',068981697,'aktiv','Quincy Skinner',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Quincy_Skinner.png');
INSERT INTO Allaskereso VALUES('wUWAkLrmni@mailinator.com','N8ZgOlt3Hn',064682037,'inaktiv','Lincoln Colon',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Lincoln_Colon.png');
INSERT INTO Allaskereso VALUES('u7EDPnTW3t@mailinator.com','Ji8DuQy29H',060508272,'aktiv','Javier Cole',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Javier_Cole.png');
INSERT INTO Allaskereso VALUES('VM2qM2VUSO@mailinator.com','wX8YzmeGuT',067671295,'inaktiv','Jackson Chavez',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Jackson_Chavez.png');
INSERT INTO Allaskereso VALUES('jqXDd2BTYF@mailinator.com','QZcIxLM6y9',061128587,'aktiv','Ronda Mullen',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Ronda_Mullen.png');
INSERT INTO Allaskereso VALUES('g44nLmGBIA@mailinator.com','7ahiLYk0gm',064404596,'inaktiv','Noreen Farmer',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Noreen_Farmer.png');
INSERT INTO Allaskereso VALUES('EbA0QJdZ6j@mailinator.com','bLV7tcy822',065485765,'inaktiv','Willis Martinez',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Willis_Martinez.png');
INSERT INTO Allaskereso VALUES('jkB6PpPWPr@mailinator.com','KsFQPhFgib',066203559,'aktiv','Chasity Baker',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Chasity_Baker.png');
INSERT INTO Allaskereso VALUES('gmcmdz0Lko@mailinator.com','fXp5bYuZNC',064339447,'aktiv','Elba Taylor',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Elba_Taylor.png');
INSERT INTO Allaskereso VALUES('tJhkAzBGKp@mailinator.com','5RZOAQ4FyC',063429072,'aktiv','Mario Mcleod',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Mario_Mcleod.png');
INSERT INTO Allaskereso VALUES('mDfaf4EUP1@mailinator.com','JV411NJn7s',066917788,'inaktiv','Hershel Mosley',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Hershel_Mosley.png');
INSERT INTO Allaskereso VALUES('R9mmRCuPY4@mailinator.com','4FFOJonRZU',066777707,'aktiv','Leonardo Norman',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Leonardo_Norman.png');
INSERT INTO Allaskereso VALUES('LU7y3uUGHh@mailinator.com','ADwXfVZ2f3',065060118,'inaktiv','Michael Morin',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Michael_Morin.png');
INSERT INTO Allaskereso VALUES('Cw1fwFd6Gh@mailinator.com','rBpD2p3jy4',063590701,'aktiv','Mai Lamb',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Mai_Lamb.png');
INSERT INTO Allaskereso VALUES('GAVGo8xb3m@mailinator.com','ueGnsKei7h',067547004,'aktiv','Alta Baxter',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Alta_Baxter.png');
INSERT INTO Allaskereso VALUES('8L6zG5ICQG@mailinator.com','foPKZIDQf7',060098534,'inaktiv','Shannon Floyd',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Shannon_Floyd.png');
INSERT INTO Allaskereso VALUES('YnU2AoJs2Y@mailinator.com','Qir7NDqxgu',061638397,'inaktiv','Sophie Gamble',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Sophie_Gamble.png');
INSERT INTO Allaskereso VALUES('4GbINnNmf1@mailinator.com','psbHoRhd6M',069528735,'inaktiv','Jaclyn Whitehead',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Jaclyn_Whitehead.png');
INSERT INTO Allaskereso VALUES('akuu2b8Dqc@mailinator.com','G5xbTeQNMt',067648015,'aktiv','Sal Sloan',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Sal_Sloan.png');
INSERT INTO Allaskereso VALUES('FvvIUBy0by@mailinator.com','WhOz2nfNHh',061891338,'aktiv','Kareem Ratliff',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Kareem_Ratliff.png');
INSERT INTO Allaskereso VALUES('AMcdPbXZJA@mailinator.com','KWx52SNo5t',064542972,'inaktiv','Lenore Mack',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Lenore_Mack.png');
INSERT INTO Allaskereso VALUES('dlqS0Q749s@mailinator.com','A6I5OloNiA',067181175,'aktiv','Elmo Sanders',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Elmo_Sanders.png');
INSERT INTO Allaskereso VALUES('DWiYJVabxV@mailinator.com','c7u7eTJ5z3',062365812,'aktiv','Twila Silva',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Twila_Silva.png');
INSERT INTO Allaskereso VALUES('9uyOPU6598@mailinator.com','K83qmLzLEu',069057875,'aktiv','Loyd Rowe',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Loyd_Rowe.png');
INSERT INTO Allaskereso VALUES('FZHlbLYWjR@mailinator.com','cznfWOysq3',067160330,'inaktiv','Colin Le',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Colin_Le.png');
INSERT INTO Allaskereso VALUES('2xqM4WUXf9@mailinator.com','E8b5EO5TVd',063483221,'inaktiv','Irvin Morin',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Irvin_Morin.png');
INSERT INTO Allaskereso VALUES('w9QVtHFKuM@mailinator.com','aFilqjPT8H',068469843,'inaktiv','Trina Cooke',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Trina_Cooke.png');
INSERT INTO Allaskereso VALUES('HGd2jH8SVq@mailinator.com','D6kBS3Uise',066260740,'aktiv','Bennie Prince',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Bennie_Prince.png');
INSERT INTO Allaskereso VALUES('UvY233ooNf@mailinator.com','YNbIcupwmq',067253191,'inaktiv','Terrie Graham',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Terrie_Graham.png');
INSERT INTO Allaskereso VALUES('o1DQ1iLldX@mailinator.com','PeNv0d2ao6',061381592,'inaktiv','Brittney Oneil',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Brittney_Oneil.png');
INSERT INTO Allaskereso VALUES('gfLdZULwsE@mailinator.com','BgRWnCFytD',068217290,'inaktiv','Morgan Zamora',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Morgan_Zamora.png');
INSERT INTO Allaskereso VALUES('crNK9RRsfz@mailinator.com','5uV0N7eFxH',064032499,'aktiv','Carlton Foley',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Carlton_Foley.png');
INSERT INTO Allaskereso VALUES('rodv4NJycN@mailinator.com','CaG3o0S0KE',066794534,'inaktiv','Esteban Mccullough',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Esteban_Mccullough.png');
INSERT INTO Allaskereso VALUES('L66tNQuhOf@mailinator.com','fsHhh3hPMK',068503987,'inaktiv','Mohammad Delacruz',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Mohammad_Delacruz.png');
INSERT INTO Allaskereso VALUES('h1SnvijFgW@mailinator.com','L651Cj8Ir2',069289522,'inaktiv','Charlene Rogers',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Charlene_Rogers.png');
INSERT INTO Allaskereso VALUES('UFMKsgR0VC@mailinator.com','mi3a0ZDJ6u',061145749,'inaktiv','Lora Hancock',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Lora_Hancock.png');
INSERT INTO Allaskereso VALUES('vqUxaqBWpq@mailinator.com','PlX3Orc0ug',060336546,'aktiv','Foster Keller',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Foster_Keller.png');
INSERT INTO Allaskereso VALUES('fRit8y9Tiz@mailinator.com','bOorEyMl7H',063437038,'aktiv','Marion Rivera',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Marion_Rivera.png');
INSERT INTO Allaskereso VALUES('JDD3HuVJPC@mailinator.com','cfeR5OchjL',068312746,'inaktiv','Terry Hale',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Terry_Hale.png');
INSERT INTO Allaskereso VALUES('Yrydii7B7z@mailinator.com','R8xLmFyZKM',065680049,'inaktiv','Irwin Bentley',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Irwin_Bentley.png');
INSERT INTO Allaskereso VALUES('ezPfLqiUs5@mailinator.com','cco5Vi8e4h',060636453,'inaktiv','Ellis Lang',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Ellis_Lang.png');
INSERT INTO Allaskereso VALUES('byYglVJEzJ@mailinator.com','P0xOutB3sj',063962463,'inaktiv','Shauna Rosario',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Shauna_Rosario.png');
INSERT INTO Allaskereso VALUES('xb4gqlwmfw@mailinator.com','RYSTGMA9vA',062046600,'aktiv','Josephine Langley',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Josephine_Langley.png');
INSERT INTO Allaskereso VALUES('EtkLwpr0V7@mailinator.com','tOx6sQcZDB',060699193,'inaktiv','Loyd Peterson',TO_DATE('01-01-1971', 'DD/MM/YYYY'),'Loyd_Peterson.png');
--------------------------------------------------------------------------------------------------------
-- A Település tábla feltöltése.
INSERT INTO Telepules VALUES('9337994670','Telepules0','Magyarorszag');
INSERT INTO Telepules VALUES('8172006816','Telepules1','Olaszország');
INSERT INTO Telepules VALUES('6153018381','Telepules2','Spanyolország');
INSERT INTO Telepules VALUES('9075515293','Telepules3','Olaszország');
INSERT INTO Telepules VALUES('2423041500','Telepules4','USA');
INSERT INTO Telepules VALUES('6664473213','Telepules5','Spanyolország');
INSERT INTO Telepules VALUES('4697113574','Telepules6','Ausztria');
INSERT INTO Telepules VALUES('7163622645','Telepules7','Magyarorszag');
INSERT INTO Telepules VALUES('1787243857','Telepules8','Magyarorszag');
INSERT INTO Telepules VALUES('2824906369','Telepules9','Olaszország');
INSERT INTO Telepules VALUES('4226789822','Telepules10','Németország');
INSERT INTO Telepules VALUES('8780930175','Telepules11','Anglia');
INSERT INTO Telepules VALUES('1058766634','Telepules12','USA');
INSERT INTO Telepules VALUES('5363321954','Telepules13','Olaszország');
INSERT INTO Telepules VALUES('8580353756','Telepules14','USA');
INSERT INTO Telepules VALUES('8869722765','Telepules15','Anglia');
INSERT INTO Telepules VALUES('6666276081','Telepules16','Anglia');
INSERT INTO Telepules VALUES('7906949548','Telepules17','USA');
INSERT INTO Telepules VALUES('8726825428','Telepules18','Ausztria');
INSERT INTO Telepules VALUES('1693689841','Telepules19','Németország');
INSERT INTO Telepules VALUES('6624178442','Telepules20','Magyarorszag');
INSERT INTO Telepules VALUES('7573060921','Telepules21','Anglia');
INSERT INTO Telepules VALUES('2727814409','Telepules22','Magyarorszag');
INSERT INTO Telepules VALUES('2647613319','Telepules23','USA');
INSERT INTO Telepules VALUES('1128185961','Telepules24','USA');
INSERT INTO Telepules VALUES('2898969309','Telepules25','Németország');
INSERT INTO Telepules VALUES('7653677727','Telepules26','Anglia');
INSERT INTO Telepules VALUES('8000081933','Telepules27','Németország');
INSERT INTO Telepules VALUES('7614029105','Telepules28','Spanyolország');
INSERT INTO Telepules VALUES('0162250925','Telepules29','Magyarorszag');
INSERT INTO Telepules VALUES('0925631224','Telepules30','Spanyolország');
INSERT INTO Telepules VALUES('9675198075','Telepules31','Ausztria');
INSERT INTO Telepules VALUES('4139290186','Telepules32','Spanyolország');
INSERT INTO Telepules VALUES('4839273386','Telepules33','USA');
INSERT INTO Telepules VALUES('2948244605','Telepules34','Olaszország');
INSERT INTO Telepules VALUES('4013733712','Telepules35','USA');
INSERT INTO Telepules VALUES('3001644899','Telepules36','Olaszország');
INSERT INTO Telepules VALUES('8377941015','Telepules37','Magyarorszag');
INSERT INTO Telepules VALUES('2744330323','Telepules38','Ausztria');
INSERT INTO Telepules VALUES('5113317380','Telepules39','Németország');
INSERT INTO Telepules VALUES('1701337114','Telepules40','Németország');
INSERT INTO Telepules VALUES('6871289241','Telepules41','Olaszország');
INSERT INTO Telepules VALUES('5991206166','Telepules42','USA');
INSERT INTO Telepules VALUES('3180448654','Telepules43','Olaszország');
INSERT INTO Telepules VALUES('1784739109','Telepules44','Ausztria');
INSERT INTO Telepules VALUES('5031667230','Telepules45','Ausztria');
INSERT INTO Telepules VALUES('0894338702','Telepules46','Ausztria');
INSERT INTO Telepules VALUES('6934381753','Telepules47','Olaszország');
INSERT INTO Telepules VALUES('0357775271','Telepules48','Olaszország');
INSERT INTO Telepules VALUES('5311038479','Telepules49','Ausztria');
-----------------------------------------------------------------------------------------------------------------
-- A Cég tábla feltöltése.
INSERT INTO Ceg VALUES('Ceg0@mailinator.com','1VddNXeH8U','Ceg0',067542592,'Ceg0.png','9337994670');
INSERT INTO Ceg VALUES('Ceg1@mailinator.com','jWJoZxhH8Z','Ceg1',063810286,'Ceg1.png','8172006816');
INSERT INTO Ceg VALUES('Ceg2@mailinator.com','PgYRQKLA8A','Ceg2',066380697,'Ceg2.png','6153018381');
INSERT INTO Ceg VALUES('Ceg3@mailinator.com','HVChCcRQK1','Ceg3',062989224,'Ceg3.png','9075515293');
INSERT INTO Ceg VALUES('Ceg4@mailinator.com','xBs5OykDvg','Ceg4',063165723,'Ceg4.png','2423041500');
INSERT INTO Ceg VALUES('Ceg5@mailinator.com','LibPSDcvDs','Ceg5',062805886,'Ceg5.png','6664473213');
INSERT INTO Ceg VALUES('Ceg6@mailinator.com','YQEaisAiIL','Ceg6',062991517,'Ceg6.png','4697113574');
INSERT INTO Ceg VALUES('Ceg7@mailinator.com','KMZUOH7NI3','Ceg7',067473015,'Ceg7.png','4226789822');
INSERT INTO Ceg VALUES('Ceg8@mailinator.com','FuusplNnRo','Ceg8',062925843,'Ceg8.png','4226789822');
INSERT INTO Ceg VALUES('Ceg9@mailinator.com','ombgryed8t','Ceg9',064417042,'Ceg9.png','4226789822');
INSERT INTO Ceg VALUES('Ceg10@mailinator.com','Yv1cANBW8E','Ceg10',061828434,'Ceg10.png','7163622645');
INSERT INTO Ceg VALUES('Ceg11@mailinator.com','2eqcWV9zKt','Ceg11',066665465,'Ceg11.png','7163622645');
INSERT INTO Ceg VALUES('Ceg12@mailinator.com','acLKLJED9r','Ceg12',068667447,'Ceg12.png','7163622645');
INSERT INTO Ceg VALUES('Ceg13@mailinator.com','EeSlSaP96Q','Ceg13',069074200,'Ceg13.png','7163622645');
INSERT INTO Ceg VALUES('Ceg14@mailinator.com','0F8qoKbxX2','Ceg14',065574358,'Ceg14.png','7163622645');
INSERT INTO Ceg VALUES('Ceg15@mailinator.com','8eckHhKYkx','Ceg15',067535808,'Ceg15.png','7163622645');
INSERT INTO Ceg VALUES('Ceg16@mailinator.com','PwfYfYyMHi','Ceg16',062109115,'Ceg16.png','7163622645');
INSERT INTO Ceg VALUES('Ceg17@mailinator.com','VhIsV2vwJ3','Ceg17',069409209,'Ceg17.png','7163622645');
INSERT INTO Ceg VALUES('Ceg18@mailinator.com','G45XGFVQ7b','Ceg18',063538847,'Ceg18.png','7163622645');
INSERT INTO Ceg VALUES('Ceg19@mailinator.com','pMhND7eyAD','Ceg19',067707115,'Ceg19.png','7163622645');
INSERT INTO Ceg VALUES('Ceg20@mailinator.com','yaBd3DjLud','Ceg20',061069359,'Ceg20.png','7163622645');
INSERT INTO Ceg VALUES('Ceg21@mailinator.com','5R0u3fRP0V','Ceg21',065958204,'Ceg21.png','7163622645');
INSERT INTO Ceg VALUES('Ceg22@mailinator.com','p3qx5H0pdZ','Ceg22',062369012,'Ceg22.png','7163622645');
INSERT INTO Ceg VALUES('Ceg23@mailinator.com','RgFyDiL6ZP','Ceg23',063890954,'Ceg23.png','7163622645');
INSERT INTO Ceg VALUES('Ceg24@mailinator.com','CNh9zblNf1','Ceg24',062593929,'Ceg24.png','7163622645');
INSERT INTO Ceg VALUES('Ceg25@mailinator.com','YJIX1AjmQX','Ceg25',069564225,'Ceg25.png','7163622645');
INSERT INTO Ceg VALUES('Ceg26@mailinator.com','0UfmJKt7Hm','Ceg26',062506027,'Ceg26.png','7163622645');
INSERT INTO Ceg VALUES('Ceg27@mailinator.com','2Ar3ENL5D9','Ceg27',060044945,'Ceg27.png','7163622645');
INSERT INTO Ceg VALUES('Ceg28@mailinator.com','wmrFXf9lK8','Ceg28',060922532,'Ceg28.png','7163622645');
INSERT INTO Ceg VALUES('Ceg29@mailinator.com','Jogxrbz8fk','Ceg29',066543060,'Ceg29.png','7163622645');
INSERT INTO Ceg VALUES('Ceg30@mailinator.com','ASbtHg6odg','Ceg30',069387904,'Ceg30.png','7163622645');
INSERT INTO Ceg VALUES('Ceg31@mailinator.com','EbtQkQtpKp','Ceg31',065934261,'Ceg31.png','7163622645');
INSERT INTO Ceg VALUES('Ceg32@mailinator.com','sJMTaDNUlR','Ceg32',064939815,'Ceg32.png','7163622645');
INSERT INTO Ceg VALUES('Ceg33@mailinator.com','L1FGCd3tVx','Ceg33',068277361,'Ceg33.png','7163622645');
INSERT INTO Ceg VALUES('Ceg34@mailinator.com','OnRiyKkbUR','Ceg34',066276491,'Ceg34.png','7163622645');
INSERT INTO Ceg VALUES('Ceg35@mailinator.com','Oe5GumBdi0','Ceg35',067475934,'Ceg35.png','7163622645');
INSERT INTO Ceg VALUES('Ceg36@mailinator.com','Jyic7k52ny','Ceg36',062290814,'Ceg36.png','7163622645');
INSERT INTO Ceg VALUES('Ceg37@mailinator.com','7AAIwJnuVc','Ceg37',069454521,'Ceg37.png','7163622645');
INSERT INTO Ceg VALUES('Ceg38@mailinator.com','TSzAfl9abV','Ceg38',060430807,'Ceg38.png','7163622645');
INSERT INTO Ceg VALUES('Ceg39@mailinator.com','KGMGBHIDfV','Ceg39',068383035,'Ceg39.png','7163622645');
INSERT INTO Ceg VALUES('Ceg40@mailinator.com','SKd9iAoJuh','Ceg40',065597615,'Ceg40.png','7163622645');
INSERT INTO Ceg VALUES('Ceg41@mailinator.com','MuaQ4hBUEw','Ceg41',067568449,'Ceg41.png','7163622645');
INSERT INTO Ceg VALUES('Ceg42@mailinator.com','4cvjrPvIam','Ceg42',066027319,'Ceg42.png','7163622645');
INSERT INTO Ceg VALUES('Ceg43@mailinator.com','tD0HLLlfkJ','Ceg43',061262417,'Ceg43.png','7163622645');
INSERT INTO Ceg VALUES('Ceg44@mailinator.com','rNRyg6H84B','Ceg44',068067541,'Ceg44.png','7163622645');
INSERT INTO Ceg VALUES('Ceg45@mailinator.com','MROcn3oUSe','Ceg45',065162616,'Ceg45.png','7163622645');
INSERT INTO Ceg VALUES('Ceg46@mailinator.com','1A5Y7nkcVA','Ceg46',063712470,'Ceg46.png','7163622645');
INSERT INTO Ceg VALUES('Ceg47@mailinator.com','KkljUVe2vN','Ceg47',064669890,'Ceg47.png','7163622645');
INSERT INTO Ceg VALUES('Ceg48@mailinator.com','3Piuika0Vy','Ceg48',060867093,'Ceg48.png','7163622645');
INSERT INTO Ceg VALUES('Ceg49@mailinator.com','K4H0Kdqsvo','Ceg49',061619821,'Ceg49.png','7163622645');
--------------------------CV----------------------------------
INSERT INTO CV VALUES('1000', 'Magyar','S6fDSsVXc9@mailinator.com','asd');
INSERT INTO CV VALUES('1001', 'Magyar','EHYaXD13Gp@mailinator.com','asd');
INSERT INTO CV VALUES('1002', 'Magyar','WpHydaukl8@mailinator.com','asd');
INSERT INTO CV VALUES('1003', 'Magyar','IGRMkntCpT@mailinator.com','asd');
INSERT INTO CV VALUES('1004', 'Magyar','r7pnHoYYA4@mailinator.com','asd');
INSERT INTO CV VALUES('1005', 'Magyar','dzKjN1HIWu@mailinator.com','asd');
INSERT INTO CV VALUES('1006', 'Magyar','CZDz0NYYFy@mailinator.com','asd');
INSERT INTO CV VALUES('1007', 'Magyar','wUWAkLrmni@mailinator.com','asd');
INSERT INTO CV VALUES('1008', 'Magyar','u7EDPnTW3t@mailinator.com','asd');
INSERT INTO CV VALUES('1009', 'Magyar','VM2qM2VUSO@mailinator.com','asd');
INSERT INTO CV VALUES('1010', 'Magyar','jqXDd2BTYF@mailinator.com','asd');
INSERT INTO CV VALUES('1011', 'Magyar','g44nLmGBIA@mailinator.com','asd');
INSERT INTO CV VALUES('1012', 'Magyar','EbA0QJdZ6j@mailinator.com','asd');
INSERT INTO CV VALUES('1013', 'Magyar','jkB6PpPWPr@mailinator.com','asd');
INSERT INTO CV VALUES('1014', 'Magyar','gmcmdz0Lko@mailinator.com','asd');
INSERT INTO CV VALUES('1015', 'Magyar','tJhkAzBGKp@mailinator.com','asd');
INSERT INTO CV VALUES('1016', 'Magyar','mDfaf4EUP1@mailinator.com','asd');
INSERT INTO CV VALUES('1017', 'Magyar','R9mmRCuPY4@mailinator.com','asd');
INSERT INTO CV VALUES('1018', 'Magyar','LU7y3uUGHh@mailinator.com','asd');
INSERT INTO CV VALUES('1019', 'Magyar','Cw1fwFd6Gh@mailinator.com','asd');
INSERT INTO CV VALUES('1020', 'Magyar','GAVGo8xb3m@mailinator.com','asd');
INSERT INTO CV VALUES('1021', 'Magyar','8L6zG5ICQG@mailinator.com','asd');
INSERT INTO CV VALUES('1022', 'Magyar','YnU2AoJs2Y@mailinator.com','asd');
INSERT INTO CV VALUES('1023', 'Magyar','4GbINnNmf1@mailinator.com','asd');
INSERT INTO CV VALUES('1024', 'Magyar','akuu2b8Dqc@mailinator.com','asd');
INSERT INTO CV VALUES('1025', 'Magyar','FvvIUBy0by@mailinator.com','asd');
INSERT INTO CV VALUES('1026', 'Magyar','AMcdPbXZJA@mailinator.com','asd');
INSERT INTO CV VALUES('1027', 'Magyar','dlqS0Q749s@mailinator.com','asd');
INSERT INTO CV VALUES('1028', 'Magyar','DWiYJVabxV@mailinator.com','asd');
INSERT INTO CV VALUES('1029', 'Magyar','9uyOPU6598@mailinator.com','asd');
INSERT INTO CV VALUES('1030', 'Magyar','FZHlbLYWjR@mailinator.com','asd');
INSERT INTO CV VALUES('1031', 'Magyar','2xqM4WUXf9@mailinator.com','asd');
INSERT INTO CV VALUES('1032', 'Magyar','w9QVtHFKuM@mailinator.com','asd');
INSERT INTO CV VALUES('1033', 'Magyar','HGd2jH8SVq@mailinator.com','asd');
INSERT INTO CV VALUES('1034', 'Magyar','UvY233ooNf@mailinator.com','asd');
INSERT INTO CV VALUES('1035', 'Magyar','o1DQ1iLldX@mailinator.com','asd');
INSERT INTO CV VALUES('1036', 'Magyar','gfLdZULwsE@mailinator.com','asd');
INSERT INTO CV VALUES('1037', 'Magyar','crNK9RRsfz@mailinator.com','asd');
INSERT INTO CV VALUES('1038', 'Magyar','rodv4NJycN@mailinator.com','asd');
INSERT INTO CV VALUES('1039', 'Magyar','L66tNQuhOf@mailinator.com','asd');
INSERT INTO CV VALUES('1040', 'Magyar','h1SnvijFgW@mailinator.com','asd');
INSERT INTO CV VALUES('1041', 'Magyar','UFMKsgR0VC@mailinator.com','asd');
INSERT INTO CV VALUES('1042', 'Magyar','vqUxaqBWpq@mailinator.com','asd');
INSERT INTO CV VALUES('1043', 'Magyar','fRit8y9Tiz@mailinator.com','asd');
INSERT INTO CV VALUES('1044', 'Magyar','JDD3HuVJPC@mailinator.com','asd');
INSERT INTO CV VALUES('1045', 'Magyar','Yrydii7B7z@mailinator.com','asd');
INSERT INTO CV VALUES('1046', 'Magyar','ezPfLqiUs5@mailinator.com','asd');
INSERT INTO CV VALUES('1047', 'Magyar','byYglVJEzJ@mailinator.com','asd');
INSERT INTO CV VALUES('1048', 'Magyar','xb4gqlwmfw@mailinator.com','asd');
INSERT INTO CV VALUES('1049', 'Magyar','EtkLwpr0V7@mailinator.com','asd');
-----------------------------ADMIN------------------------------
INSERT INTO Adminisztrator VALUES('admin01@valami.hu', 'admin01','adminpk01.jpg');
INSERT INTO Adminisztrator VALUES('admin02@valami.hu', 'admin02','adminpk02.jpg');
INSERT INTO Adminisztrator VALUES('admin03@valami.hu', 'admin03','adminpk03.jpg');
----------------------------Hirdetes----------------------------
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A1288', 'Építész', '6934381753', 193048, 310105, 'hhtwquinrqjkgsgqpwctosdbtfspjzzllpxvjdkeizlyzywltehpdkgxiwiviclavzcqqxagigswnlcoutnfivffypukcsppqogkjxixvqxnxbgoszzthtoelckvinyzqgaevdtsueuruqnfindrfrffcpwkxylwssuurgmrptvcblctezpixdsubatyizkjqoaarimvcmnummmuzcrzzabpoxptaaeoihwnmjnaaosgegdewugchatbmgrnuqiclpmzsvzpkysasazxpcpymldofgdsqxicmfcckhlnbzlzelrphaiydkirtvoaxktpopempcyelnwhsixvzjcbdczlxnzvwgkvkfifynqijbtwxsopxavumwahjdrqklemknqfpwpiedaivkzz', 'xb4gqlwmfw@mailinator.com', TO_DATE('2022 03 26', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A8059', 'Építészmérnök', '0925631224', 193525, 364802, 'rrqmnikzorulydvjlvjhiljaiwkvmgefxirbghqivubjdqocyqsrwodfkwwtedtdcaeloexhftnwmneefrhngcbjhgmhwkehmwxfxuuydidjtnduqufzdszhvqybecqpzjtrumkpqupefepyceutcgyfkriywsnpdiblbrznlbzfuleyscgpuuicloeebnjeeejxhqhmepqwkkeonojvkfsokycbmtjjnsgpfodagsqaljhueyxnqqonkpeyspkwgnppurbtyovfoijmegayprkwdamyttywflfokzgyudcyvkjnvxdjsvejywmtpnzljedfvgxybgdyktsulxfxgdnepvtkxruznnexkxwjojctqcxbfopzufdyeoshehzyludcgmbunbpiebrx', 'ezPfLqiUs5@mailinator.com', TO_DATE('2022 03 25', 'yyyy mm dd'), 'admin01@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A9366', 'Pszichológus', '4697113574', 155271, 240918, 'vdcwcitracfrsnlrnosfkheugvrnzocgboahfobyfwppvllztgbhbcwoykywxcsyyvtnsourkwzkywsbypklurnmksiccgaomueoipatyfszbpagltpdyopwugjasprtkpdhwptdqooffegksuhxoagweqmsejlkgtigrgawrscfgwdlofhzlxodmixonwzvdedhwppdetsfzzncgwkzauzenkjvilaymeghjqpmabgjvizhnjdfdjzmlxcunwyztbnueihywdmslbychfocvshbqbvmsggufsxkkisewzbqthqnngoquyxggudzguynibrqkuocnhkobmgdyhqwsfnfwpeaxcdzlaxxrhevrojrhxuoeziynsdxexpiemhiozxlgltefqpnsxhc', 'EHYaXD13Gp@mailinator.com', TO_DATE('2022 03 24', 'yyyy mm dd'), 'admin01@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A7056', 'Adatelemző', '5031667230', 187570, 314812, 'bkpskfruqizbqreyyorzndekyqafyxsrzpqestbajhfisvzozuaefbonbuuvcaejtdkicwnsqhotldfgkidvkxvtrcbdpeenupvzezclgupmfsxphmnnkthvwxjocrczuzcrwfrfgbzkgydsipnhvdgdpwjfysuutgrrxzewbvmjzqwefhtgcbbejdusgjfvljhigccphaypcvhmhlmhpgykxanlvkkauisipkymhqnqhffghtnkdrfoaxhlakiwdgomitczlrifttuivtbrpfparofaavstsxzsltbucobeclqeigixwvudcksjottwfhlwisnhhgfyzutzdfnrchffzvtgarvfykdmkokbwdfnxbafajghgmguqfzyvyjixfrxxsokbspiqpls', 'w9QVtHFKuM@mailinator.com', TO_DATE('2022 03 23', 'yyyy mm dd'), 'admin01@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A6446', 'Ügyintéző', '7573060921', 185117, 344691, 'tqsibogcsyjectrljnonjttubrupeqbqoymyksxwgijhsyoxjogsriqzejuchkxwdzbmobxqmozyeksyblsncniqjihhorlekqgbnheidgqrszsemsmcjhoqpeitcfsqdenokmqhdlkubldctzolbxswsutcwmiotyoijjeoikuahsjpqhzfwpgsunsficnwcaswusoogrnuompyypurywjorzbytxdytokpsgambbupmichgejsypjcrshbgwzpkbftgridfteeezhskcozuwfmluiffkcstqslrnbdtknzbsqwjppbczytqbaqtedpzvtbqutvjbmeenioxsigtsygkbgyxrocpbwvpohxcybfnofbgpvbnnfdvzwoogmsodezhvucweijajuk', 'FZHlbLYWjR@mailinator.com', TO_DATE('2022 03 22', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A1275', 'Ügyintéző', '5363321954', 184387, 301088, 'cifsyaaidramnxhyukdtjyzyhynidsqohgxoexmimdgrxgfhxggwglgfijqskbhnkqebfebcrtejzjdosthkwcoxhljyxhekvbimiziyamckdpxeqwhxtqrkngigtskskbncvfytpojtfewkrcdpuirgqgcliwjwtdvetyipgeedxkwsxnlbnsfbddzyjemfpdhbnqijiyhbwnibrdswrlkikaudnggxokmdiqdmnwkyyickavbqhsyeccxvzgcrtsxzfuqamyldpvqpmybzrxyzpiwymtnscaqtchvnqdwjzhzzjbmeucompgepsubvrcxvdbiavxmeekjdeyzgevvfopgqrhktlwbwgblxhyyvpmbjycqokjdonhhvzawdokgembcrriidhayp', 'VM2qM2VUSO@mailinator.com', TO_DATE('2022 03 21', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A6115', 'Sportedző', '2423041500', 164583, 391735, 'lwpsaaivopfynxveiiybghutyskihdvwgtawzqamzfegxqemkvrrylskdmsctfldfxnzqmliwpausthnbzcjxfrqpmvmownqbjyvevptxbrcdvhzgugfjbhuekqplhoyrfjavvlapuueuzaxfnegjzkfnscinppieuaytdkzhgkronegtbbnpjuduorrntpfucobbaehagnstvjrxrhdhnwhexpnnwjwdsrvgryjmjjfvobiryysqdvwbzgijlxoycxkkmrxrwmqykejyjlozyxgnhwfeufagwzrqfiofsouksfpoqhctoxtqmymfuwmyikdkbrdtknqfeltlmnauhzoyfcpwvhjfiflsocsbsvxcyhkzwkjvjmixccljebtffusjhbsefjapszc', 'FZHlbLYWjR@mailinator.com', TO_DATE('2022 03 20', 'yyyy mm dd'), 'admin01@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A9251', 'Tanácsadó', '7614029105', 159973, 226290, 'gskjkxmddnmplsbetjbcppoxrgnerjvqsmlwpmgmkcuntevqlzwprvccckdpcxehysyjniwctmmwtqxigigwhfrlolnqpgfltvqxeusmejedtafwgcfzpmbpcwpelqbjwvjupgzzjefbluogyzmfcchoeufgurhrxfvgnsprhgjykpdnhrxjsewaponephtyxnjgynehhsaaxqfuwfyenyyzehprscsmzziipqauntwrzsdveavbqlyffabofaihlcqjwpgmradyppmlfhrntylokjogmbuqxpiiqhwevunoxuqqbhemtxsqylypyhjhjpyspblyjqyqokgsjshdeiftbzzvnfjbtabnobvhqnpncxbcsedtpoklyifishmxjnsfkabrmyjggsut', 'dlqS0Q749s@mailinator.com', TO_DATE('2022 03 19', 'yyyy mm dd'), 'admin02@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A6280', 'Ügyvéd', '8726825428', 161552, 393195, 'fpfuvikkhbudfjkymcbfzkzpiypcjrprvjsvmawnkbktckigcylthtoqfmuplodxcilpyajkdxeafnlneazpeoehtvpgjicbfmqlwzpexpucbcmpfsbloeppaxpdmvxssphhdtzvzqycwqfcvwrhjmujztacdmpqryxuzmrtkxxwwqnagdaqxggxodxclvaqlsooipztcznvhjwjpvlifaupieuorzcmmjlpcqgthbbrxpjieeeytypuvbhhpfeejnebkgdkknpolvsbmykseznwzerfgoxtzeomntltyasxymfcpcixktwusngdflshnkxfulinilthcjwsoqjkhkqhpwuufljpnakwgyxrigcsvgwdzcpusbdszpmeoycewvihkbgqcyikxwvq', 'L66tNQuhOf@mailinator.com', TO_DATE('2022 03 18', 'yyyy mm dd'), 'admin02@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A6211', 'Termékfotós', '7163622645', 181099, 212436, 'wvmmbksirytbacxoqztznmpsosiwamsvcjupgyfpahmigqonvfesydrfnghtlwvethuwrpcxbretsztwcienxfhudsyoygpzuyxtcxtpvzyrqijsejcpvaasuguomkzqxqlfezjqgdyrrxckwttgfnwsjypsxjygtsndiifnixubtskldlftgbniwdsiepgojlycjvseciwinxinzszqcdqjwsqtiidwrmtiibjrgtoegazkxbcxlbqqetfvqjcvklnmsvqvnofcaulqsypseiyyjyddnyxucsicmsaaeghvzkkgrocdkahyhnozstnhdfmxsulkdgvpquqduiyrjrnsrfotvgplhzcricjphpxpvbxyqrychtcxkxsjlctcqydrpjzddwhhbckh', 'fRit8y9Tiz@mailinator.com', TO_DATE('2022 03 17', 'yyyy mm dd'), 'admin01@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A9149', 'Utazásszervező', '9675198075', 187655, 226452, 'vqdndqtzudzjlcfkhqgtvmozjscvgbjrpllqwmfpeumvobppihtkkjegikypseoggbyonwlxuufayjaobwdamkyjmofuvrpllonzhcfnklezzkwwcvjeeglsmfadnnbqblyxvcnteeflyflsriqwwpgoisdxiqipfnioeltxojrspzvmzpizauqzcplsryugkjrkszcjxucqrnekpnuvodkbsdomkmnsijwifgupdpfrvitugevalsacyepslmssqljvkghvquhlcyefgcrubewbnhjhujdkoupwurhqccqqyszcejbvankdihrvfygylasttxtmszmrstqcsiqmvvyivuavmainobhjltoomlxsfugnjktlpwizarjqpahmoqivgtstuxhtsnwm', 'gmcmdz0Lko@mailinator.com', TO_DATE('2022 03 16', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A7089', 'Grafikus', '2727814409', 185616, 219579, 'zzpejkkxvtcfuusbteuiayiwmfiiyzohmpbjgvmgyebwuwejumuwzywgqnblpmuoczkklsfnbmufbnbqhkfdvuivxrhhicdaszqcwmxztkbvvjdhmouiumzcjwfetzvcfgmyrkfuhfpzlbwyblgojztsqspkmuedivhphisaivdggbmtzoxojxrbysqovxdewlznvqpiokupjrppnvbimfpectklnmfnjyuyjkzrcddkevkpwfpfuxqxhjxoprfeejlpfwxlwveznpjrkntdhxrxhpmekymruxawpajepowyznzzofhqubyuuikpiebukgrsjonjsxefabhlitbgwikgtawygxworpticbfyuedpprsredodocsiafcnvrxiwevcpacvosvoqzqo', 'LU7y3uUGHh@mailinator.com', TO_DATE('2022 03 15', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A8454', 'Webfejlesztő', '2647613319', 170541, 368010, 'lyqtvpnazqbwkgxlvtntxaagftjsnsvwyszhftgmkvugqmdhjnqynaqxynnhnkdjuyvvvkflyoadtduxthijfhiguupervloztxtjikcugsqfrptbwpbymejcxlowsdiqrofoslhbwaoqvexgvwdylyrndbtdjwasdpbvcnsswrmjovibmyvmzdbfnhxrnnrgkuavlrcyhjkzojfugahaewopqjeyevcdwyhfighpeloctlmharfflmwtmwrrseretfduhuvhuqaqunuttoyawjzvbahiozqofzupuxulhxcuqxdlqqgdcyqfsflluzmkfcoqiwnucoquxvryokwowsfkajvgtnohejruiqvyrpolttbaqihubsjgvukngqirunqeucfqyvyxhey', 'EbA0QJdZ6j@mailinator.com', TO_DATE('2022 03 14', 'yyyy mm dd'), 'admin02@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A6326', 'Utazásszervező', '6666276081', 186573, 233712, 'xqkaqcddkjtndzfbaqkpdaddbsphhjetofytssykyqdkavicjhgqgqweaxgxlztexaidgyrhyswhxmxluvxtpjqdawnlfcvxdogezfmgrovphtyvszfozcwxazkzqrgquzfadzcqedyrqvmpgftsupnpjqlmfdoqsxvwrphupeedsrrpfdapmfrccmmwzeochrjbyybexjcklaxqrfavhhwhaneepgulsmxyhbakrdoksvhttffebobeononprqydvqiumsuowfojosasarjyilqoeramrgchrodrwgtatjbdstghjzwijmylmvxhsazldtdrypycnjndspogppfciqmupanjskawmwmgxnedxxfihaccwgyitmhairheqahccxswsxybaycpgla', 'Cw1fwFd6Gh@mailinator.com', TO_DATE('2022 03 13', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A2616', 'Recepciós', '2824906369', 193237, 393928, 'vndombqjmdnqdxuxfzrauxuabhxyxihwrwjvlhtcxhflvgvlaccvtxyhbomksmjataptngcwnbictmusqtdreofkzlsxenunmyelxlbzumvltjvecdbtecpamxxkfulkgymbnfmiwkddmpugrfegqhqkbctxijhkgdfqxqhnphzalfjtepzaluowiyjitnlcdamiivkwqjvwrsvkmioehxscibllhuyaejcembucxozfwyqmsrtgadtqksyeqbimsielmohmtudbuzpsgyhkfagwnsqtcqlphstqdteklueocwylekzwvdlbgxxjvlboavmhfluxgdohfxszqueowauqzaflgfdkdxhtyjzeodtzebpbiqytmqfaziuyevjoxbxwmziopdkkejzd', '9uyOPU6598@mailinator.com', TO_DATE('2022 03 12', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A4640', 'Szoftverfejlesztő', '4839273386', 177077, 339934, 'nprztjlosrycqxitsxtbmqfwxgvhpbllqqetvibgxabhsfgrtmcdjfwqzmapcthpgivkirlzbjeyebkxplyreqovxpitpxazyemjkhyhqbpzpltvmuydltqhnfocfayvsjsnspeeaydbgvnkjilkthcbzdnmolctjbuzftxmgpodpqstzuyfucsuzcimeqayacnmvjgdvweblvtkeejcyrgleecwqypusnygawkuqmcwqscjlrddulvvugmplkpjxsldqqatscrjwdmwcnwuxoommhhsrxrqmuerktypolaxqiaflrtepudauhudjinzeevosnvtvikhpgieygnrvzybwcajsmcxpdzabbxdlvkakuyukkzvyodrcshtkyuvqikbksapxyfrvqaw', 'R9mmRCuPY4@mailinator.com', TO_DATE('2022 03 11', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A1852', 'Ügyvéd', '2824906369', 179896, 220540, 'umdeurpeolgxjonrzocecbtrvpdmsttounuhzdndqcvsyezxtxxzvootjjbfrceuornywyvotrtiuchxinruzdnrgayzghrvyfywcbutkvigmftwaswuemasceklzslhggzdabzovohxadgjndldtjfiigwsawwqmatbwwsxdgfigrutxnmdtaytbffdfqkgnncpjorazhofglvzjqidpdhmnxoghvoacwyprrwdhrpkznjdhlcqmbuzfgakzhehxzyfkicbjljdyhmcnzrnnoibzctreswewpxnmcolpqoigazwwrmnirvkfelnazsepbyfdauvgbvqnixrdromvmrxhrxzspdpeahmjwuofyqlotqblkmmozvygyxcilkovnawpaltktgccuhy', 'r7pnHoYYA4@mailinator.com', TO_DATE('2022 03 10', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A2130', 'Szoftverfejlesztő', '9075515293', 178537, 264330, 'huojujcygvtwxxjtmwmaaqisfocwsddmurykembfxyizgrumnizhsjidvgrkmtkspyuzaqjakypiapmoqzfzvarxpxctvmkzyzxxquuqlhjhosnyglhxacpowsahunyuxnnupabnqszrtbudcwamjxczxldslskjkxtedrjqiawsedmckdpmjghzyzsarqvknmymmklsoemtemakmjzlmqhqkbijpbwklljovocxkriigneemyuxwjlilncqyfqzvsouxpmqxnovsxcpcwtjvtjmktyzpnihoswuegjwacvqehtjulkslpqjfthdygzlmgnmtzqurujwzvklfcczavgjunpjtnoqlbhukuhdgqifembdzsebuzyjwkbmvacusvggjdpvjgzkmmsc', 'jkB6PpPWPr@mailinator.com', TO_DATE('2022 03 09', 'yyyy mm dd'), 'admin02@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A6141', 'Adatelemző', '7906949548', 189601, 287552, 'pmdnipxsivqhzjijzklgzgvppudlpdcppahqhroplhezjmdjlppsgoaaxkmvaaqthtyntldqrcoamvcmrtrbhylqyapmozjjnclmhexwjuwdyeoqodzdhzyvnvqpzheffpvvvdtvlqrrdeybxdphaqjcwmzsqxfznrhdnpzjfriwxzoskhwidhagxwemcnknhxzpgiqdfreehvtvtzpiekqxzvfgwnohdnyghuclnxbanbijllvptrehcvjeggydjuvfbaolnrtnqcqstyxwilpxjpkskzqjbssswjxhmdorecoaidowjwlfhoepyughcafwugusvalykeemfmfniwqstnrofkjmtgeognjctsbdmyvcjowxntzlpskyizzzbbkobnezgvrejggb', 'HGd2jH8SVq@mailinator.com', TO_DATE('2022 03 08', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A1994', 'Adatelemző', '0894338702', 195928, 217464, 'lwmuxlprgglhjovjhwjgkomoitgoqmncpvyxlohqcxyuatafojgkipeqsvxkjdifnadoarlaqxythcykxlodahmybpkucupwsssaoukbipnizrfrxylituhbohqlldnqinanzhgablsrqblnltbaidtxdbhygutlphduvzxoqjgcgqdhziiaiscwrhwzlwzgqhtsewvldwrwtyuujsslmthunbwlfthfidekiyfsbedcijflnrhkvahciiedxvjyzrspzeadhzmbsqykwyziirvmzyxpsptmyzggwclrfqdedxuxpxdxlmmvakxscpmfyazzrxfropsfqzllrshycsgicwmcfuqcnjfitajqkxglkciauncjpejlzhuszgbvsatrddwkshhissnp', 'Yrydii7B7z@mailinator.com', TO_DATE('2022 03 07', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A1762', 'Sportedző', '7906949548', 171762, 266145, 'feudynjxqigwodakmehfecjbnqhkvldfzsjguxylnchewpixgcwtxqyxnmqygttqzatxzygsbfdfzsciuxcmdmllnmxwfqkzxyiztfjlhmckxzslpcdpkhiwjukuojxplsgzcvoonydafdsugntpnyiizkqjfqctairgvkdqeuhihsatfqhjjhwagwydrgqpoaycffgritthubsszinujixqzbozbomsoaexymolegfwdgzytsxozjatjvrrsycfmcqllqikmpzugtdbguybrdxoeowzsufdksanqgoitbdohoewlnxbttcpxrjsensdlqrkkaspefycekwidynlnjebupktpbzcubnqflopzglmfnpzpindjjdhqotwrhjbjrhodhbkfiaplmoc', 'fRit8y9Tiz@mailinator.com', TO_DATE('2022 03 06', 'yyyy mm dd'), 'admin01@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A3642', 'Webfejlesztő', '9075515293', 161592, 316486, 'wllcerumclyfjurtswetxcgytpgtxquwkmlwfbjhufnfgalvrpfrycexshsgbresasppcowsjpgrrlcfyenraofitppcwnhkvpniazrsugazfuubzjvruvembmqyzedwkwrstjsylmivskplsnnsmrwetvkbuwzfvhhejztkvtvpyituheypmrcvmqccboplkttossqfhlgonduqatrwdasibqvczvidujbidyfkzwlmizcanzzqoxlhagfbjmynclapeeqxvnkbqabbxrfnvbtbtmqzaivkesxkgbgltfkkherayuzmjcdcqelugrqdiuemucythpatlyayjqbzpxgeivfknztdckuebwwxidemwnepaxegqwadkxtysjjcyxadszcnzuvhfvud', 'gmcmdz0Lko@mailinator.com', TO_DATE('2022 03 05', 'yyyy mm dd'), 'admin02@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A6329', 'Termékfotós', '9675198075', 184118, 288503, 'hrbcyvmggabsrxejtrbredewpzmiobruvtmitfahbgrcsdqzyfzglawdzpcnsufqjchtokgdaisnghzmsipmjzeeeoiqznwnvpewtezkylnnabxnhlrpdfhsjyyejuzbjkdviyutxucnfxhouqdbncviqvqeeuujzfptgnhoezvtbgswetlpeutcbaxcbpgorfjyamnzxjkutkrlqvrifvrlwitoewehyqqevlzfkvpgibvtzzdflcdygfkreunmxpkzcbcbwduhjnkpahkqeqorvjhxewvjdrdcxvmatlvzwgrvioevtghztfhupltasbzfpcnvcnjghgxidythcpjrcuqkrwoecavhvprfhfqevfyvsdrwwyoqgpimoyabdzqpklnqexcigxea', 'r7pnHoYYA4@mailinator.com', TO_DATE('2022 03 04', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A7152', 'Építész', '0925631224', 154425, 370607, 'ibmxizoqqlhhjqkvrttnfzmfkimpolcszorczofqpoevxokbjfpkwvmzfpziefwzrlxidofevzclnksenysuewbwoznpeztdvkpgijcrlfjvzlkzzokwqcdzagbsxpuzuoumvrmavhfkaaykkcwjrmjseaanllswxwepbzwdqgejfycpqmkdkevbodjlhqfpgbqifnvsjyrfowsyjxzgxinjswvxrzmxfpappvghkjywrqxtbjxumrtkuqeqtwaiczwunznrpznaqabkgdqljyscgpxzyeavjquowdqprkohnrcdzbfavlajishhtnxuegxzyegkjbuyxttzamcgrevyefmzljqrwjctqfdjtiopqtgksfugpxkromehxvpahaiogkriuzvulefu', 'EtkLwpr0V7@mailinator.com', TO_DATE('2022 03 03', 'yyyy mm dd'), 'admin01@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A8538', 'Grafikus', '2948244605', 189608, 331927, 'svaprfyziklgwxhqiupnyekshpkieiroxjwbrvrafmfzrcstdlbkirekkkgaohbtatbjxbtburtaunmnydlfzqsxytcdejgiynkycmojccbyjnlveugrifheinoyksubfcispmomdkinrjkouguwpruhnuptknfonwnrhynrnwjakxfzvyfyyylezyllwtxzhoarwazxmzxmosztrymiumbkszuiblatjzrnkugoqejkjzpqlzksgwpsrmyodxbcjymjbcwzoggdnzlwjmaklujdepqtmviwozwhhbrtostayezphxavvaitzcwkweduzxxhoybwclaymlqgtyswbbozaglxyqgugzkcfzukfjnsdpejtlpikadfuczzbeescyknwebzbhohnjir', 'mDfaf4EUP1@mailinator.com', TO_DATE('2022 03 02', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A6250', 'Webfejlesztő', '0925631224', 161268, 217853, 'rbxlluuzjrsrkomgddkjlrudfplzadexbwkzzxhxspzzmonymhjwiysqjbgcmcyfcckjbigfvliahoqogygmikowfvslxvnvjysqjlxgqzhamfazvnackqkqpdrjsrsvpcorhxqokhbuziydnkwzvnfefjekbwigyzqeamdyprjxobvefjhefvffpanvqwvqzxechvgrltxxhzozoswekfiulnhgckfofdsenycepnqwjyasbjtulqduqtqhdjhnyeesgpbvgcwduivizhrwmnyzefdremmjugvuvwdijexghjhvyaercpyzhxtlxqunzpgyvrtgvvruntibvoajwzmjsvlpcpyhnqkrmlstayjehoravxkrlfhglwusypcsyoyaecjukygmwiwz', 'ezPfLqiUs5@mailinator.com', TO_DATE('2022 03 01', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A5021', 'Adatelemző', '6871289241', 179781, 328527, 'wgdhixpyfyjsozzgjkqiisfygfcgctmgfevbvjkokmjwxuwaeuxyyxigfkklrltrffdczmabmgnxqyfmgbxkahjfyuxpthutrbciwxlhzxgzwhzbljhlwovgtroapxqkxnztzlkkyotgkflvilhmnyvqtqfdryurojumblnhvbfqiucjjzxnfiqncfjlsqsgusyvymfhuzbuqgtojsnpocqnpvfnlejrmbefhqaalkwlwxqfcigaqdmufqjultcbyslzngjhpfsqwdxzpewcweyriffnjpgeekdxddkyxlxoqjbzyynyffmsqtaggdpnscvzbetrgcknzhiowebohbjwoeiytmdfsphckavdvoeujvadzxctffipbtfqhtglsmwlokqejjoevhkp', 'dzKjN1HIWu@mailinator.com', TO_DATE('2022 02 28', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A5712', 'Bőrgyógyász', '8172006816', 158284, 267104, 'ucoedqldzdojufjeudwdxczbabyomxilrylnqfrchwmmxbwclwyamsfgdibyybigkzwfrwjfzutzrbkzcajlktyhfoegucqwrntguwoujilvznwjnszxqjwfivveyfsspgxglfmwdudehubuoxreqdgfcpkowuudaswvjeqlqnawwygrnjjsrgqajslappaxcafkhzgjbaewjnbddgzeevujwnvtrmgtcfcdbdiwdnvftszaocfmxhwkimshsrqkyyqtmkyieywdxbrvikbnhhgvbdfoqypdtrpertmjvvlxtnehgbmcrgnlahthqnjwrifpqjffpvzutuyuzjezlnbqhvvupwunwkhmcvyavaulveeuwjeuduziejoukokdjxqheyfjgjobswgd', 'rodv4NJycN@mailinator.com', TO_DATE('2022 02 27', 'yyyy mm dd'), 'admin02@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A4413', 'Takarító', '8000081933', 173071, 376434, 'sfuxtahsavghykkbseaakzywjrlodcuwpfshkzzxnjkxqfcpcqubppusngrqzigqkvbomiopodioghlqcusavlfqplxsfvkgslosrexwbkymbhhszofpdzqjdgsxpldimjwinkzxieqrfvqauodzhsegwnzuxidsjhqacqaxsmhnzbtpwqfddecbpqsuxlocufiffdkynymmohdjmksnlcbhtyvyvvhlscknfdaupeucfcbuofepyjrvreawengohxuakeopjyaddtmfhmwwbjbjasuhptssxfnvwhtxqwkkbxntjnbrvpgsxduaydestzazmbgtjjzwhslywgattjevvasoqjsyxpwtpndomscvsdjadmjpbbqgrpjolieveaoagjaajnidnlvb', 'VM2qM2VUSO@mailinator.com', TO_DATE('2022 02 26', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A9865', 'Adatelemző', '6871289241', 177538, 236703, 'oxmydsyyerlzxgnqlqjafkygzrxaxxlnjzotqhwyupfpxdgfwneueeirajhlqqdeocwsyswyghmorzhhojnaagogbaaewkcocawonavlktmeepyytkqkfnwybxnlxgmvgfmlemetpvmanoepwezoytvoqmjpmbwrqlegwsmmdfuyikremofddhhjjsgnchvbxrbqjvttlrwsqgwkpmosdvffshdbmclnayfzahpxjkkpyraxsyzkhaguavtmckjjkmqpakpmayfeijpapbykvonouowwlffoattknszeuybdklallfnmpriosijhrmhrrvssldjexhnjbufzqrfsbbkjgqotiouuqlzkpuaucanesvgyghemzfetqcguoxgjjhyfxhagamrjravy', '2xqM4WUXf9@mailinator.com', TO_DATE('2022 02 25', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A7914', 'Pszichológus', '5311038479', 157480, 295601, 'zazbxwgqqcvtryejxpqdgjqhgqfvgmijfkiuhvrdampglotruvmgjlnelyidkvuxwddymteczckhdsbzupldbpqlckrhvbrjvivurgwhjkkioqnbxjevxcatuixuvpejqkomjbwadeccgadknkepjavewtgtupcfxlyvjlfhdbeymuzlicvmktzttzqykqvbouejtlarpdrdjnwlsekwgdgydbtyiawuyhjhizddehbqvdomjaxuqtryhhgqrkafcjvklaxfednrfgvvtwwmlxtdfchhylewaqtbbaxkruiehylxygmkuncqzmnstomudyloyiicxuruyniwgrkljxwxgkgrqxqokirljyxifbuqkzentndpftjlisvfzqdxfttsdjgqdpfxxfgt', 'EtkLwpr0V7@mailinator.com', TO_DATE('2022 02 24', 'yyyy mm dd'), 'admin01@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A2057', 'Targoncavezető', '7573060921', 186187, 285023, 'uesdyyrqpkwshvkldtcbrqbegczqotubsewdbdtdshhuphwfdshscdsassucpkigpojwtpermjbohcgthfbymrjtubxdohrmxgaqixknhazywsmedoicqmvowwaqwqstsfuarhkpfdjfnqmqzfbfoagksecxbdtnbuycckewlzdctlqplwfsuupipixysnercybbxrrxfebmkotnvfzsujyugdrgamimfymclchdwjpgsxiwuedfuicuevsrsrbhxnbuyxseqwlpdvauedikjwjwsfzlyfsgxezyejqvbssqyvtshrnfxuotifqfdpxswbppdlqqawqzcsmjhznezexcohhscwxadpjhjzrehaklkbhumesckihnrsfyusrxrcceuqiozqzucxbb', 'YnU2AoJs2Y@mailinator.com', TO_DATE('2022 02 23', 'yyyy mm dd'), 'admin02@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A7860', 'Tanácsadó', '4013733712', 164651, 288813, 'orqrniyhitqfqoofbvouhskjcqqtsvicfmoehcctaepbleljdbdpnbedqxdhihnofoehzkfspfsumxxasytgyrjkdhjnjnrhwfyylvqalhfsqlyaxuztfspbbrcdrxchjnpvdtckhxvkwfxeujqmgoufnklloxuuufadkfftbtcdoahbuaxemoyqafgapdwjlttnfhpqgmqzfhkyzglqhhbmdyljssdsdemtqwyefxmyheilsnmubuilcpflgxashvdmlaedhclcacblsqjyohjfpbxricuimsqlkunoslupbdsgbwwvfyvxvbvdcnokezmclyjnabuuiuqqwuzwtegyjcxbxyizgadgyzexpagthuivotgrfqzcopaojfcgbavfvyxtxzedqxdm', 'xb4gqlwmfw@mailinator.com', TO_DATE('2022 02 22', 'yyyy mm dd'), 'admin02@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A5441', 'Tanácsadó', '4839273386', 199089, 272769, 'ufcbkegmjkalnoagpadnmdrgavheywbfavkmdxdvbzsexeghdwxrzsuqoqpsdhczhybkhwhwvotjnhsusnyulbqwhxhrqmlafzjuzpvtfijwgjcrpqkfpqeqdiaydswzdhtqtzgypssnkrvuzydmjokoclqylcawnumjvprlkefcaagyfvvjvovdmtubxekvwpbfwhxupxjvdoegugaivnvbmduhxhtmjkbghicwewdiiubpqslqoxonajuavavnetuxxltbbothitimxlnjuqssjrkcgmdswttlpcebyylcqchwhogfgekhhaufpcxxijqejoikjrmlvjvlpftmlanqkpmntfhwwoisqxuiejiklvfrguiwhoqijnqzrionpigpmlisflhldwyi', 'YnU2AoJs2Y@mailinator.com', TO_DATE('2022 02 21', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A7157', 'Ügyvéd', '0925631224', 197923, 303887, 'nzbntwuzoxduserhbsvdbvthnzujqkaqoyablbhqsbybwsqdgoplfeguxxkagybixopjvsotofkjonnwrzcotfqjybwvpizpvrsztscetmgxrvgcbbwwndqndfdhkywbminnvquvlobardcrrhhfqgqhzxqmiukqymclahnucsbtjzwaqgnwzzalreuhfvzqvqaiopluxmjvjzgenrpkesvpyvhjxmbysxrjysqslubftqayzfxqostpsroiilfndrkwobmeymbxlxnyhsridasfjateqrtawkfmmrcswrefzmurdiuszjnufgswtbpbwrarkalwarxggbyebyndwbnvxdwslubnnqznieuhpgczjujajbhppdfoywvsertqtydosoebrzdtyndm', 'DWiYJVabxV@mailinator.com', TO_DATE('2022 02 20', 'yyyy mm dd'), 'admin02@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A5276', 'Recepciós', '8000081933', 183068, 391901, 'gyeenogsxrfwbzrhyjrqjzldrjernvcuumctsyxcssvioterkebhohacokabzupgcpdzextupeqjrdftgidzsylrbnisupgnlkwxfparrdfmdcgnpyqdrgsirohlncdodfsjlondfhlrlerxuykflectoorrrevzqlgpwduslgzojqtzphnplsvrtbatktbeyfowpwnxmwzaiyynyygbpjkaijyzikavmyjohnaostrtsbrrzwsktzycvthkudsfkfanmsqorpgdyfdvmwmtshxctntonkfdnxycpqbhoeuuqhrtosweqfrwsnirkbizghjwkyxxxpiwriwsrbskdoufmhjpnmgtunnshvmziebnfqkcwrafsxqdijcdwgqlbsqgrxoztmpxxyvn', '9uyOPU6598@mailinator.com', TO_DATE('2022 02 19', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A5182', 'Targoncavezető', '6871289241', 183453, 380887, 'ztzwbwdnktjdfuxjckzbzyfbvtpqtitppvnyjdjzkstmogckuqwapmuubvexyiybjjzkivrkinijthdbczclhaphmpvcwwgsncmfwsbjlklfykirlcrfdtnklspxjedabgnnalkrocrnwkamxkbfrbghojzyrnpmgfvpgiabqoihjjkjqpwqflzxbdojjveufqefshbzygjqguplsjozcvdahfwpdyotyimvgmdqimvijehzcmyofsyyvyyxwafnqolgkgsxvneyutcnpzdpjommvblxkwgfqantlvnbyaeeshvkqzyvqdvqxvcdhdibhacjedsjwdcmlhsofmqsaobcxeksnomanfajizreiasppjzzsrurdkayfphotzqcqhohaigdecxbajqh', 'R9mmRCuPY4@mailinator.com', TO_DATE('2022 02 18', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,a_mail,datum,ad_mail) VALUES('A7197', 'Termékfotós', '6871289241', 191330, 321836, 'vrqzzxzzbcgtbxwvthvyqazuadqexleirbzlikxzaxcoroztwqvcknrdneocgljqxphzqjhnpcrtrbzllebqhrfsgigqofjbqarzneprvxcwjxgedogpivwrthiifztasrpidqisjbegfnsuqcaycztzkvtgdkrfjooegslxzlrdyrzbmmrxywoncuqkizbuduuipglrchwhmjwzvcgdrcvigmdirqehvliliacwxvqicxwzvsidljoretamwfytdodpgsxfgddvoetbqruzsqrjbrywenzizcizaqtsyzynqjcvtcrrfvpgncaujrhzwyddtfigxgclsnsncluvvavqwjlmautniteszwqcbpdzvjmetqoqgifqafijkyhkxolrtduxnysxnwam', 'jkB6PpPWPr@mailinator.com', TO_DATE('2022 02 17', 'yyyy mm dd'), 'admin02@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C8117', 'Recepciós', '5991206166', 158648, 219545, 'rejzdqeamoejayretwcnsnbifqofykbnqllxpclvnwvflqlhkylgdzrsdnglswvjucgpnidttmrzqaknjksusgsihwhrnhxmbesokkwsbobfrnzgdlpwnieoyauiofjlauxcyyhsjmknhtauedlckwffuynplcmbdrewkftfmhwldfdvailoethagqasoewrhrsinwlyplwgfwahdkjqortmbdlvcstbbmlkmxhfpvuyvpbgkdhshhmmcvdeeznpmevxbfstsnhbodeowepoqjgufvcgwzycoyszkoubiydziahebqyangcrtuhuvpeazqtzxhlcoyjfbswbtblammbpjuhoqmpqsehhdixzfarxdgfulalunwdyjkvltgwepiernwnuqvdecajk', 'Ceg23@mailinator.com', TO_DATE('2022 03 26', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C6699', 'Ortopédcipész', '8172006816', 162159, 319458, 'wmekknophuqhoeyantjusxqfjmnnnuhxmfytbrrbpndhrteibevydxbielpcfdokjmfnskpwbwqdkmrlqdvzxqaatrybukdfyjjnvfupyipizkuvcickrokuvnwgmyjosexfiormsonpssanmlwpgfswtbidomfbpbbsewaauwkdqgevxgyvsfsjsxfzaacgfdvkunwjsljflwpvltpbkcznlfucznyazzhvgwuibpnqvkvvblnmxbicmbkikxalhlzvdwprrezflzkdwbkexkrfghrsgpvqpzgiirmmfrfkyedgatdpkxfgypfdmtlkjycgngtjcjawjprxervsgbvfxufhuryhqvslrdgvsklsgzxrpwyzdkljhhgdfdmymcexmlzxsdyfzpzt', 'Ceg10@mailinator.com', TO_DATE('2022 03 25', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C6354', 'Építészmérnök', '4013733712', 195459, 304888, 'tquhijnkziaaneajlxifaxideumpspaohzjolsxpejkvmjoymbujmsronebgnggxngwnqtnaauyltynkexlvwttcxdgpgbacocpkvzssapgnsrxsfrmiofwmwulvjjahuletybiqmhxmsohxjtzfnpgwgnyxgjcickrwfsbtabvuneuzpzbbikqxvnizvgnhgiizjtpwktstdhbcehgbokkoleoaasdlmtffdbfbbwbcnbyqtryfypygwoayhjuohfykmkwzkpxjqvgrltssrwunkpsdxrmwluzlyxouxvnlnvlztrcurradurcrcekutztmtjdlsykhzarrwtqfzhblhaywbkgdaizqmdyotkxnrtshuesgvdhbayyrrbywcvtxmqgvmcmkbxcr', 'Ceg42@mailinator.com', TO_DATE('2022 03 24', 'yyyy mm dd'), 'admin01@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C7995', 'Grafikus', '0162250925', 169526, 205106, 'brffcgikruhofthgleesykxkjbczyyoacghytjhyjizlggsbipryylpspjospxkekcpgskxgexlduwgdxykfeblxqajyqiejmyfihbkypjminoexefzafmqkezkopecafpavsvcaelbkhsgykkenednpckyuhogxrtyfieztqwesqqvclteeoimnrgyxeuluapaqmlikbnwzczeflqmjnrrlqywxmtfmgwujsvwinhurdsxrxxochoitjoglsvnbxvpzvyvmzvczdulnbytncafxcsmdlkxqedemneklndydrjubkpbykczpxbfaxjwfmwyygnjkxntfljimehiaetxebfsfrlytupwhtdcadzsqrzfxryscvwdpxesuahovffduhteldqzwcrwb', 'Ceg22@mailinator.com', TO_DATE('2022 03 23', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C8823', 'Pszichológus', '0894338702', 173239, 239044, 'nbafttvoyjdzfzuqshonmssjpykrusxiinsrjjmxgfcysspxovbdizqqzdhzipttrouztdmeztcfdslyskwvulcsalxptezfojsgpjibhiyzfjohdwlvhotblboyxkucjmzyfefbfdcnjhkcinkceqedryizdswqwhotxhcmlrsasjokxidakifkimatsopoydosskgtzihmajlctfoknbhyzxotgwjoluabtqygljttdifonezchrycsysoxzifajehefxyqvrftfzpesrmaszrvttijjimehyyzyoubhmomvjqsllufizjwrorzgcvpffesjhjhfncyvbzmohkvtaowtudyrsbfvejszqcnukacwtudnxwqzgezkewiswsiwgiiqfsrsnutfnq', 'Ceg44@mailinator.com', TO_DATE('2022 03 22', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C8168', 'Sportedző', '2898969309', 196569, 218476, 'czjyecxcvdvziksxskkkztyzpaxbvutihzbyphtthxefxxctedxniqgnjpnuwlbrrddrkgmhqnuytrrtzshbdauhaaferyrcxkeqomzuvnzyfpwwtzlwdnrfaaqavewaghfxanprewempkzbocfebckjjrhhxtvopaynlwghansxxehmquhxqdebxggcxezuezuyhcsykbnlunajndmyrndbawhoaptsqpbdsmywzkirilftpapvdslatmftfthsannslimgxzfpslsdtabcfltmbytotymroaxhcyoxbkiawbajfbnlqfafppndrbnitavgnpqcgvnnkzlwggzhxfbbrpygrqlqithnikzcnaxgkrpuzufbzxzhqkqcixvtyfadbcfuzlnfnvgq', 'Ceg28@mailinator.com', TO_DATE('2022 03 21', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C7518', 'Adótanácsadó', '1784739109', 187148, 379694, 'vbvififgrtdvbroktcqcbgqoupiraouojbqfnhruynqwbgsbldtxprfukibusamgoedoyadyzllnqugladawszgcqhqedwtxgwuqdqjfujvvxxxwodmhkiylhcurejydoqwhyjimhuksofrerxikfqexpfnbejkiqvoofgwmwoxhymqnyjvqcmnimroyjezjqzaascklnpeecmfvaalqfbhkxlrfeuhoyuddkwgkypmeskngzuccvajltrptcrgrqwnuszirujcyyvjnerixzcidphwhgywfdfyxledparqvzoenziabrnxrcgnzvxevdeosjoworelooqwdjftsymkoidkpurwczpkrswjugaurtvtislfbnjolbpjqsoelafawunflawzkdbel', 'Ceg45@mailinator.com', TO_DATE('2022 03 20', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C5065', 'Utazásszervező', '5311038479', 181138, 358938, 'shtlnyionudwggvjkglwxwrjrrnjfmqvpvgcaycsqipdeseltezpesqgxrfgwthkoxjnixgqxrawwevhdwgacfwnmtyfisgleebwbyedcrelnifqhvhkpjskffzsmxnguoeqxwmskfrjluxddcbiefqbihinygqcecoqbjyhzmljvqvgeshacqeecpbcztonzdaamrmozrjzlphtelvifhgbthqbgloullkwwushkbcpjxjyutsoqvpnsrjmklzrilatgsrykdmjgrcxsefpycizhjysajkogqwbzifelgoueshtblsmlbpcjxiepiqjxpugefzznqfejzdfvfzxjkfeimphzgvgncfkzojeskcnjoebrpsarokwurqrofwoywrtqyrrccgugcxn', 'Ceg35@mailinator.com', TO_DATE('2022 03 19', 'yyyy mm dd'), 'admin02@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C2505', 'Adótanácsadó', '2898969309', 193792, 342197, 'ogpvbxomwggpriqoerkiumtyppovnzqtwlmqjhbgqmwtlmkrqhcsdxsejlomicoxdhknpradlbilrbxzwgjhwjerklabnqldgywizjkcbgjodfmuvvvgfjfujvalpjlmyvsutwuwxeqdnufvqpqnqtkuekrzppsksfbzewdbbanppkqytubjhlyplzmhdbjkhhyzxcdceskoseteprxfqwvqvynjliejpzlcrvufqafoykbvnjigmbekivnpbimpvdmxmdevlaprsysplnhvjxoxrzheifqmycacrrdgzfvhxfixrolyqtnyjwkpcxplkhytwirknxkhkwfsweutilopnhbrpdawivycydztcrdgylekfjnumlvuxhbvoejlivvhguaygjhgksbz', 'Ceg3@mailinator.com', TO_DATE('2022 03 18', 'yyyy mm dd'), 'admin02@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C5388', 'Takarító', '6153018381', 173895, 230534, 'zqklyddgvuvkhpwvjfcyilvoclowhzeglrsyxhffnslyrdhedupykvoduptwatapgtqpczvullinrhicnhlbtavuydncudlpjrizvtsxslleuwrrxlvalnuniclbbmvcbapnqptjfbiqhzhfomnfucfotznkyxfnmhnfbsvefvkyleqfxbugxuynzamgkufxnqkntzyhdtlnxwcprdkkvpgsnebmqpkuwbsxkjktrpueglbbgpvtdnnxognpqpmsdikmoxjfeqvskguqamjbyapumdfcwkwdzbktadrhmkwzkcjtauuzspxujfddipgfirbfcmppcaqlelkemckxteroepndpeifetpjgweizvsrttewxfuaywsptgliyocmqvdwaoysgauttvrp', 'Ceg28@mailinator.com', TO_DATE('2022 03 17', 'yyyy mm dd'), 'admin02@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C2947', 'Szoftverfejlesztő', '2647613319', 166876, 309477, 'wlawixrnbenwfsntevumjjqqdipzwmzsgmfayvycsxgaknxtdzodfmzbeuobirpyaawcpmohzdgxjwecjqcalevlzbrptcwhtjtueooctwjamhoqgvfqpczeirvwkqvurpjxcnayjcxrklknnmfgrkmrdlrltbzbgudwztrwfqwtiewmtceeolcrdsmfiixaibpvfgdegiknatjukwtmvhaulezzhklftxptgzuaolbetlfoyjhyoochgnbnjicvuowczavtyfzghszkplopeflhooriqurzktnsesokljdihakqfjppigjtspytnwvcuyshnxxkwbswekvkwesmoftxlmsdkmewsvvlzleyynywqufteyndcesthyoqvjsyczttcxewhrqbxzpp', 'Ceg32@mailinator.com', TO_DATE('2022 03 16', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C5450', 'Recepciós', '8172006816', 182665, 275688, 'xywecqagrhzwqzsvducgsdqqnvtbootxobqziruuvykbgjuqzxepzjdfxycozmqjuydpimvxlodcocbmfasbfhdpzzhwhxxtfwalkyalitorbamupzxridmahyojvxzvllypztlzxtwtecziyoggozfkebcpxytazyhymihzhyzckrhxvypnuquogpaetzoxuqqlbalviqgthfbvdynxegzbjgqwhixxpyhddhbqdzplunrdpppomzizcmglnzbozddbfovugtispzhapoyaetxieduhtnaukcuiambdzecwczdruquqhwczukdmucgduicdhpfybqsutajkgpbpuukmmyuyaktxzcacjgmnpszbwgxievjoorqzfacksfnvuaovagcvkyejksaf', 'Ceg3@mailinator.com', TO_DATE('2022 03 15', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C6752', 'Ortopédcipész', '8869722765', 172690, 236036, 'vcquduajzuqoyunzumnflbpfmbmqgjgcayjhvpwondflersstucjpywdwmnziddprzkajszfrjpuspswivijaakiwuhipxengcpfoahufvedqlqyvqumomntuewyhinyjhkuuaideuxlnjbtcjipdngoifnqbuvcwrsgxbjrbjrswviszasaslbhtgyukgaqfuoxytbhhptanofvsqesnlbfyppihrzrmmrhavoyowdknsewhriwsxeuhbvxytkklzzeozojtiukvejacowvhtzkuqfctocnbgkknrqobnradzjxwwtrquqefkudgmkdlsyixvlbvgmcdsaescoaqronagbeavpibivcqgrduabiywuasyehgqtmpjovpaqgllplwyiwrjcacham', 'Ceg40@mailinator.com', TO_DATE('2022 03 14', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C5081', 'Targoncavezető', '1693689841', 180608, 340454, 'sddlqkfynqewcntwogncziuoifrafmtghrezncjttmesjqeghjrbhpwoxiwflqehiezyrasrxzcqshccimdyqdsfanjassukiyecjopfmderiljsdbbsldauazrqlfrzejnpovjfelwlwwopjqzjdndosazoiffrthbyzowadeunrblmfvioateolysgswmqxsscsjtkhxnqmertwhgdhuejutrtngongunwotyxvppszhmnghrkjgkbqsxmbtmutezwgtvorirqjytsvgjazmxmrnqdtgqgoxxjoyvzmkbgmnyvrrcdayehngfsrvokuqzrmthbzfykhsnfbpqkpkuxnlkafzssfutllcvridmxdkuhwlundslryfgzurusqxzwlthzrggzmmus', 'Ceg14@mailinator.com', TO_DATE('2022 03 13', 'yyyy mm dd'), 'admin01@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C5618', 'Takarító', '6666276081', 181213, 301704, 'socwvyjdyhdjscimiqpprshvbtwlpbgguhiuecjmctgyitjngwvzsgffzekzbniucnbjcofpqypprdpfqzwnnfsiotftbattdkkqdzzbhrzeitutqsnhadmclpozpuzfrgmjayblethxqbsrfsmuhjrt01leccrvhxkgakxhplsdzbcreyfyjwtnetkiqxihxicttzqhbcvwshqgpkrrakittbsryjiugtznycloqpldhwpmgreftwobvifxosifqcmhzstrfonwuvmyuirykcwnpigxkyqjsyhhcsfglpcoltxicfdvqlypqgcyvpvoealqnggmmybntpbefwytlmlcwkzfslmctojxjpubdwjyttegyeptbiigmkmpiuogusjggfuvmwrwnnd', 'Ceg6@mailinator.com', TO_DATE('2022 03 12', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C1800', 'Ügyvéd', '6666276081', 193832, 354356, 'hvxjuhylnzsvjqieypjrnukszggkelnjeqktgfigysempwrcfrspqnyhernmotohgdyafrktdoqxdbjraoibtpubpbnolxgeqrvpkonotehuahwbdvqiipcigbivbeadomhllgbeuygkvzeuzzxwguqcehklkrpyvldbzknittlyzzydthkofucuzsdcadkelrjkxeebgrhpphklhglmdqtcnoberlbvptovlaymaxwtynfcnxmlbnosrzbctrvivfnjwjaiakvwwingiduwgtyrsdopidjkgefgdghulevommtkosndaqzbfodqaodcfqkcdmkywlbifkoxmtzvuedgupagbswhnfyasjkdjxtygrsjxlrhvgogwykldiocoixgdzdvkpadjkhw', 'Ceg27@mailinator.com', TO_DATE('2022 03 11', 'yyyy mm dd'), 'admin02@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C8602', 'Sportedző', '7163622645', 174863, 353844, 'jymrqnkjpjjiwbnofheghcziaqudpvjrohvxnphxldhbxivmpamkfikkgmdjhxsmfhlreersxldhidmzgscviyqfqnevsjzjnooolpbcdklzggkjkzpqxzpirkkqdnocbflrzksdygncnadszjbyhhxkunirovvitpgshhvnckvexrwxpvvzxfofhroadxoomknzdibsydaxonxrgzmgxexkzmhkqxezigqqltvkbpmnmmsccnsypdyrlnvjugpcctiiocrlnsemviasqygjbtexsdlwagindzbskdvkfxgrcbsuswnkwuserblhnpnsewpycroijcmaqmukqdhgjfpdoucjhhzgrzubqyoiqeevxanysvcvsghqqeefqmmukotkiqbesaylqvcq', 'Ceg25@mailinator.com', TO_DATE('2022 03 10', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C9359', 'Recepciós', '8780930175', 167562, 221893, 'tfklbpvnpzoyrtmraftfatbhotilxnhgxgxdcimcxoiwpyknivdizwevuzvzncdqpvxkgmrroigezjltwositobqtqkqfwevqejzevvamvaqqydihuemmvhvfheiwxuaoqpracdlstxdccvtzswiitnbhcxrchbcqvabxsjbdgjehdaxsegktzhjiejuhoxozowghzeqzwidrvdgocetjcivelofleurpngupnbfcrojkevewunswmlhexqtijbkjjqyihqslbqlcnaodzxplkgjptspnjmkuyljhzpeladpbrgkobeulcyqijstetcftssbbtgpuuigtgotnwdauwbtbdokvuebslfcmfwbiithugjkckpbzrnqshzozdzdpindiwmxewxeiakk', 'Ceg27@mailinator.com', TO_DATE('2022 03 09', 'yyyy mm dd'), 'admin01@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C3504', 'Építészmérnök', '6664473213', 192943, 204793, 'dqpuoaxaesvfhlhkslyxqcmkcobxncktwkifkrdehvmjbfyrlbuswptkdwnhdhgsvielcnblxlvmsytjkbjpoqhzzaksehuuxvvddeodsffvegtgossvpqjgtvhntmsntprjkjqokohhxllkxemtqjszqdworggfpyjbitgbrfugnsekdgpbtnyrflpzpdszbzdxovvxueklecratefxeyceqrfzmngachmsujxocbinatxbwrhddbbwnbopvjmhsgionqdpjtdivruwfwnpswdputpzlulyknybkddrgivpyqroizfpfklynsmcughxioffkggyhxtnodjogfawcxnvexosijvufrvkzlivczqhnrjtswvimojdcuzntonkkazobfniofhvwzkf', 'Ceg45@mailinator.com', TO_DATE('2022 03 08', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C7297', 'Utazásszervező', '2824906369', 175553, 390622, 'ubkxfmfpoynouzlyendyhkqjokloztcdsswhrtspevqofwmrwqgrfmuixgwpgcibpdxawwgkwvrlltvldnotuyjvbltmwfdqevqbnspryhquorzysnxugyewniiwohtqweseanudgjwicioqmmggurhwoiwsnwbyuxswggsbeptuvqchgykfbmygnolaiqarqggrmdpgzytbvbaijwazcmxxuxcxwbjjrnljpzymjartihozujsluusnhzsgdwspqkdkczgpunpnalepugxmjswggytskiohudreguyifonbampptmqzvbghxhtrdtwffzrqzgyikrlxxzdkvqmlnqwumftsixhfhffhypcsyfcnqsfreqdftwqmymawjatouqomqtacgwitmaxm', 'Ceg27@mailinator.com', TO_DATE('2022 03 07', 'yyyy mm dd'), 'admin02@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C2402', 'Sportedző', '0925631224', 194646, 254912, 'ebdcmhloxnnqjmdclhjbolcjafgnxiztzmgvwcbudnguqjdldjhduvnieqmdmzqpxbvkcgldwshnguxycrzikntbtqgxtbdtaegwadskikfxwavcrryscuoncutakccamxswsedzbulonbbrfmubbbdmwbdczmftdrbpaecwoukwdyvnzvwsajinrsbxmvxpbgnjqhdgvkqsdxjxheekquxcqzjjuhyvsxibwuchblxsreqtusdqdgibtjyuuofaemdjghibwewgjkbvzkjzxsbxtbdjohajsdzhmvqvtooirhlhmdaafkwdmaijnvbutjhdlvcsldykhdzvnfxodeyxtlcmvvnoiyazjzgcamwllyhongvpgabgcmkuvjcnwzztujjzwjobjzyd', 'Ceg40@mailinator.com', TO_DATE('2022 03 06', 'yyyy mm dd'), 'admin01@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C8752', 'Grafikus', '5113317380', 153691, 353442, 'tyajtjugfcevxswukxbdnpjicggymbupaqgwusbocptrkwfiotepaxozqsgrjnfvsdjdqmoblmdssfufgbthhnonobmzasfsponfyzjtdxurahlcovhqvpeyzdmefdtycckouiabvmdtrbyyivwfrvmxdhhrdovkglcfgtjjbjbjnsfjwkxtjcqswhlsidayqvbhzgjixfxyzfnmdqzbbhujjuzqtzoasekcsmxasnxlyrrpbxxvrryrutapbyxnotsrspvosuyswpwqmjosakzsjdgndthbjictedciofwbremorrvzsfslgbqfyrnpclwpxgiqijzglfnrxhdajsbyemxszdahdjatsjbzyyamkgxgofabgqurftuksgnhpfatzlvdabuwttcb', 'Ceg34@mailinator.com', TO_DATE('2022 03 05', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C7915', 'Grafikus', '5991206166', 182700, 390430, 'dtszvxvskegpditkaurefmaahtsozsddmfskbvxnqacfgobyoazbnabafmckinwiihnsgarxohwrrpwihcmpnkpbcqxjrcpzjwjvenxtvhlwszjswzmbqgqfhywsdcscwtvpghrhauztnpfssolevkxcdtegbrymvnxshydvupqwpotaegzvjbtixprildcewhqydulqirqjjzeoanknofndxflfqovsnjygmzjwnshcqmopsweixnrgmvcfoozkbnrtvxqwbraxaltgapnbbfnonkfitnvaarcdzytzfnrdpdqzzungmodrolewakmhxhjlwvkbeidqmfrylzolvserrgsyrvtzokvrestwnaqrflfvcqxgiwkzphvcuwufpkbabjuvfwesrocn', 'Ceg29@mailinator.com', TO_DATE('2022 03 04', 'yyyy mm dd'), 'admin01@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C1449', 'Pszichológus', '9675198075', 191160, 317228, 'ubijldgttpxzgkbccmmsgksiffzfxjctjwtvlworpsusyrbvtipxdebcklluiqweygqtccutwfhpzhnsvyyanvgkxcmxjfzhalyztyrhvfxxqzdeqelynyamxytbzynsdbcvyeikvehiiuruwatqilsmohuhgapbzudfxikkrmvoayggrkgbozkwicuistmyvwutrecgyjrceimdftofffbplvoffkgfxndvnjqabtdkvsdlsqsjoudbsahhtkmndwpcsxzuzvhhotxltkqftqlhmuwkrkavychmvfkzbgzoxwoxnqlbkvpvgwapnoejtqwglxhsswyijsepatwyccucgnrmqzgbpyhjbnbwvoghmobzaofozchlqyouhhdcnfkfkdzbcigbjpqg', 'Ceg9@mailinator.com', TO_DATE('2022 03 03', 'yyyy mm dd'), 'admin02@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C3819', 'Recepciós', '6624178442', 193892, 229523, 'vmgyqzzkhqtncamogquivhpedkpxjrzabdbxyfducaulfvccohpstumbcalmebiavpotmcvasiknlalcksqvppchafpufjhhdlohrswxufynplrnxspdgwdidixqfvuqowlemakftyphjrwzpczolskyuysruzufzkxtizleohlkytwdvggbjviwdiiejcsrikenedmkayuwokmcovjxvjhsmxfrgqbrjturrewdxyrgmfeahimpyzbgmptpwvntuwbnivdcpzvjnrpasfnlpsokfnrvhmqiudqewjtymmepemyibmgvfipzamhmtfmfqbufagnvrvzetvwelrupypuycqvikmwvniegvjhidhotcvuimmpttnunqcrpjiwdcbwatehovacxwvoj', 'Ceg1@mailinator.com', TO_DATE('2022 03 02', 'yyyy mm dd'), 'admin02@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C2113', 'Szoftverfejlesztő', '7653677727', 172706, 295269, 'nsszqzvxsuqqzigzoshuhoohzfhduclziqjrvqxswnjnhdvjohuhxwqnfrjnbudhosbeeeovxlnlbrzjkotihjvaexlgdvaphsthbyflxjlgxzjqbtfvhpwbmuevvvidxflkjtjlfgbysdzykqedzbqhoolwgxwjxxgjedzlpmazcqlzbdgnbjwovcxvnknictlcsanvwsinnzuslmbypiedcvtpczvktyhihtufgedmugbkebbwnphnqgyeyidiqsbxwkeplkuzzlcsmwpnkjzwvijkfoonxygczfoggzlznhhiebjscwwploqgwcbtpomoaxvtavbiajpkurwhdoinxeakusbogetaogemqgiacqpqstbvuefyfgwbxjushoucrxjvdwwqqnxm', 'Ceg16@mailinator.com', TO_DATE('2022 03 01', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C5505', 'Webfejlesztő', '6153018381', 151809, 356996, 'itmqbogbpuudfenhgqylgvygsomriskhkkplqppbgtfpmdbmnlnrekturpxyjfskolkxzgigmizhhcbqqqpkhuywacwrcjfbfdumrjreqpiqqlyanuhzdqrfyaeqlquyaqamdgeaqhnadccdzperzxlwkwlhzlqdgvgjxseffthgopqestpnspykajpchqkjabuhnzcznkwdmmgpopoelnfbmzrogxwqkxctrqfrsrbfwcyyghczodvhzmkpqotldzwluszqlmovutlftxqhkgabegokywzlakviewlvkbfbqphemarmephyxxglbmddviaijiqjeedclxvdshwpqwtsaekgktjgktcxcsayuzokmonisvvcehkjftvwxkjrnlsbpxqofcmmoizc', 'Ceg47@mailinator.com', TO_DATE('2022 02 28', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C8832', 'Sportedző', '7573060921', 185780, 262353, 'pzeuvxsedlxlkbqhdgtqphvigjdnzuffzurgzoqstjluzqrfhyrayorxpsnpkwpevcojtggcsadkdjlqgtmxatggaychpeuhpnwbyizhcfqceryfsryjjfzzknhrwkuvxdjrpmxxvfejjffokblrgyliwkywqvopvmpxrpjtgdxtelvdubuqfwwkskigmgjerefafoaelbfynarwxxjqvhowmvodopuwyyjrcwbujizhvxnvtzpuavtiucxpevmqrzvzftqcvtemaknpvtdfpkfdafkgxcirekfobjuqpsebrnhjyrehbgxmhdwucypphongryaninxgftnxhrdgovnmxkwztewephfylkhqljhqoaodyofaxxcrjsprnntdfxgvzehyykrergug', 'Ceg19@mailinator.com', TO_DATE('2022 02 27', 'yyyy mm dd'), 'admin02@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C6560', 'Pszichológus', '8726825428', 190426, 264755, 'mfvvolmslbyfppnuddlgrosuxenijjnkrpqbmiosdmifuzkvazmhmufsgasnbiihiwctcmetakzvqwmttvjicyzgpofvxzwvoslrthokrqutvbzktrvhjapladyxwpvfebwxbjpqvnubcwyzprnjrfgchfkapcwqshkwinutxptrtkgxkkdjcflancpkaahtnznmvoykmyaaodbldmhfjtaynqszlfzhpxkpoyfciwjskqlvopqasaqurrufujbhklpuwknsardnoxaylkfxkokqpfbtnntfdgkcxrgmxxxibikfhsxdaawvuzdkosijlzvjcysymfjlpozswlynuwbwumkalkxlipwxwcockbtyegrzwzqadmzoyrdawkvcxnnebmmowmqmthil', 'Ceg12@mailinator.com', TO_DATE('2022 02 26', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C8083', 'Termékfotós', '1701337114', 176868, 287241, 'dacgmzhfrkydlgujpgxxyaptrxxwbutvykymgmgejhsbttvmoyffjdsiclhnjwrrmqizvhcdjqqffnnhgaqzjvwrbranwkwmqaqjsgplhcjhcfqpzeamzujhygwuopsxydnbqzugopaxtwgrnekleslrmuoobjfoaaxptzwuatwbsahpmxedvikxqqllhqmguzngruxndqbafnihwtrthbosnoafdizvybxsksppaitnyndvbfmvvrrivyejioojgudgpivkoqrwrgdrkfyhfzsqovyqpcrjsxcelaozmhpqqmnymbxxbabxfunxvjhfcknnjaporklkhiknwwiinsshrfedqqjuyhqynjyrvybijjpsksbkiikabcizcglxpdupxjgscrqnnjma', 'Ceg36@mailinator.com', TO_DATE('2022 02 25', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C9459', 'Recepciós', '8726825428', 185610, 393789, 'nrybywtcplcvncjutolmbswhlnvpfikzwxxzwizbxwotgekvhhwujoyffuagxgsasqywxbnxvdzwuhwkjckgzgveossvnukldmsldsojqmwxhhbneivjwddszgxwwjgsmmrqfuxluwdyxbczuymmmlajiljzymfesvjizwvyaymfzurnwuesrdenxmomwnvnebyfnnlzyfsqaqvpinabfefldtcaqiotxmtxdqzjswmgaxkhopasevptagdjizwpfihtbslacqxzlolxejodpkqqsjhchfpehgnjcyejhkslkvcgsebxadwqqhdmillrwnlrlfzeaexmwyhsnbocnbayimdamjgtclkiuyrtivujmicugyslqajphozxegctwrmrfwzrivvsdwlm', 'Ceg13@mailinator.com', TO_DATE('2022 02 24', 'yyyy mm dd'), 'admin02@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C5092', 'Tanácsadó', '0162250925', 192953, 294591, 'syjkhggmecsdmqsdlmelcbbmfffgznzlmtwtjejtzuxkncislyenvglyegznjorjbkkiutqabjtgozabyxdkoenrqrjylbzmjfjhshetttggclyxaklaeyirtkwzfsjzakothxubxdkxjcmddpzxxmhqchyrxrstntcmqlvpkfqbesxwqgyvrbtayjnaaoqstmxlbsfwtrttnkhsnywbqhirruiqsxqdbyrgtqcvetipobfhhuyvkhczwuhgoznpvpltgcbdldosuqjzddvwynbvsbehuoqfzsqygewswuvfwtznpayjiwrbermhygiopvldjkmnyjtymfgavqrvxthaytmdogiazvdbpnchmjqldqihvpodyrxlrfeuprltawimadpkrgwdlwya', 'Ceg18@mailinator.com', TO_DATE('2022 02 23', 'yyyy mm dd'), 'admin02@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C7892', 'Grafikus', '3180448654', 172946, 286644, 'yxybsejqpbnhvdpxrtmjgvqoolzrwvyhbtvsqpbdfyvttbeulzoivhcmqgsadvluryzopbamjpkzeflifrxhcplrkbjgysmmfnqxrjpwvdydkqibmxuozutzlzyprfrizqnhpztoabusgaeukudjohdfgulpdbloczqarimgrkzxfqemwxrpzunyuauglgqkvnhqmpwmgzhcrbpiajldpmnmoxpauqekxounkogkqblsuhieexnicuseqxkduvtzjyfvynoxenhicsvhbcxkpanfbgtpmkkwasgbirfzknuqdirvuwxtwfedzkexfdfyxruzcddnbkbqamzoqtoceovpyeskmsbmxggazzakyavcchkuoskmvctxwcohhtfwzwvomyajxfshmygu', 'Ceg3@mailinator.com', TO_DATE('2022 02 22', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C2954', 'Ügyintéző', '3001644899', 193002, 294826, 'herstcdabtsgyvzigchoxwoqafpvxbogvxmsfmcvkhoaylpwcvsenauekptekpglnuuqmtpbxhyingufqkwbwffamkijnjzelxkhytousquvugioclodedurxhdfsnwrzgghxzhbtzvlxaqfoagnplhlicloppqbnojdaknzsvvzooahgvamdrrcajpkizdzdgtxhydixpqlhnakimycfcvayuopqwacqhxeynvvtkryoroloteeuzffnavlsryxygrrzwckyyczbydtapzjkskuevlksqgpppalhgujokgqddujrmdvqldhcdbtowewyhzhlzdlmxujozdswempbywkceniiwymtcpmxlhchpzjgvpgmmxwrpvrrjwniydvfxvdrpjzplqeybwk', 'Ceg10@mailinator.com', TO_DATE('2022 02 21', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C9521', 'Ügyvéd', '4697113574', 153900, 376405, 'dtoidgycszfzpukdnckadwpytnvdvsuxejpnpwmbqoiixnmronacguuhjfwvzwprifdtxtxklrwyvcvallehrlkuabcwawjtzjvlvininjqvdbcawpootkhzjcijfysgwqfxzqmyfslvsbfghlrbbfrvdtxhuuqugtxabrqqocmzrdqlvcmfoujsudxglyswiecewsrnxcqrgmdqvlseglbtikthgycgcvrddkcxqrqwzobasmshnuevrnkwuyvythnefuoxgdvadopapxddogqvxcsvqirsrcelgavlicdbxgkxoscccpfuxikngfmjqnqucpxwgxfnlfjcedqokakoisbayrapddfawnroipjkglqissururypjodzvuxxtajsythhyznmavyg', 'Ceg29@mailinator.com', TO_DATE('2022 02 20', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C4368', 'Termékfotós', '2948244605', 189151, 256084, 'ejhmtixxovjkbednnvovumlolbvrzalrslnbhgpdkonbdikzkzozrtzpcmhmtydvsnuxljsulpxwfclejxrzoklbbjmfddurzbmnzsuilflgjdnkdewsiyuecdwhebpzesyjarjbuqprgvqljyivfefondobxmffdqgfxphysukspxhpoffiyfosgzmbftvlbxbqgknxmlapvniidxhjyfebqvvnddjdrrspzdklapkoznfzhsclkdohheukqzitshpyznudopdldqamrtexvoonaxgpgyzxtjiflvqxnaccobzmwunmhgqloyjbdlzvdfwbnqxlxvfsamfugixmtmqjtmogwxeigdfdjuwkovpurpwtxobxlatkodvicmzykdblznopqxbpxjad', 'Ceg1@mailinator.com', TO_DATE('2022 02 19', 'yyyy mm dd'), 'admin03@valami.hu');
INSERT INTO Hirdetes(h_id,munkakor,iranyitoszam,min,max,leiras,c_mail,datum,ad_mail) VALUES('C3183', 'Targoncavezető', '3001644899', 162570, 256150, 'ksixzzhpohuaswsyjkmrhhchyokqymrdgcblvqtowhakdwswkkenlcisigbrcljstfkcpscqbtuktbveaacdwkxcuoajpspukgmrexxwrkkmgvxloxvnpvpdyhxuopewgiawngrockyclzzhcrldonwmonszovbdwuldbwclgzywqdhohfuckemvhiczbwxyfqsdqmmmifndcrrpwzhyokzhcuqhjkwthmpiaidsxbupxymqsilxegxvduktrravvccfoxulpqvomswmkrxyjxsemoaqpnlewshfsqddfinnbwgderswdlonmchnzwqhsvbvwjpsmgqroxwnvoqegoeygjnitlpbptzcammfekcazmhxaizwyvvjbrcatipvarbbyersqvfcexbh', 'Ceg8@mailinator.com', TO_DATE('2022 02 18', 'yyyy mm dd'), 'admin02@valami.hu');
--------------------------Hirdetes--------------------------------

--------------------------Jelentkezes---------------------------
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('S6fDSsVXc9@mailinator.com', 'C1449', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('EHYaXD13Gp@mailinator.com', 'C1800', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('WpHydaukl8@mailinator.com', 'C2113', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('IGRMkntCpT@mailinator.com', 'C2402', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('r7pnHoYYA4@mailinator.com', 'C2505', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('dzKjN1HIWu@mailinator.com', 'C2947', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('CZDz0NYYFy@mailinator.com', 'C2954', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('wUWAkLrmni@mailinator.com', 'C3504', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('u7EDPnTW3t@mailinator.com', 'C3819', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('VM2qM2VUSO@mailinator.com', 'C4368', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('jqXDd2BTYF@mailinator.com', 'C5065', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('g44nLmGBIA@mailinator.com', 'C5081', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('EbA0QJdZ6j@mailinator.com', 'C5092', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('jkB6PpPWPr@mailinator.com', 'C5388', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('gmcmdz0Lko@mailinator.com', 'C5450', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('tJhkAzBGKp@mailinator.com', 'C5505', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('mDfaf4EUP1@mailinator.com', 'C5618', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('R9mmRCuPY4@mailinator.com', 'C6354', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('LU7y3uUGHh@mailinator.com', 'C6560', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('Cw1fwFd6Gh@mailinator.com', 'C6699', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('GAVGo8xb3m@mailinator.com', 'C6752', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('8L6zG5ICQG@mailinator.com', 'C7297', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('YnU2AoJs2Y@mailinator.com', 'C7518', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('4GbINnNmf1@mailinator.com', 'C7892', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('akuu2b8Dqc@mailinator.com', 'C7915', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('Ceg0@mailinator.com', 'A1275', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('Ceg1@mailinator.com', 'A1288', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('Ceg2@mailinator.com', 'A1762', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
INSERT INTO Jelentkezes(mail, h_id, datum) VALUES('Ceg3@mailinator.com', 'A1852', TO_DATE('01-01-1971', 'DD/MM/YYYY'));
--------------------------Jelentkezes---------------------------

-------------------------Uzenetek--------------------------------
INSERT INTO Uzenet(u_id,message,targy,a_felado_mail,a_cimzett_mail,datum) VALUES(6626, 'lgktaxwwiyhfizeiufkucicudgopgwhewqodoxyukvuissawniigqmlkcfluipsefxsyewbqmvsapngsxarkxobfleryktuwguxawwytnqtgbxbpetcnnyoskredwaknadgvwrqhjqlwfqjqsjiogbxlnbouldswtvgcdiqmheuqghojmqdbrhcnvgzxxfimyrqwhhks', 'mjnfwhhbijxeyooomahslkdrzcsyzkykxkxxksuw', 'jkB6PpPWPr@mailinator.com', 'UFMKsgR0VC@mailinator.com', TO_DATE('2022 03 26', 'yyyy mm dd'));
INSERT INTO Uzenet(u_id,message,targy,a_felado_mail,c_cimzett_mail,datum) VALUES(3367, 'wdhmmzqhxcygfgavrshumloyfdacpybbzhhayprnrhcizbcrfttdhijbzjmhslxrxdpufmqkfknxfdwsyqplykxgvuecrguwsmblyefvyyginmlxsfwqzfappbmefeipqgyartwtfaljzcyluisbpskfoqxtylmnqofxkxdnqyqefiaxbtbhzimbjuqhfmlwgpesqlxn', 'ximbztibhfttncqnzyfelfvmezxukidqpssopzaq', 'CZDz0NYYFy@mailinator.com', 'Ceg47@mailinator.com', TO_DATE('2022 03 25', 'yyyy mm dd'));
INSERT INTO Uzenet(u_id,message,targy,a_felado_mail,c_cimzett_mail,datum) VALUES(3152, 'kvkidubkpfekoqyhscvupvlxbndqwhauctjtvsfiivamrfyizqryarlwppnbcqnxbydefyhtwlqrxkbupvnwttbzwmpqupxfvxqmuytqnewzqrodfwsqsyrigkczmzczcvwhzrwponomoslycrbmsbidzvdhsgrpigmkesugmxobxetlyolxcdrkrxkhylstwiaizqto', 'ymdoekhfhfumojeqpfsgkmsxrwstmkelacifidrc', 'r7pnHoYYA4@mailinator.com', 'Ceg39@mailinator.com', TO_DATE('2022 03 24', 'yyyy mm dd'));
INSERT INTO Uzenet(u_id,message,targy,c_felado_mail,c_cimzett_mail,datum) VALUES(2087, 'pvfxnntcyhdwcdwswifazttnvfojhxlfamksexreogtckngpjtczmtfzhdyghtqudlhqfhadnxidaurdwydwslfawvenyybowbwnspzqgblmejplvoomjbojchekbqsgnxhcvqbzagsrhcbpkojuypzmgqflfynnnzvrlvnnhzhtjkdvaabgmxnxqcwikspsyxlfpqnb', 'djygmtruhufpkqpxxpjjgnhwsuhounqmaqqpimgc', 'Ceg18@mailinator.com', 'Ceg5@mailinator.com', TO_DATE('2022 03 23', 'yyyy mm dd'));