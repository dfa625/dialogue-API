-- INSERT INTO Modul (teksModul, kategoriModul, mp3Modul) VALUES 
-- ('absquatulate', 'verb', '~/sound/absquatulate.mp3'),
-- ('defenestrate', 'verb', '~/sound/defenestrate.mp3'),
-- ('obfuscate', 'verb', '~/sound/obfuscate.mp3'),
-- ('perambulate', 'verb', '~/sound/perambulate.mp3'),
-- ('bloviate', 'verb', '~/sound/bloviate.mp3'),
-- ('sesquipedalian', 'adjective', '~/sound/sesquipedalian.mp3'),
-- ('pulchritudinous', 'adjective', '~/sound/pulchritudinous.mp3'),
-- ('ineffable', 'adjective', '~/sound/ineffable.mp3'),
-- ('lugubrious', 'adjective', '~/sound/lugubrious.mp3'),
-- ('uxorious', 'adjective', '~/sound/uxorious.mp3'),
-- ('anachronism', 'noun', '~/sound/anachronism.mp3'),
-- ('blunderbuss', 'noun', '~/sound/blunderbuss.mp3'),
-- ('colloquy', 'noun', '~/sound/colloquy.mp3'),
-- ('epiphany', 'noun', '~/sound/epiphany.mp3'),
-- ('mellifluous', 'noun', '~/sound/mellifluous.mp3'),
-- ('flabbergast', 'verb', '~/sound/flabbergast.mp3'),
-- ('persnickety', 'adjective', '~/sound/persnickety.mp3'),
-- ('abscond', 'verb', '~/sound/abscond.mp3'),
-- ('bellwether', 'noun', '~/sound/bellwether.mp3'),
-- ('quixotically', 'adverb', '~/sound/quixotically.mp3');

-- Insert 10 rows into Learner table
INSERT INTO Learner (namaLearner, emailLearner, passwordLearner, nilaiPronounce, nilaiListen, nilaiGrammar, progressMentor, progressWord, progressLvl) VALUES 
('Budi Santoso', 'budi.santoso@yahoo.com', 'GajahMerah12', 85, 90, 88, 5, 50, 1),
('Rina Wijaya', 'rina.wijaya@gmail.com', 'HarimauHitam34', 78, 82, 80, 4, 45, 1),
('Dewi Lestari', 'dewi.lestari@yahoo.com', 'ElangPutih56', 92, 89, 91, 6, 55, 2),
('Agus Saputra', 'agus.saputra@gmail.com', 'KucingBiru78', 76, 85, 79, 3, 40, 1),
('Siti Nurhaliza', 'siti.nurhaliza@yahoo.com', 'BurungHijau90', 88, 87, 86, 5, 50, 1),
('Heri Pranata', 'heri.pranata@gmail.com', 'SerigalaEmas11', 84, 81, 85, 4, 44, 1),
('Wati Rahmawati', 'wati.rahmawati@yahoo.com', 'KelinciPerak22', 90, 93, 89, 6, 60, 2),
('Yanto Permana', 'yanto.permana@gmail.com', 'MacanCoklat33', 77, 79, 76, 3, 42, 1),
('Lina Susanti', 'lina.susanti@yahoo.com', 'UlarHijau44', 91, 88, 90, 5, 53, 1),
('Arif Setiawan', 'arif.setiawan@gmail.com', 'BeruangPutih55', 80, 84, 83, 4, 47, 1);

-- Insert 5 rows into Mentor table
INSERT INTO Mentor (namaMentor, emailMentor, passwordMentor) VALUES 
('Ahmad Fauzi', 'ahmad.fauzi@gmail.com', 'SingaMerah66'),
('Rizka Amelia', 'rizka.amelia@yahoo.com', 'GajahHijau77'),
('Bayu Wirawan', 'bayu.wirawan@gmail.com', 'HarimauCoklat88'),
('Dina Kurnia', 'dina.kurnia@yahoo.com', 'ElangEmas99'),
('Indra Saputra', 'indra.saputra@gmail.com', 'KucingBiru00');

-- Insert 8 rows into SesiMentoring table referencing the same Mentor and Learner
INSERT INTO SesiMentoring (IdMentor, IdLearner, tglSesi, jamSesi, wordSesi, grammarSesi, listenSesi, pronounSesi) VALUES 
(1, 1, '2024-06-01', '10:00:00', 10, 9, 8, 9),
(1, 1, '2024-06-02', '11:00:00', 9, 8, 9, 8),
(1, 1, '2024-06-03', '12:00:00', 10, 10, 9, 9),
(1, 1, '2024-06-04', '13:00:00', 8, 9, 8, 9),
(1, 1, '2024-06-05', '14:00:00', 9, 8, 10, 8),
(1, 1, '2024-06-06', '15:00:00', 10, 9, 9, 10),
(1, 1, '2024-06-07', '16:00:00', 9, 10, 8, 9),
(1, 1, '2024-06-08', '17:00:00', 8, 9, 10, 9);

