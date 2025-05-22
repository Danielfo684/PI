-- Insert Users (using INSERT IGNORE so they are created only if they don't exist)
INSERT IGNORE INTO users (username, email, password, is_admin)
VALUES 
  ('user1', 'user1@example.com', SHA2('password1', 256), FALSE),
  ('user2', 'user2@example.com', SHA2('password2', 256), FALSE);

-- Insert Players linked to the users
INSERT IGNORE INTO players (user_id, partida_info)
VALUES 
  ((SELECT id FROM users WHERE email='user1@example.com'), 'Información adicional de user1'),
  ((SELECT id FROM users WHERE email='user2@example.com'), 'Información adicional de user2');

--------------------------------------------------------------------------------
-- Now insert 20 Tests; each test will have 10 questions and each question 4 answers.
-- Test subjects: Ingles B1, Geografia, Fisica, Matematicas, Historia, Literatura, Ciencias, Tecnologia, Deportes,
-- Arte, Biologia, Quimica, Economia, Politica, Psicologia, Filosofia, Sociologia, Musica, Cine, Programacion
--------------------------------------------------------------------------------

-- TEST 1: Ingles B1
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Ingles B1', 'Test de inglés nivel B1', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);

-- Questions for Ingles B1
-- Question 1
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Ingles B1' ORDER BY id DESC LIMIT 1), 'Ingles B1 - Question 1: What is the synonym of "happy"?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 1: What is the synonym of "happy"?' ORDER BY id DESC LIMIT 1), 'Joyful', TRUE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 1: What is the synonym of "happy"?' ORDER BY id DESC LIMIT 1), 'Sad', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 1: What is the synonym of "happy"?' ORDER BY id DESC LIMIT 1), 'Angry', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 1: What is the synonym of "happy"?' ORDER BY id DESC LIMIT 1), 'Tired', FALSE);

-- Question 2
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Ingles B1' ORDER BY id DESC LIMIT 1), 'Ingles B1 - Question 2: Choose the correct past tense of "go":');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 2: Choose the correct past tense of "go":' ORDER BY id DESC LIMIT 1), 'Went', TRUE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 2: Choose the correct past tense of "go":' ORDER BY id DESC LIMIT 1), 'Goed', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 2: Choose the correct past tense of "go":' ORDER BY id DESC LIMIT 1), 'Gone', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 2: Choose the correct past tense of "go":' ORDER BY id DESC LIMIT 1), 'Going', FALSE);

-- Question 3
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Ingles B1' ORDER BY id DESC LIMIT 1), 'Ingles B1 - Question 3: What does "alleviate" mean?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 3: What does "alleviate" mean?' ORDER BY id DESC LIMIT 1), 'To make something less severe', TRUE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 3: What does "alleviate" mean?' ORDER BY id DESC LIMIT 1), 'To increase in severity', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 3: What does "alleviate" mean?' ORDER BY id DESC LIMIT 1), 'To move quickly', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 3: What does "alleviate" mean?' ORDER BY id DESC LIMIT 1), 'To challenge', FALSE);

-- Question 4
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Ingles B1' ORDER BY id DESC LIMIT 1), 'Ingles B1 - Question 4: Select the antonym of "difficult":');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 4: Select the antonym of "difficult":' ORDER BY id DESC LIMIT 1), 'Easy', TRUE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 4: Select the antonym of "difficult":' ORDER BY id DESC LIMIT 1), 'Hard', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 4: Select the antonym of "difficult":' ORDER BY id DESC LIMIT 1), 'Tough', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 4: Select the antonym of "difficult":' ORDER BY id DESC LIMIT 1), 'Complex', FALSE);

-- Question 5
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Ingles B1' ORDER BY id DESC LIMIT 1), 'Ingles B1 - Question 5: What is the correct spelling?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 5: What is the correct spelling?' ORDER BY id DESC LIMIT 1), 'Accommodate', TRUE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 5: What is the correct spelling?' ORDER BY id DESC LIMIT 1), 'Acommodate', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 5: What is the correct spelling?' ORDER BY id DESC LIMIT 1), 'Accomodate', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 5: What is the correct spelling?' ORDER BY id DESC LIMIT 1), 'Acomoddate', FALSE);

-- Question 6
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Ingles B1' ORDER BY id DESC LIMIT 1), 'Ingles B1 - Question 6: Choose the word that best completes the sentence: "She ___ to the store yesterday."');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 6: Choose the word that best completes the sentence: "She ___ to the store yesterday."' ORDER BY id DESC LIMIT 1), 'went', TRUE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 6: Choose the word that best completes the sentence: "She ___ to the store yesterday."' ORDER BY id DESC LIMIT 1), 'goes', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 6: Choose the word that best completes the sentence: "She ___ to the store yesterday."' ORDER BY id DESC LIMIT 1), 'gone', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 6: Choose the word that best completes the sentence: "She ___ to the store yesterday."' ORDER BY id DESC LIMIT 1), 'go', FALSE);

-- Question 7
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Ingles B1' ORDER BY id DESC LIMIT 1), 'Ingles B1 - Question 7: What is the plural of "child"?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 7: What is the plural of "child"?' ORDER BY id DESC LIMIT 1), 'Children', TRUE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 7: What is the plural of "child"?' ORDER BY id DESC LIMIT 1), 'Childs', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 7: What is the plural of "child"?' ORDER BY id DESC LIMIT 1), 'Childrens', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 7: What is the plural of "child"?' ORDER BY id DESC LIMIT 1), 'Childer', FALSE);

-- Question 8
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Ingles B1' ORDER BY id DESC LIMIT 1), 'Ingles B1 - Question 8: Fill in the blank: "If I ___ you, I would call immediately."');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 8: Fill in the blank: "If I ___ you, I would call immediately."' ORDER BY id DESC LIMIT 1), 'were', TRUE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 8: Fill in the blank: "If I ___ you, I would call immediately."' ORDER BY id DESC LIMIT 1), 'was', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 8: Fill in the blank: "If I ___ you, I would call immediately."' ORDER BY id DESC LIMIT 1), 'am', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 8: Fill in the blank: "If I ___ you, I would call immediately."' ORDER BY id DESC LIMIT 1), 'be', FALSE);

-- Question 9
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Ingles B1' ORDER BY id DESC LIMIT 1), 'Ingles B1 - Question 9: Which of these words is an adjective?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 9: Which of these words is an adjective?' ORDER BY id DESC LIMIT 1), 'Beautiful', TRUE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 9: Which of these words is an adjective?' ORDER BY id DESC LIMIT 1), 'Quickly', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 9: Which of these words is an adjective?' ORDER BY id DESC LIMIT 1), 'Run', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 9: Which of these words is an adjective?' ORDER BY id DESC LIMIT 1), 'Happily', FALSE);

-- Question 10
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Ingles B1' ORDER BY id DESC LIMIT 1), 'Ingles B1 - Question 10: Complete the idiom: "Break a ___."');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 10: Complete the idiom: "Break a ___."' ORDER BY id DESC LIMIT 1), 'Leg', TRUE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 10: Complete the idiom: "Break a ___."' ORDER BY id DESC LIMIT 1), 'Arm', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 10: Complete the idiom: "Break a ___."' ORDER BY id DESC LIMIT 1), 'Heart', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ingles B1 - Question 10: Complete the idiom: "Break a ___."' ORDER BY id DESC LIMIT 1), 'Glass', FALSE);

--------------------------------------------------------------------------------
-- TEST 2: Geografia
--------------------------------------------------------------------------------
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Geografia', 'Test de geografía básica', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);

-- Questions for Geografia
-- Question 1
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Geografia' ORDER BY id DESC LIMIT 1), 'Geografia - Question 1: What is the largest continent by area?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 1: What is the largest continent by area?' ORDER BY id DESC LIMIT 1), 'Asia', TRUE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 1: What is the largest continent by area?' ORDER BY id DESC LIMIT 1), 'Africa', FALSE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 1: What is the largest continent by area?' ORDER BY id DESC LIMIT 1), 'Europe', FALSE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 1: What is the largest continent by area?' ORDER BY id DESC LIMIT 1), 'Antarctica', FALSE);

-- Question 2
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Geografia' ORDER BY id DESC LIMIT 1), 'Geografia - Question 2: Which river is the longest in the world?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 2: Which river is the longest in the world?' ORDER BY id DESC LIMIT 1), 'Nile', TRUE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 2: Which river is the longest in the world?' ORDER BY id DESC LIMIT 1), 'Amazon', FALSE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 2: Which river is the longest in the world?' ORDER BY id DESC LIMIT 1), 'Yangtze', FALSE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 2: Which river is the longest in the world?' ORDER BY id DESC LIMIT 1), 'Mississippi', FALSE);

-- Question 3
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Geografia' ORDER BY id DESC LIMIT 1), 'Geografia - Question 3: Which country has the largest population?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 3: Which country has the largest population?' ORDER BY id DESC LIMIT 1), 'China', TRUE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 3: Which country has the largest population?' ORDER BY id DESC LIMIT 1), 'India', FALSE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 3: Which country has the largest population?' ORDER BY id DESC LIMIT 1), 'USA', FALSE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 3: Which country has the largest population?' ORDER BY id DESC LIMIT 1), 'Russia', FALSE);

-- Question 4
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Geografia' ORDER BY id DESC LIMIT 1), 'Geografia - Question 4: What is the capital of Australia?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 4: What is the capital of Australia?' ORDER BY id DESC LIMIT 1), 'Canberra', TRUE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 4: What is the capital of Australia?' ORDER BY id DESC LIMIT 1), 'Sydney', FALSE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 4: What is the capital of Australia?' ORDER BY id DESC LIMIT 1), 'Melbourne', FALSE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 4: What is the capital of Australia?' ORDER BY id DESC LIMIT 1), 'Brisbane', FALSE);

-- Questions 5 to 10 for Geografia follow the same pattern
-- (For brevity, here are sample texts for questions 5-10)
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Geografia' ORDER BY id DESC LIMIT 1), 'Geografia - Question 5: Which is the highest mountain in the world?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 5: Which is the highest mountain in the world?' ORDER BY id DESC LIMIT 1), 'Everest', TRUE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 5: Which is the highest mountain in the world?' ORDER BY id DESC LIMIT 1), 'K2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 5: Which is the highest mountain in the world?' ORDER BY id DESC LIMIT 1), 'Kangchenjunga', FALSE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 5: Which is the highest mountain in the world?' ORDER BY id DESC LIMIT 1), 'Lhotse', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Geografia' ORDER BY id DESC LIMIT 1), 'Geografia - Question 6: Which ocean is the largest?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 6: Which ocean is the largest?' ORDER BY id DESC LIMIT 1), 'Pacific', TRUE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 6: Which ocean is the largest?' ORDER BY id DESC LIMIT 1), 'Atlantic', FALSE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 6: Which ocean is the largest?' ORDER BY id DESC LIMIT 1), 'Indian', FALSE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 6: Which ocean is the largest?' ORDER BY id DESC LIMIT 1), 'Arctic', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Geografia' ORDER BY id DESC LIMIT 1), 'Geografia - Question 7: Which desert is the largest in the world?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 7: Which desert is the largest in the world?' ORDER BY id DESC LIMIT 1), 'Sahara', TRUE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 7: Which desert is the largest in the world?' ORDER BY id DESC LIMIT 1), 'Gobi', FALSE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 7: Which desert is the largest in the world?' ORDER BY id DESC LIMIT 1), 'Kalahari', FALSE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 7: Which desert is the largest in the world?' ORDER BY id DESC LIMIT 1), 'Patagonian', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Geografia' ORDER BY id DESC LIMIT 1), 'Geografia - Question 8: What is the longest river in Europe?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 8: What is the longest river in Europe?' ORDER BY id DESC LIMIT 1), 'Volga', TRUE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 8: What is the longest river in Europe?' ORDER BY id DESC LIMIT 1), 'Danube', FALSE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 8: What is the longest river in Europe?' ORDER BY id DESC LIMIT 1), 'Rhine', FALSE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 8: What is the longest river in Europe?' ORDER BY id DESC LIMIT 1), 'Elbe', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Geografia' ORDER BY id DESC LIMIT 1), 'Geografia - Question 9: Which country is known as the Land of the Rising Sun?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 9: Which country is known as the Land of the Rising Sun?' ORDER BY id DESC LIMIT 1), 'Japan', TRUE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 9: Which country is known as the Land of the Rising Sun?' ORDER BY id DESC LIMIT 1), 'China', FALSE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 9: Which country is known as the Land of the Rising Sun?' ORDER BY id DESC LIMIT 1), 'Thailand', FALSE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 9: Which country is known as the Land of the Rising Sun?' ORDER BY id DESC LIMIT 1), 'South Korea', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Geografia' ORDER BY id DESC LIMIT 1), 'Geografia - Question 10: Which U.S. state is known as the "Sunshine State"?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 10: Which U.S. state is known as the "Sunshine State"?' ORDER BY id DESC LIMIT 1), 'Florida', TRUE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 10: Which U.S. state is known as the "Sunshine State"?' ORDER BY id DESC LIMIT 1), 'California', FALSE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 10: Which U.S. state is known as the "Sunshine State"?' ORDER BY id DESC LIMIT 1), 'Texas', FALSE),
  ((SELECT id FROM questions WHERE question_text='Geografia - Question 10: Which U.S. state is known as the "Sunshine State"?' ORDER BY id DESC LIMIT 1), 'Nevada', FALSE);

--------------------------------------------------------------------------------
-- TESTS 3 to 20
--------------------------------------------------------------------------------
-- For brevity, the following tests follow the same insertion pattern.
-- You can adjust the question texts and answers as desired.
-- Example for TEST 3: Fisica
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Fisica', 'Test de física básica', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);

-- Fisica Questions (Questions 1-10)
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Fisica' ORDER BY id DESC LIMIT 1), 'Fisica - Question 1: What is Newton’s first law?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 1: What is Newton’s first law?' ORDER BY id DESC LIMIT 1), 'An object in motion stays in motion unless acted upon by an external force', TRUE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 1: What is Newton’s first law?' ORDER BY id DESC LIMIT 1), 'Force equals mass times acceleration', FALSE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 1: What is Newton’s first law?' ORDER BY id DESC LIMIT 1), 'Energy is conserved', FALSE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 1: What is Newton’s first law?' ORDER BY id DESC LIMIT 1), 'For every action there is an equal and opposite reaction', FALSE);

-- (Repeat similar INSERT statements for Fisica - Questions 2 to 10)

-- TEST 4: Matematicas
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Matematicas', 'Test de matemáticas básicas', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);
-- Insert 10 questions and 4 answers each for Matematicas

-- TEST 5: Historia
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Historia', 'Test de historia mundial', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);
-- Insert 10 questions and 4 answers each for Historia

-- TEST 6: Literatura
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Literatura', 'Test de literatura clásica', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);
-- Insert 10 questions and 4 answers each for Literatura

-- TEST 7: Ciencias
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Ciencias', 'Test de ciencias generales', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);
-- Insert 10 questions and 4 answers each for Ciencias

-- TEST 8: Tecnologia
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Tecnologia', 'Test sobre avances tecnológicos', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);
-- Insert 10 questions and 4 answers each for Tecnologia

-- TEST 9: Deportes
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Deportes', 'Test de deportes internacionales', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);
-- Insert 10 questions and 4 answers each for Deportes

-- TEST 10: Arte
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Arte', 'Test sobre arte y pintura', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);
-- Insert 10 questions and 4 answers each for Arte

-- TEST 11: Biologia
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Biologia', 'Test de biología básica', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);
-- Insert 10 questions and 4 answers each for Biologia

-- TEST 12: Quimica
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Quimica', 'Test de química elemental', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);
-- Insert 10 questions and 4 answers each for Quimica

-- TEST 13: Economia
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Economia', 'Test de economía básica', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);
-- Insert 10 questions and 4 answers each for Economia

-- TEST 14: Politica
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Politica', 'Test sobre sistemas políticos', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);
-- Insert 10 questions and 4 answers each for Politica

-- TEST 15: Psicologia
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Psicologia', 'Test de psicología', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);
-- Insert 10 questions and 4 answers each for Psicologia

-- TEST 16: Filosofia
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Filosofia', 'Test de filosofía clásica', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);
-- Insert 10 questions and 4 answers each for Filosofia

-- TEST 17: Sociologia
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Sociologia', 'Test de sociología', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);
-- Insert 10 questions and 4 answers each for Sociologia

-- TEST 18: Musica
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Musica', 'Test de música y teoría musical', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);
-- Insert 10 questions and 4 answers each for Musica

-- TEST 19: Cine
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Cine', 'Test sobre cine y películas clásicas', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);
-- Insert 10 questions and 4 answers each for Cine

-- TEST 20: Programacion
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Programacion', 'Test de programación y algoritmos', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);
-

-- AUTO-GENERATED TESTS START HERE (18 restantes) --

-- TEST: Fisica
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Fisica', 'Test de fisica', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Fisica' ORDER BY id DESC LIMIT 1), 'Fisica - Question 1: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 1', TRUE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C1', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Fisica' ORDER BY id DESC LIMIT 1), 'Fisica - Question 2: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 2', TRUE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C2', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Fisica' ORDER BY id DESC LIMIT 1), 'Fisica - Question 3: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 3', TRUE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C3', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Fisica' ORDER BY id DESC LIMIT 1), 'Fisica - Question 4: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 4', TRUE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C4', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Fisica' ORDER BY id DESC LIMIT 1), 'Fisica - Question 5: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 5', TRUE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C5', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Fisica' ORDER BY id DESC LIMIT 1), 'Fisica - Question 6: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 6', TRUE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C6', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Fisica' ORDER BY id DESC LIMIT 1), 'Fisica - Question 7: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 7', TRUE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C7', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Fisica' ORDER BY id DESC LIMIT 1), 'Fisica - Question 8: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 8', TRUE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C8', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Fisica' ORDER BY id DESC LIMIT 1), 'Fisica - Question 9: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 9', TRUE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C9', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Fisica' ORDER BY id DESC LIMIT 1), 'Fisica - Question 10: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 10', TRUE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Fisica - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C10', FALSE);

-- TEST: Matematicas
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Matematicas', 'Test de matematicas', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Matematicas' ORDER BY id DESC LIMIT 1), 'Matematicas - Question 1: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 1', TRUE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C1', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Matematicas' ORDER BY id DESC LIMIT 1), 'Matematicas - Question 2: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 2', TRUE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C2', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Matematicas' ORDER BY id DESC LIMIT 1), 'Matematicas - Question 3: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 3', TRUE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C3', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Matematicas' ORDER BY id DESC LIMIT 1), 'Matematicas - Question 4: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 4', TRUE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C4', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Matematicas' ORDER BY id DESC LIMIT 1), 'Matematicas - Question 5: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 5', TRUE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C5', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Matematicas' ORDER BY id DESC LIMIT 1), 'Matematicas - Question 6: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 6', TRUE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C6', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Matematicas' ORDER BY id DESC LIMIT 1), 'Matematicas - Question 7: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 7', TRUE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C7', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Matematicas' ORDER BY id DESC LIMIT 1), 'Matematicas - Question 8: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 8', TRUE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C8', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Matematicas' ORDER BY id DESC LIMIT 1), 'Matematicas - Question 9: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 9', TRUE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C9', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Matematicas' ORDER BY id DESC LIMIT 1), 'Matematicas - Question 10: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 10', TRUE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Matematicas - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C10', FALSE);

-- TEST: Historia
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Historia', 'Test de historia', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Historia' ORDER BY id DESC LIMIT 1), 'Historia - Question 1: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Historia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 1', TRUE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C1', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Historia' ORDER BY id DESC LIMIT 1), 'Historia - Question 2: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Historia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 2', TRUE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C2', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Historia' ORDER BY id DESC LIMIT 1), 'Historia - Question 3: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Historia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 3', TRUE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C3', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Historia' ORDER BY id DESC LIMIT 1), 'Historia - Question 4: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Historia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 4', TRUE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C4', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Historia' ORDER BY id DESC LIMIT 1), 'Historia - Question 5: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Historia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 5', TRUE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C5', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Historia' ORDER BY id DESC LIMIT 1), 'Historia - Question 6: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Historia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 6', TRUE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C6', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Historia' ORDER BY id DESC LIMIT 1), 'Historia - Question 7: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Historia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 7', TRUE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C7', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Historia' ORDER BY id DESC LIMIT 1), 'Historia - Question 8: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Historia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 8', TRUE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C8', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Historia' ORDER BY id DESC LIMIT 1), 'Historia - Question 9: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Historia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 9', TRUE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C9', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Historia' ORDER BY id DESC LIMIT 1), 'Historia - Question 10: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Historia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 10', TRUE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Historia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C10', FALSE);

-- TEST: Literatura
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Literatura', 'Test de literatura', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Literatura' ORDER BY id DESC LIMIT 1), 'Literatura - Question 1: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 1', TRUE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C1', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Literatura' ORDER BY id DESC LIMIT 1), 'Literatura - Question 2: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 2', TRUE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C2', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Literatura' ORDER BY id DESC LIMIT 1), 'Literatura - Question 3: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 3', TRUE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C3', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Literatura' ORDER BY id DESC LIMIT 1), 'Literatura - Question 4: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 4', TRUE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C4', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Literatura' ORDER BY id DESC LIMIT 1), 'Literatura - Question 5: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 5', TRUE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C5', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Literatura' ORDER BY id DESC LIMIT 1), 'Literatura - Question 6: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 6', TRUE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C6', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Literatura' ORDER BY id DESC LIMIT 1), 'Literatura - Question 7: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 7', TRUE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C7', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Literatura' ORDER BY id DESC LIMIT 1), 'Literatura - Question 8: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 8', TRUE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C8', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Literatura' ORDER BY id DESC LIMIT 1), 'Literatura - Question 9: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 9', TRUE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C9', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Literatura' ORDER BY id DESC LIMIT 1), 'Literatura - Question 10: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 10', TRUE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Literatura - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C10', FALSE);

-- TEST: Ciencias
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Ciencias', 'Test de ciencias', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Ciencias' ORDER BY id DESC LIMIT 1), 'Ciencias - Question 1: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 1', TRUE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C1', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Ciencias' ORDER BY id DESC LIMIT 1), 'Ciencias - Question 2: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 2', TRUE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C2', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Ciencias' ORDER BY id DESC LIMIT 1), 'Ciencias - Question 3: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 3', TRUE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C3', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Ciencias' ORDER BY id DESC LIMIT 1), 'Ciencias - Question 4: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 4', TRUE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C4', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Ciencias' ORDER BY id DESC LIMIT 1), 'Ciencias - Question 5: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 5', TRUE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C5', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Ciencias' ORDER BY id DESC LIMIT 1), 'Ciencias - Question 6: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 6', TRUE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C6', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Ciencias' ORDER BY id DESC LIMIT 1), 'Ciencias - Question 7: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 7', TRUE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C7', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Ciencias' ORDER BY id DESC LIMIT 1), 'Ciencias - Question 8: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 8', TRUE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C8', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Ciencias' ORDER BY id DESC LIMIT 1), 'Ciencias - Question 9: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 9', TRUE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C9', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Ciencias' ORDER BY id DESC LIMIT 1), 'Ciencias - Question 10: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 10', TRUE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Ciencias - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C10', FALSE);

-- TEST: Tecnologia
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Tecnologia', 'Test de tecnologia', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Tecnologia' ORDER BY id DESC LIMIT 1), 'Tecnologia - Question 1: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 1', TRUE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C1', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Tecnologia' ORDER BY id DESC LIMIT 1), 'Tecnologia - Question 2: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 2', TRUE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C2', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Tecnologia' ORDER BY id DESC LIMIT 1), 'Tecnologia - Question 3: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 3', TRUE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C3', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Tecnologia' ORDER BY id DESC LIMIT 1), 'Tecnologia - Question 4: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 4', TRUE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C4', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Tecnologia' ORDER BY id DESC LIMIT 1), 'Tecnologia - Question 5: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 5', TRUE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C5', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Tecnologia' ORDER BY id DESC LIMIT 1), 'Tecnologia - Question 6: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 6', TRUE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C6', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Tecnologia' ORDER BY id DESC LIMIT 1), 'Tecnologia - Question 7: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 7', TRUE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C7', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Tecnologia' ORDER BY id DESC LIMIT 1), 'Tecnologia - Question 8: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 8', TRUE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C8', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Tecnologia' ORDER BY id DESC LIMIT 1), 'Tecnologia - Question 9: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 9', TRUE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C9', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Tecnologia' ORDER BY id DESC LIMIT 1), 'Tecnologia - Question 10: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 10', TRUE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Tecnologia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C10', FALSE);

-- TEST: Deportes
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Deportes', 'Test de deportes', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Deportes' ORDER BY id DESC LIMIT 1), 'Deportes - Question 1: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 1', TRUE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C1', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Deportes' ORDER BY id DESC LIMIT 1), 'Deportes - Question 2: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 2', TRUE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C2', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Deportes' ORDER BY id DESC LIMIT 1), 'Deportes - Question 3: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 3', TRUE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C3', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Deportes' ORDER BY id DESC LIMIT 1), 'Deportes - Question 4: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 4', TRUE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C4', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Deportes' ORDER BY id DESC LIMIT 1), 'Deportes - Question 5: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 5', TRUE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C5', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Deportes' ORDER BY id DESC LIMIT 1), 'Deportes - Question 6: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 6', TRUE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C6', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Deportes' ORDER BY id DESC LIMIT 1), 'Deportes - Question 7: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 7', TRUE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C7', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Deportes' ORDER BY id DESC LIMIT 1), 'Deportes - Question 8: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 8', TRUE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C8', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Deportes' ORDER BY id DESC LIMIT 1), 'Deportes - Question 9: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 9', TRUE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C9', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Deportes' ORDER BY id DESC LIMIT 1), 'Deportes - Question 10: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 10', TRUE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Deportes - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C10', FALSE);

-- TEST: Arte
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Arte', 'Test de arte', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Arte' ORDER BY id DESC LIMIT 1), 'Arte - Question 1: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Arte - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 1', TRUE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C1', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Arte' ORDER BY id DESC LIMIT 1), 'Arte - Question 2: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Arte - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 2', TRUE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C2', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Arte' ORDER BY id DESC LIMIT 1), 'Arte - Question 3: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Arte - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 3', TRUE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C3', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Arte' ORDER BY id DESC LIMIT 1), 'Arte - Question 4: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Arte - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 4', TRUE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C4', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Arte' ORDER BY id DESC LIMIT 1), 'Arte - Question 5: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Arte - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 5', TRUE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C5', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Arte' ORDER BY id DESC LIMIT 1), 'Arte - Question 6: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Arte - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 6', TRUE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C6', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Arte' ORDER BY id DESC LIMIT 1), 'Arte - Question 7: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Arte - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 7', TRUE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C7', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Arte' ORDER BY id DESC LIMIT 1), 'Arte - Question 8: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Arte - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 8', TRUE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C8', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Arte' ORDER BY id DESC LIMIT 1), 'Arte - Question 9: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Arte - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 9', TRUE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C9', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Arte' ORDER BY id DESC LIMIT 1), 'Arte - Question 10: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Arte - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 10', TRUE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Arte - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C10', FALSE);

-- TEST: Biologia
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Biologia', 'Test de biologia', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Biologia' ORDER BY id DESC LIMIT 1), 'Biologia - Question 1: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 1', TRUE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C1', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Biologia' ORDER BY id DESC LIMIT 1), 'Biologia - Question 2: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 2', TRUE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C2', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Biologia' ORDER BY id DESC LIMIT 1), 'Biologia - Question 3: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 3', TRUE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C3', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Biologia' ORDER BY id DESC LIMIT 1), 'Biologia - Question 4: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 4', TRUE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C4', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Biologia' ORDER BY id DESC LIMIT 1), 'Biologia - Question 5: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 5', TRUE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C5', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Biologia' ORDER BY id DESC LIMIT 1), 'Biologia - Question 6: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 6', TRUE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C6', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Biologia' ORDER BY id DESC LIMIT 1), 'Biologia - Question 7: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 7', TRUE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C7', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Biologia' ORDER BY id DESC LIMIT 1), 'Biologia - Question 8: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 8', TRUE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C8', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Biologia' ORDER BY id DESC LIMIT 1), 'Biologia - Question 9: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 9', TRUE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C9', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Biologia' ORDER BY id DESC LIMIT 1), 'Biologia - Question 10: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 10', TRUE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Biologia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C10', FALSE);

-- TEST: Quimica
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Quimica', 'Test de quimica', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Quimica' ORDER BY id DESC LIMIT 1), 'Quimica - Question 1: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 1', TRUE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C1', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Quimica' ORDER BY id DESC LIMIT 1), 'Quimica - Question 2: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 2', TRUE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C2', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Quimica' ORDER BY id DESC LIMIT 1), 'Quimica - Question 3: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 3', TRUE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C3', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Quimica' ORDER BY id DESC LIMIT 1), 'Quimica - Question 4: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 4', TRUE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C4', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Quimica' ORDER BY id DESC LIMIT 1), 'Quimica - Question 5: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 5', TRUE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C5', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Quimica' ORDER BY id DESC LIMIT 1), 'Quimica - Question 6: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 6', TRUE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C6', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Quimica' ORDER BY id DESC LIMIT 1), 'Quimica - Question 7: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 7', TRUE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C7', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Quimica' ORDER BY id DESC LIMIT 1), 'Quimica - Question 8: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 8', TRUE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C8', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Quimica' ORDER BY id DESC LIMIT 1), 'Quimica - Question 9: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 9', TRUE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C9', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Quimica' ORDER BY id DESC LIMIT 1), 'Quimica - Question 10: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 10', TRUE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Quimica - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C10', FALSE);

-- TEST: Economia
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Economia', 'Test de economia', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Economia' ORDER BY id DESC LIMIT 1), 'Economia - Question 1: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Economia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 1', TRUE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C1', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Economia' ORDER BY id DESC LIMIT 1), 'Economia - Question 2: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Economia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 2', TRUE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C2', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Economia' ORDER BY id DESC LIMIT 1), 'Economia - Question 3: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Economia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 3', TRUE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C3', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Economia' ORDER BY id DESC LIMIT 1), 'Economia - Question 4: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Economia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 4', TRUE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C4', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Economia' ORDER BY id DESC LIMIT 1), 'Economia - Question 5: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Economia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 5', TRUE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C5', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Economia' ORDER BY id DESC LIMIT 1), 'Economia - Question 6: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Economia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 6', TRUE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C6', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Economia' ORDER BY id DESC LIMIT 1), 'Economia - Question 7: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Economia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 7', TRUE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C7', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Economia' ORDER BY id DESC LIMIT 1), 'Economia - Question 8: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Economia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 8', TRUE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C8', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Economia' ORDER BY id DESC LIMIT 1), 'Economia - Question 9: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Economia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 9', TRUE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C9', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Economia' ORDER BY id DESC LIMIT 1), 'Economia - Question 10: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Economia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 10', TRUE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Economia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C10', FALSE);

-- TEST: Politica
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Politica', 'Test de politica', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Politica' ORDER BY id DESC LIMIT 1), 'Politica - Question 1: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Politica - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 1', TRUE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C1', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Politica' ORDER BY id DESC LIMIT 1), 'Politica - Question 2: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Politica - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 2', TRUE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C2', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Politica' ORDER BY id DESC LIMIT 1), 'Politica - Question 3: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Politica - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 3', TRUE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C3', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Politica' ORDER BY id DESC LIMIT 1), 'Politica - Question 4: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Politica - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 4', TRUE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C4', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Politica' ORDER BY id DESC LIMIT 1), 'Politica - Question 5: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Politica - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 5', TRUE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C5', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Politica' ORDER BY id DESC LIMIT 1), 'Politica - Question 6: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Politica - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 6', TRUE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C6', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Politica' ORDER BY id DESC LIMIT 1), 'Politica - Question 7: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Politica - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 7', TRUE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C7', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Politica' ORDER BY id DESC LIMIT 1), 'Politica - Question 8: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Politica - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 8', TRUE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C8', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Politica' ORDER BY id DESC LIMIT 1), 'Politica - Question 9: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Politica - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 9', TRUE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C9', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Politica' ORDER BY id DESC LIMIT 1), 'Politica - Question 10: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Politica - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 10', TRUE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Politica - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C10', FALSE);

-- TEST: Psicologia
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Psicologia', 'Test de psicologia', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Psicologia' ORDER BY id DESC LIMIT 1), 'Psicologia - Question 1: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 1', TRUE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C1', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Psicologia' ORDER BY id DESC LIMIT 1), 'Psicologia - Question 2: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 2', TRUE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C2', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Psicologia' ORDER BY id DESC LIMIT 1), 'Psicologia - Question 3: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 3', TRUE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C3', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Psicologia' ORDER BY id DESC LIMIT 1), 'Psicologia - Question 4: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 4', TRUE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C4', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Psicologia' ORDER BY id DESC LIMIT 1), 'Psicologia - Question 5: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 5', TRUE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C5', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Psicologia' ORDER BY id DESC LIMIT 1), 'Psicologia - Question 6: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 6', TRUE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C6', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Psicologia' ORDER BY id DESC LIMIT 1), 'Psicologia - Question 7: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 7', TRUE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C7', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Psicologia' ORDER BY id DESC LIMIT 1), 'Psicologia - Question 8: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 8', TRUE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C8', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Psicologia' ORDER BY id DESC LIMIT 1), 'Psicologia - Question 9: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 9', TRUE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C9', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Psicologia' ORDER BY id DESC LIMIT 1), 'Psicologia - Question 10: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 10', TRUE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Psicologia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C10', FALSE);

-- TEST: Filosofia
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Filosofia', 'Test de filosofia', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Filosofia' ORDER BY id DESC LIMIT 1), 'Filosofia - Question 1: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 1', TRUE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C1', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Filosofia' ORDER BY id DESC LIMIT 1), 'Filosofia - Question 2: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 2', TRUE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C2', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Filosofia' ORDER BY id DESC LIMIT 1), 'Filosofia - Question 3: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 3', TRUE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C3', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Filosofia' ORDER BY id DESC LIMIT 1), 'Filosofia - Question 4: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 4', TRUE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C4', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Filosofia' ORDER BY id DESC LIMIT 1), 'Filosofia - Question 5: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 5', TRUE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C5', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Filosofia' ORDER BY id DESC LIMIT 1), 'Filosofia - Question 6: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 6', TRUE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C6', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Filosofia' ORDER BY id DESC LIMIT 1), 'Filosofia - Question 7: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 7', TRUE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C7', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Filosofia' ORDER BY id DESC LIMIT 1), 'Filosofia - Question 8: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 8', TRUE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C8', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Filosofia' ORDER BY id DESC LIMIT 1), 'Filosofia - Question 9: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 9', TRUE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C9', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Filosofia' ORDER BY id DESC LIMIT 1), 'Filosofia - Question 10: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 10', TRUE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Filosofia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C10', FALSE);

-- TEST: Sociologia
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Sociologia', 'Test de sociologia', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Sociologia' ORDER BY id DESC LIMIT 1), 'Sociologia - Question 1: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 1', TRUE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C1', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Sociologia' ORDER BY id DESC LIMIT 1), 'Sociologia - Question 2: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 2', TRUE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C2', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Sociologia' ORDER BY id DESC LIMIT 1), 'Sociologia - Question 3: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 3', TRUE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C3', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Sociologia' ORDER BY id DESC LIMIT 1), 'Sociologia - Question 4: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 4', TRUE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C4', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Sociologia' ORDER BY id DESC LIMIT 1), 'Sociologia - Question 5: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 5', TRUE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C5', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Sociologia' ORDER BY id DESC LIMIT 1), 'Sociologia - Question 6: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 6', TRUE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C6', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Sociologia' ORDER BY id DESC LIMIT 1), 'Sociologia - Question 7: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 7', TRUE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C7', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Sociologia' ORDER BY id DESC LIMIT 1), 'Sociologia - Question 8: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 8', TRUE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C8', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Sociologia' ORDER BY id DESC LIMIT 1), 'Sociologia - Question 9: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 9', TRUE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C9', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Sociologia' ORDER BY id DESC LIMIT 1), 'Sociologia - Question 10: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 10', TRUE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Sociologia - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C10', FALSE);

-- TEST: Musica
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Musica', 'Test de musica', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Musica' ORDER BY id DESC LIMIT 1), 'Musica - Question 1: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Musica - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 1', TRUE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C1', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Musica' ORDER BY id DESC LIMIT 1), 'Musica - Question 2: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Musica - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 2', TRUE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C2', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Musica' ORDER BY id DESC LIMIT 1), 'Musica - Question 3: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Musica - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 3', TRUE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C3', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Musica' ORDER BY id DESC LIMIT 1), 'Musica - Question 4: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Musica - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 4', TRUE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C4', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Musica' ORDER BY id DESC LIMIT 1), 'Musica - Question 5: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Musica - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 5', TRUE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C5', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Musica' ORDER BY id DESC LIMIT 1), 'Musica - Question 6: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Musica - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 6', TRUE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C6', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Musica' ORDER BY id DESC LIMIT 1), 'Musica - Question 7: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Musica - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 7', TRUE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C7', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Musica' ORDER BY id DESC LIMIT 1), 'Musica - Question 8: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Musica - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 8', TRUE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C8', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Musica' ORDER BY id DESC LIMIT 1), 'Musica - Question 9: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Musica - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 9', TRUE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C9', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Musica' ORDER BY id DESC LIMIT 1), 'Musica - Question 10: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Musica - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 10', TRUE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Musica - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C10', FALSE);

-- TEST: Cine
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Cine', 'Test de cine', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Cine' ORDER BY id DESC LIMIT 1), 'Cine - Question 1: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Cine - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 1', TRUE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C1', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Cine' ORDER BY id DESC LIMIT 1), 'Cine - Question 2: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Cine - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 2', TRUE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C2', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Cine' ORDER BY id DESC LIMIT 1), 'Cine - Question 3: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Cine - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 3', TRUE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C3', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Cine' ORDER BY id DESC LIMIT 1), 'Cine - Question 4: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Cine - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 4', TRUE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C4', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Cine' ORDER BY id DESC LIMIT 1), 'Cine - Question 5: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Cine - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 5', TRUE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C5', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Cine' ORDER BY id DESC LIMIT 1), 'Cine - Question 6: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Cine - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 6', TRUE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C6', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Cine' ORDER BY id DESC LIMIT 1), 'Cine - Question 7: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Cine - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 7', TRUE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C7', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Cine' ORDER BY id DESC LIMIT 1), 'Cine - Question 8: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Cine - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 8', TRUE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C8', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Cine' ORDER BY id DESC LIMIT 1), 'Cine - Question 9: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Cine - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 9', TRUE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C9', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Cine' ORDER BY id DESC LIMIT 1), 'Cine - Question 10: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Cine - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 10', TRUE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Cine - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C10', FALSE);

-- TEST: Programacion
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Programacion', 'Test de programacion', (SELECT id FROM users WHERE email='user1@example.com'), TRUE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Programacion' ORDER BY id DESC LIMIT 1), 'Programacion - Question 1: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 1', TRUE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B1', FALSE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 1: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C1', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Programacion' ORDER BY id DESC LIMIT 1), 'Programacion - Question 2: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 2', TRUE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B2', FALSE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 2: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C2', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Programacion' ORDER BY id DESC LIMIT 1), 'Programacion - Question 3: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 3', TRUE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B3', FALSE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 3: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C3', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Programacion' ORDER BY id DESC LIMIT 1), 'Programacion - Question 4: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 4', TRUE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B4', FALSE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 4: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C4', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Programacion' ORDER BY id DESC LIMIT 1), 'Programacion - Question 5: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 5', TRUE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B5', FALSE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 5: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C5', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Programacion' ORDER BY id DESC LIMIT 1), 'Programacion - Question 6: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 6', TRUE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B6', FALSE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 6: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C6', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Programacion' ORDER BY id DESC LIMIT 1), 'Programacion - Question 7: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 7', TRUE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B7', FALSE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 7: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C7', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Programacion' ORDER BY id DESC LIMIT 1), 'Programacion - Question 8: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 8', TRUE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B8', FALSE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 8: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C8', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Programacion' ORDER BY id DESC LIMIT 1), 'Programacion - Question 9: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 9', TRUE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B9', FALSE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 9: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C9', FALSE);

INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Programacion' ORDER BY id DESC LIMIT 1), 'Programacion - Question 10: ¿Cuál es la respuesta correcta?');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta correcta 10', TRUE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta A10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta B10', FALSE),
  ((SELECT id FROM questions WHERE question_text='Programacion - Question 10: ¿Cuál es la respuesta correcta?' ORDER BY id DESC LIMIT 1), 'Respuesta incorrecta C10', FALSE);

