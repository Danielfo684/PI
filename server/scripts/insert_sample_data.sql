-- Inserción de usuarios
INSERT IGNORE INTO users (username, email, password, is_admin) VALUES
  ('user1', 'user1@gmail.com', SHA2('password1', 256), FALSE),
  ('user2', 'user2@gmail.com', SHA2('password2', 256), FALSE),
  ('ismael', 'ismael@gmail.com', SHA2('123456', 256), FALSE),
  ('alvaro', 'alvaro@gmail.com', SHA2('123456', 256), FALSE),
  ('dani', 'dani@gmail.com', SHA2('123456', 256), FALSE),
  ('javi', 'javi@gmail.com', SHA2('123456', 256), FALSE);

-- Inserción de jugadores
INSERT IGNORE INTO players (user_id, partida_info) VALUES
  ((SELECT id FROM users WHERE email='user1@gmail.com'), 'Jugador uno'),
  ((SELECT id FROM users WHERE email='user2@gmail.com'), 'Jugador dos');

-- TEST 1: Inglés B1
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Inglés B1', 'Test para evaluar nivel intermedio de inglés.', (SELECT id FROM users WHERE email='user1@gmail.com'), TRUE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Inglés B1' ORDER BY id DESC LIMIT 1), 'Pregunta 1 del test Inglés B1');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 1 del test Inglés B1', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 1 del test Inglés B1', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 1 del test Inglés B1', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 1 del test Inglés B1', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Inglés B1' ORDER BY id DESC LIMIT 1), 'Pregunta 2 del test Inglés B1');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 2 del test Inglés B1', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 2 del test Inglés B1', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 2 del test Inglés B1', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 2 del test Inglés B1', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Inglés B1' ORDER BY id DESC LIMIT 1), 'Pregunta 3 del test Inglés B1');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 3 del test Inglés B1', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 3 del test Inglés B1', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 3 del test Inglés B1', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 3 del test Inglés B1', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Inglés B1' ORDER BY id DESC LIMIT 1), 'Pregunta 4 del test Inglés B1');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 4 del test Inglés B1', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 4 del test Inglés B1', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 4 del test Inglés B1', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 4 del test Inglés B1', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Inglés B1' ORDER BY id DESC LIMIT 1), 'Pregunta 5 del test Inglés B1');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 5 del test Inglés B1', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 5 del test Inglés B1', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 5 del test Inglés B1', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 5 del test Inglés B1', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Inglés B1' ORDER BY id DESC LIMIT 1), 'Pregunta 6 del test Inglés B1');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 6 del test Inglés B1', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 6 del test Inglés B1', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 6 del test Inglés B1', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 6 del test Inglés B1', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Inglés B1' ORDER BY id DESC LIMIT 1), 'Pregunta 7 del test Inglés B1');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 7 del test Inglés B1', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 7 del test Inglés B1', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 7 del test Inglés B1', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 7 del test Inglés B1', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Inglés B1' ORDER BY id DESC LIMIT 1), 'Pregunta 8 del test Inglés B1');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 8 del test Inglés B1', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 8 del test Inglés B1', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 8 del test Inglés B1', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 8 del test Inglés B1', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Inglés B1' ORDER BY id DESC LIMIT 1), 'Pregunta 9 del test Inglés B1');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 9 del test Inglés B1', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 9 del test Inglés B1', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 9 del test Inglés B1', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 9 del test Inglés B1', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Inglés B1' ORDER BY id DESC LIMIT 1), 'Pregunta 10 del test Inglés B1');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 10 del test Inglés B1', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 10 del test Inglés B1', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 10 del test Inglés B1', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Inglés B1' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 10 del test Inglés B1', FALSE);

-- TEST 2: Geografía
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Geografía', 'Test para evaluar conocimientos básicos de geografía.', (SELECT id FROM users WHERE email='user1@gmail.com'), TRUE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Geografía' ORDER BY id DESC LIMIT 1), 'Pregunta 1 del test Geografía');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 1 del test Geografía', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 1 del test Geografía', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 1 del test Geografía', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 1 del test Geografía', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Geografía' ORDER BY id DESC LIMIT 1), 'Pregunta 2 del test Geografía');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 2 del test Geografía', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 2 del test Geografía', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 2 del test Geografía', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 2 del test Geografía', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Geografía' ORDER BY id DESC LIMIT 1), 'Pregunta 3 del test Geografía');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 3 del test Geografía', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 3 del test Geografía', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 3 del test Geografía', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 3 del test Geografía', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Geografía' ORDER BY id DESC LIMIT 1), 'Pregunta 4 del test Geografía');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 4 del test Geografía', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 4 del test Geografía', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 4 del test Geografía', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 4 del test Geografía', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Geografía' ORDER BY id DESC LIMIT 1), 'Pregunta 5 del test Geografía');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 5 del test Geografía', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 5 del test Geografía', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 5 del test Geografía', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 5 del test Geografía', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Geografía' ORDER BY id DESC LIMIT 1), 'Pregunta 6 del test Geografía');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 6 del test Geografía', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 6 del test Geografía', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 6 del test Geografía', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 6 del test Geografía', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Geografía' ORDER BY id DESC LIMIT 1), 'Pregunta 7 del test Geografía');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 7 del test Geografía', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 7 del test Geografía', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 7 del test Geografía', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 7 del test Geografía', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Geografía' ORDER BY id DESC LIMIT 1), 'Pregunta 8 del test Geografía');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 8 del test Geografía', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 8 del test Geografía', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 8 del test Geografía', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 8 del test Geografía', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Geografía' ORDER BY id DESC LIMIT 1), 'Pregunta 9 del test Geografía');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 9 del test Geografía', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 9 del test Geografía', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 9 del test Geografía', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 9 del test Geografía', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Geografía' ORDER BY id DESC LIMIT 1), 'Pregunta 10 del test Geografía');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 10 del test Geografía', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 10 del test Geografía', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 10 del test Geografía', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Geografía' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 10 del test Geografía', FALSE);

-- TEST 3: Física
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Física', 'Test sobre conceptos básicos de física.', (SELECT id FROM users WHERE email='user2@gmail.com'), TRUE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Física' ORDER BY id DESC LIMIT 1), 'Pregunta 1 del test Física');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 1 del test Física', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 1 del test Física', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 1 del test Física', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 1 del test Física', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Física' ORDER BY id DESC LIMIT 1), 'Pregunta 2 del test Física');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 2 del test Física', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 2 del test Física', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 2 del test Física', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 2 del test Física', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Física' ORDER BY id DESC LIMIT 1), 'Pregunta 3 del test Física');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 3 del test Física', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 3 del test Física', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 3 del test Física', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 3 del test Física', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Física' ORDER BY id DESC LIMIT 1), 'Pregunta 4 del test Física');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 4 del test Física', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 4 del test Física', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 4 del test Física', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 4 del test Física', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Física' ORDER BY id DESC LIMIT 1), 'Pregunta 5 del test Física');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 5 del test Física', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 5 del test Física', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 5 del test Física', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 5 del test Física', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Física' ORDER BY id DESC LIMIT 1), 'Pregunta 6 del test Física');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 6 del test Física', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 6 del test Física', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 6 del test Física', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 6 del test Física', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Física' ORDER BY id DESC LIMIT 1), 'Pregunta 7 del test Física');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 7 del test Física', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 7 del test Física', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 7 del test Física', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 7 del test Física', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Física' ORDER BY id DESC LIMIT 1), 'Pregunta 8 del test Física');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 8 del test Física', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 8 del test Física', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 8 del test Física', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 8 del test Física', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Física' ORDER BY id DESC LIMIT 1), 'Pregunta 9 del test Física');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 9 del test Física', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 9 del test Física', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 9 del test Física', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 9 del test Física', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Física' ORDER BY id DESC LIMIT 1), 'Pregunta 10 del test Física');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 10 del test Física', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 10 del test Física', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 10 del test Física', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Física' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 10 del test Física', FALSE);

-- TEST 4: Matemáticas
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Matemáticas', 'Test de conocimientos matemáticos básicos.', (SELECT id FROM users WHERE email='user2@gmail.com'), TRUE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Matemáticas' ORDER BY id DESC LIMIT 1), 'Pregunta 1 del test Matemáticas');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 1 del test Matemáticas', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 1 del test Matemáticas', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 1 del test Matemáticas', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 1 del test Matemáticas', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Matemáticas' ORDER BY id DESC LIMIT 1), 'Pregunta 2 del test Matemáticas');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 2 del test Matemáticas', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 2 del test Matemáticas', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 2 del test Matemáticas', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 2 del test Matemáticas', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Matemáticas' ORDER BY id DESC LIMIT 1), 'Pregunta 3 del test Matemáticas');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 3 del test Matemáticas', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 3 del test Matemáticas', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 3 del test Matemáticas', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 3 del test Matemáticas', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Matemáticas' ORDER BY id DESC LIMIT 1), 'Pregunta 4 del test Matemáticas');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 4 del test Matemáticas', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 4 del test Matemáticas', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 4 del test Matemáticas', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 4 del test Matemáticas', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Matemáticas' ORDER BY id DESC LIMIT 1), 'Pregunta 5 del test Matemáticas');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 5 del test Matemáticas', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 5 del test Matemáticas', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 5 del test Matemáticas', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 5 del test Matemáticas', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Matemáticas' ORDER BY id DESC LIMIT 1), 'Pregunta 6 del test Matemáticas');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 6 del test Matemáticas', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 6 del test Matemáticas', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 6 del test Matemáticas', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 6 del test Matemáticas', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Matemáticas' ORDER BY id DESC LIMIT 1), 'Pregunta 7 del test Matemáticas');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 7 del test Matemáticas', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 7 del test Matemáticas', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 7 del test Matemáticas', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 7 del test Matemáticas', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Matemáticas' ORDER BY id DESC LIMIT 1), 'Pregunta 8 del test Matemáticas');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 8 del test Matemáticas', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 8 del test Matemáticas', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 8 del test Matemáticas', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 8 del test Matemáticas', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Matemáticas' ORDER BY id DESC LIMIT 1), 'Pregunta 9 del test Matemáticas');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 9 del test Matemáticas', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 9 del test Matemáticas', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 9 del test Matemáticas', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 9 del test Matemáticas', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Matemáticas' ORDER BY id DESC LIMIT 1), 'Pregunta 10 del test Matemáticas');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 10 del test Matemáticas', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 10 del test Matemáticas', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 10 del test Matemáticas', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Matemáticas' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 10 del test Matemáticas', FALSE);

-- TEST 5: Historia
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Historia', 'Test de historia general.', (SELECT id FROM users WHERE email='user2@gmail.com'), TRUE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Historia' ORDER BY id DESC LIMIT 1), 'Pregunta 1 del test Historia');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 1 del test Historia', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 1 del test Historia', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 1 del test Historia', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 1 del test Historia', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Historia' ORDER BY id DESC LIMIT 1), 'Pregunta 2 del test Historia');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 2 del test Historia', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 2 del test Historia', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 2 del test Historia', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 2 del test Historia', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Historia' ORDER BY id DESC LIMIT 1), 'Pregunta 3 del test Historia');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 3 del test Historia', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 3 del test Historia', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 3 del test Historia', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 3 del test Historia', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Historia' ORDER BY id DESC LIMIT 1), 'Pregunta 4 del test Historia');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 4 del test Historia', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 4 del test Historia', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 4 del test Historia', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 4 del test Historia', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Historia' ORDER BY id DESC LIMIT 1), 'Pregunta 5 del test Historia');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 5 del test Historia', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 5 del test Historia', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 5 del test Historia', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 5 del test Historia', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Historia' ORDER BY id DESC LIMIT 1), 'Pregunta 6 del test Historia');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 6 del test Historia', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 6 del test Historia', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 6 del test Historia', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 6 del test Historia', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Historia' ORDER BY id DESC LIMIT 1), 'Pregunta 7 del test Historia');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 7 del test Historia', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 7 del test Historia', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 7 del test Historia', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 7 del test Historia', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Historia' ORDER BY id DESC LIMIT 1), 'Pregunta 8 del test Historia');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 8 del test Historia', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 8 del test Historia', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 8 del test Historia', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 8 del test Historia', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Historia' ORDER BY id DESC LIMIT 1), 'Pregunta 9 del test Historia');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 9 del test Historia', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 9 del test Historia', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 9 del test Historia', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 9 del test Historia', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Historia' ORDER BY id DESC LIMIT 1), 'Pregunta 10 del test Historia');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 10 del test Historia', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 10 del test Historia', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 10 del test Historia', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Historia' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 10 del test Historia', FALSE);

-- TEST 6: Biología
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Biología', 'Test sobre conocimientos de biología.', (SELECT id FROM users WHERE email='user1@gmail.com'), TRUE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Biología' ORDER BY id DESC LIMIT 1), 'Pregunta 1 del test Biología');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 1 del test Biología', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 1 del test Biología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 1 del test Biología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 1 del test Biología', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Biología' ORDER BY id DESC LIMIT 1), 'Pregunta 2 del test Biología');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 2 del test Biología', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 2 del test Biología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 2 del test Biología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 2 del test Biología', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Biología' ORDER BY id DESC LIMIT 1), 'Pregunta 3 del test Biología');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 3 del test Biología', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 3 del test Biología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 3 del test Biología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 3 del test Biología', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Biología' ORDER BY id DESC LIMIT 1), 'Pregunta 4 del test Biología');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 4 del test Biología', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 4 del test Biología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 4 del test Biología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 4 del test Biología', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Biología' ORDER BY id DESC LIMIT 1), 'Pregunta 5 del test Biología');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 5 del test Biología', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 5 del test Biología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 5 del test Biología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 5 del test Biología', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Biología' ORDER BY id DESC LIMIT 1), 'Pregunta 6 del test Biología');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 6 del test Biología', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 6 del test Biología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 6 del test Biología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 6 del test Biología', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Biología' ORDER BY id DESC LIMIT 1), 'Pregunta 7 del test Biología');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 7 del test Biología', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 7 del test Biología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 7 del test Biología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 7 del test Biología', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Biología' ORDER BY id DESC LIMIT 1), 'Pregunta 8 del test Biología');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 8 del test Biología', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 8 del test Biología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 8 del test Biología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 8 del test Biología', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Biología' ORDER BY id DESC LIMIT 1), 'Pregunta 9 del test Biología');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 9 del test Biología', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 9 del test Biología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 9 del test Biología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 9 del test Biología', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Biología' ORDER BY id DESC LIMIT 1), 'Pregunta 10 del test Biología');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 10 del test Biología', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 10 del test Biología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 10 del test Biología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Biología' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 10 del test Biología', FALSE);

-- TEST 7: Cultura general
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Cultura general', 'Test para evaluar conocimientos generales.', (SELECT id FROM users WHERE email='user1@gmail.com'), TRUE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Cultura general' ORDER BY id DESC LIMIT 1), 'Pregunta 1 del test Cultura general');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 1 del test Cultura general', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 1 del test Cultura general', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 1 del test Cultura general', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 1 del test Cultura general', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Cultura general' ORDER BY id DESC LIMIT 1), 'Pregunta 2 del test Cultura general');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 2 del test Cultura general', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 2 del test Cultura general', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 2 del test Cultura general', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 2 del test Cultura general', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Cultura general' ORDER BY id DESC LIMIT 1), 'Pregunta 3 del test Cultura general');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 3 del test Cultura general', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 3 del test Cultura general', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 3 del test Cultura general', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 3 del test Cultura general', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Cultura general' ORDER BY id DESC LIMIT 1), 'Pregunta 4 del test Cultura general');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 4 del test Cultura general', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 4 del test Cultura general', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 4 del test Cultura general', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 4 del test Cultura general', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Cultura general' ORDER BY id DESC LIMIT 1), 'Pregunta 5 del test Cultura general');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 5 del test Cultura general', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 5 del test Cultura general', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 5 del test Cultura general', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 5 del test Cultura general', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Cultura general' ORDER BY id DESC LIMIT 1), 'Pregunta 6 del test Cultura general');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 6 del test Cultura general', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 6 del test Cultura general', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 6 del test Cultura general', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 6 del test Cultura general', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Cultura general' ORDER BY id DESC LIMIT 1), 'Pregunta 7 del test Cultura general');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 7 del test Cultura general', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 7 del test Cultura general', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 7 del test Cultura general', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 7 del test Cultura general', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Cultura general' ORDER BY id DESC LIMIT 1), 'Pregunta 8 del test Cultura general');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 8 del test Cultura general', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 8 del test Cultura general', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 8 del test Cultura general', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 8 del test Cultura general', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Cultura general' ORDER BY id DESC LIMIT 1), 'Pregunta 9 del test Cultura general');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 9 del test Cultura general', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 9 del test Cultura general', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 9 del test Cultura general', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 9 del test Cultura general', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Cultura general' ORDER BY id DESC LIMIT 1), 'Pregunta 10 del test Cultura general');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 10 del test Cultura general', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 10 del test Cultura general', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 10 del test Cultura general', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Cultura general' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 10 del test Cultura general', FALSE);

-- TEST 8: Tecnología
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Tecnología', 'Test sobre conocimientos tecnológicos.', (SELECT id FROM users WHERE email='user1@gmail.com'), TRUE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Tecnología' ORDER BY id DESC LIMIT 1), 'Pregunta 1 del test Tecnología');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 1 del test Tecnología', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 1 del test Tecnología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 1 del test Tecnología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 1 del test Tecnología', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Tecnología' ORDER BY id DESC LIMIT 1), 'Pregunta 2 del test Tecnología');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 2 del test Tecnología', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 2 del test Tecnología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 2 del test Tecnología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 2 del test Tecnología', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Tecnología' ORDER BY id DESC LIMIT 1), 'Pregunta 3 del test Tecnología');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 3 del test Tecnología', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 3 del test Tecnología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 3 del test Tecnología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 3 del test Tecnología', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Tecnología' ORDER BY id DESC LIMIT 1), 'Pregunta 4 del test Tecnología');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 4 del test Tecnología', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 4 del test Tecnología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 4 del test Tecnología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 4 del test Tecnología', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Tecnología' ORDER BY id DESC LIMIT 1), 'Pregunta 5 del test Tecnología');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 5 del test Tecnología', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 5 del test Tecnología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 5 del test Tecnología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 5 del test Tecnología', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Tecnología' ORDER BY id DESC LIMIT 1), 'Pregunta 6 del test Tecnología');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 6 del test Tecnología', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 6 del test Tecnología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 6 del test Tecnología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 6 del test Tecnología', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Tecnología' ORDER BY id DESC LIMIT 1), 'Pregunta 7 del test Tecnología');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 7 del test Tecnología', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 7 del test Tecnología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 7 del test Tecnología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 7 del test Tecnología', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Tecnología' ORDER BY id DESC LIMIT 1), 'Pregunta 8 del test Tecnología');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 8 del test Tecnología', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 8 del test Tecnología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 8 del test Tecnología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 8 del test Tecnología', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Tecnología' ORDER BY id DESC LIMIT 1), 'Pregunta 9 del test Tecnología');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 9 del test Tecnología', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 9 del test Tecnología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 9 del test Tecnología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 9 del test Tecnología', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Tecnología' ORDER BY id DESC LIMIT 1), 'Pregunta 10 del test Tecnología');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 10 del test Tecnología', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 10 del test Tecnología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 10 del test Tecnología', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Tecnología' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 10 del test Tecnología', FALSE);

-- TEST 9: Lengua española
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Lengua española', 'Test sobre gramática y ortografía del español.', (SELECT id FROM users WHERE email='user1@gmail.com'), TRUE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Lengua española' ORDER BY id DESC LIMIT 1), 'Pregunta 1 del test Lengua española');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 1 del test Lengua española', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 1 del test Lengua española', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 1 del test Lengua española', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 1 del test Lengua española', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Lengua española' ORDER BY id DESC LIMIT 1), 'Pregunta 2 del test Lengua española');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 2 del test Lengua española', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 2 del test Lengua española', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 2 del test Lengua española', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 2 del test Lengua española', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Lengua española' ORDER BY id DESC LIMIT 1), 'Pregunta 3 del test Lengua española');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 3 del test Lengua española', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 3 del test Lengua española', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 3 del test Lengua española', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 3 del test Lengua española', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Lengua española' ORDER BY id DESC LIMIT 1), 'Pregunta 4 del test Lengua española');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 4 del test Lengua española', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 4 del test Lengua española', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 4 del test Lengua española', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 4 del test Lengua española', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Lengua española' ORDER BY id DESC LIMIT 1), 'Pregunta 5 del test Lengua española');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 5 del test Lengua española', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 5 del test Lengua española', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 5 del test Lengua española', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 5 del test Lengua española', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Lengua española' ORDER BY id DESC LIMIT 1), 'Pregunta 6 del test Lengua española');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 6 del test Lengua española', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 6 del test Lengua española', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 6 del test Lengua española', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 6 del test Lengua española', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Lengua española' ORDER BY id DESC LIMIT 1), 'Pregunta 7 del test Lengua española');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 7 del test Lengua española', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 7 del test Lengua española', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 7 del test Lengua española', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 7 del test Lengua española', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Lengua española' ORDER BY id DESC LIMIT 1), 'Pregunta 8 del test Lengua española');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 8 del test Lengua española', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 8 del test Lengua española', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 8 del test Lengua española', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 8 del test Lengua española', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Lengua española' ORDER BY id DESC LIMIT 1), 'Pregunta 9 del test Lengua española');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 9 del test Lengua española', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 9 del test Lengua española', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 9 del test Lengua española', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 9 del test Lengua española', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Lengua española' ORDER BY id DESC LIMIT 1), 'Pregunta 10 del test Lengua española');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 10 del test Lengua española', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 10 del test Lengua española', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 10 del test Lengua española', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Lengua española' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 10 del test Lengua española', FALSE);

-- TEST 10: Arte
INSERT INTO tests (title, description, user_id, is_public)
VALUES ('Arte', 'Test sobre historia del arte y artistas famosos.', (SELECT id FROM users WHERE email='user1@gmail.com'), TRUE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Arte' ORDER BY id DESC LIMIT 1), 'Pregunta 1 del test Arte');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 1 del test Arte', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 1 del test Arte', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 1 del test Arte', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 1 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 1 del test Arte', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Arte' ORDER BY id DESC LIMIT 1), 'Pregunta 2 del test Arte');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 2 del test Arte', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 2 del test Arte', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 2 del test Arte', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 2 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 2 del test Arte', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Arte' ORDER BY id DESC LIMIT 1), 'Pregunta 3 del test Arte');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 3 del test Arte', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 3 del test Arte', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 3 del test Arte', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 3 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 3 del test Arte', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Arte' ORDER BY id DESC LIMIT 1), 'Pregunta 4 del test Arte');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 4 del test Arte', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 4 del test Arte', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 4 del test Arte', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 4 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 4 del test Arte', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Arte' ORDER BY id DESC LIMIT 1), 'Pregunta 5 del test Arte');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 5 del test Arte', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 5 del test Arte', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 5 del test Arte', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 5 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 5 del test Arte', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Arte' ORDER BY id DESC LIMIT 1), 'Pregunta 6 del test Arte');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 6 del test Arte', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 6 del test Arte', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 6 del test Arte', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 6 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 6 del test Arte', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Arte' ORDER BY id DESC LIMIT 1), 'Pregunta 7 del test Arte');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 7 del test Arte', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 7 del test Arte', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 7 del test Arte', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 7 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 7 del test Arte', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Arte' ORDER BY id DESC LIMIT 1), 'Pregunta 8 del test Arte');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 8 del test Arte', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 8 del test Arte', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 8 del test Arte', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 8 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 8 del test Arte', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Arte' ORDER BY id DESC LIMIT 1), 'Pregunta 9 del test Arte');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 9 del test Arte', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 9 del test Arte', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 9 del test Arte', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 9 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 9 del test Arte', FALSE);
INSERT INTO questions (test_id, question_text)
VALUES ((SELECT id FROM tests WHERE title='Arte' ORDER BY id DESC LIMIT 1), 'Pregunta 10 del test Arte');
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 1 de la pregunta 10 del test Arte', TRUE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 2 de la pregunta 10 del test Arte', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 3 de la pregunta 10 del test Arte', FALSE);
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES ((SELECT id FROM questions WHERE question_text='Pregunta 10 del test Arte' ORDER BY id DESC LIMIT 1), 'Respuesta 4 de la pregunta 10 del test Arte', FALSE);
