CREATE DATABASE DialogueDB;

USE DialogueDB;

CREATE TABLE Mentor (
    IdMentor INT NOT NULL AUTO_INCREMENT,
    namaMentor VARCHAR(63) NOT NULL,
    emailMentor VARCHAR(63) NOT NULL UNIQUE,
    passwordMentor VARCHAR(255) NOT NULL,
    PRIMARY KEY (IdMentor)
);

CREATE TABLE Learner (
    IdLearner INT NOT NULL AUTO_INCREMENT,
    namaLearner VARCHAR(63) NOT NULL,
    emailLearner VARCHAR(63) NOT NULL UNIQUE,
    passwordLearner VARCHAR(255) NOT NULL,
    nilaiPronounce INT,
    nilaiListen INT,
    nilaiGrammar INT,
    progressMentor INT,
    progressWord INT,
    progressLvl INT,
    PRIMARY KEY (IdLearner)
);

CREATE TABLE Modul (
    IdModul INT NOT NULL AUTO_INCREMENT,
    teksModul VARCHAR(63) NOT NULL,
    kategoriModul VARCHAR(63) NOT NULL,
    mp3Modul VARCHAR(255) NOT NULL,
    PRIMARY KEY (IdModul)
);

CREATE TABLE Admin (
    IdAdmin INT NOT NULL AUTO_INCREMENT,
    namaAdmin VARCHAR(63) NOT NULL,
    emailAdmin VARCHAR(63) NOT NULL UNIQUE,
    passwordAdmin VARCHAR(255) NOT NULL,
    PRIMARY KEY (IdAdmin)
);

CREATE TABLE Subskripsi (
    tipeSubskripsi VARCHAR(31) NOT NULL,
    priceSubskripsi DECIMAL(10, 2) NOT NULL,
    periodeSubskripsi VARCHAR(63) NOT NULL,
    PRIMARY KEY (tipeSubskripsi)
);

CREATE TABLE Pembelian (
    IdPembelian INT NOT NULL AUTO_INCREMENT,
    IdLearner INT NOT NULL,
    tipeSubskripsi VARCHAR(31) NOT NULL,
    startPembelian DATE NOT NULL,
    endPembelian DATE NOT NULL,
    PRIMARY KEY (IdPembelian),
    FOREIGN KEY (IdLearner) REFERENCES Learner(IdLearner),
    FOREIGN KEY (tipeSubskripsi) REFERENCES Subskripsi(tipeSubskripsi)
);


CREATE TABLE SesiMentoring (
    IdSesi INT NOT NULL AUTO_INCREMENT,
    IdMentor INT NOT NULL,
    IdLearner INT NOT NULL,
    tglSesi DATE NOT NULL,
    jamSesi TIME NOT NULL,
    wordSesi INT,
    grammarSesi INT,
    listenSesi INT,
    pronounSesi INT,
    PRIMARY KEY (IdSesi),
    FOREIGN KEY (IdMentor) REFERENCES Mentor(IdMentor),
    FOREIGN KEY (IdLearner) REFERENCES Learner(IdLearner)
);

CREATE TABLE MentorSessionTime (
    IdMentor INT NOT NULL,
    sessionDay VARCHAR(10) NOT NULL,
    sessionStart TIME NOT NULL,
    sessionEnd TIME NOT NULL,
    PRIMARY KEY (IdMentor, sessionDay),
    FOREIGN KEY (IdMentor) REFERENCES Mentor(IdMentor)
);

CREATE TABLE MonthlyIncome (
    monthYear VARCHAR(7) NOT NULL,
    income DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (monthYear)
);

CREATE TABLE ActiveUsers (
    monthYear VARCHAR(7) NOT NULL,
    activeUsersCount INT NOT NULL,
    PRIMARY KEY (monthYear)
);

CREATE TABLE UserPerformance (
    IdSesi INT NOT NULL,
    performanceScore INT NOT NULL,
    feedback TEXT,
    PRIMARY KEY (IdSesi),
    FOREIGN KEY (IdSesi) REFERENCES SesiMentoring(IdSesi)
);
