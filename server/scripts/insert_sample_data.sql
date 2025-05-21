INSERT INTO users (username, email, password, is_admin)
VALUES 
  ('user1', 'user1@example.com', SHA2('password1', 256), FALSE),
  ('user2', 'user2@example.com', SHA2('password2', 256), FALSE);

-- Inserción de datos en la tabla players, relacionando cada registro con un usuario
INSERT INTO players (user_id, partida_info)
VALUES 
  ((SELECT id FROM users WHERE email='user1@example.com'), 'Información adicional de user1'),
  ((SELECT id FROM users WHERE email='user2@example.com'), 'Información adicional de user2');

-- Inserción de un test de ejemplo en la tabla tests
INSERT INTO tests (title, description, user_id)
VALUES (
  'Sample Test', 
  'Descripción de un test de ejemplo', 
  (SELECT id FROM users WHERE email='user1@example.com')
);
-- Inserción de preguntas para el test insertado
INSERT INTO questions (test_id, question_text)
VALUES
  ((SELECT id FROM tests WHERE title = 'Sample Test'), '¿Cuál es la capital de Francia?'),
  ((SELECT id FROM tests WHERE title = 'Sample Test'), '¿Cuánto es 2+2?');

-- Inserción de respuestas para la primera pregunta
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text = '¿Cuál es la capital de Francia?'), 'Paris', TRUE),
  ((SELECT id FROM questions WHERE question_text = '¿Cuál es la capital de Francia?'), 'Lyon', FALSE),
  ((SELECT id FROM questions WHERE question_text = '¿Cuál es la capital de Francia?'), 'Marseille', FALSE);

-- Inserción de respuestas para la segunda pregunta
INSERT INTO answers (question_id, answer_text, is_correct)
VALUES 
  ((SELECT id FROM questions WHERE question_text = '¿Cuánto es 2+2?'), '4', TRUE),
  ((SELECT id FROM questions WHERE question_text = '¿Cuánto es 2+2?'), '3', FALSE),
  ((SELECT id FROM questions WHERE question_text = '¿Cuánto es 2+2?'), '22', FALSE);