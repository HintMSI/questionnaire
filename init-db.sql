-- Инициализация базы данных DevOps Questionnaire
-- Подключаемся от имени questionnaire_app

-- Таблица пользователей
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Таблица опросов
CREATE TABLE IF NOT EXISTS questionnaires (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Таблица вопросов
CREATE TABLE IF NOT EXISTS questions (
    id SERIAL PRIMARY KEY,
    questionnaire_id INTEGER REFERENCES questionnaires(id),
    question_text TEXT NOT NULL,
    question_type VARCHAR(50) DEFAULT 'text',
    question_order INTEGER NOT NULL
);

-- Таблица ответов
CREATE TABLE IF NOT EXISTS answers (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    question_id INTEGER REFERENCES questions(id),
    answer_text TEXT NOT NULL,
    answered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Тестовые данные
INSERT INTO questionnaires (title, description) VALUES 
('DevOps Basics', 'Основные вопросы по DevOps практикам'),
('Linux Administration', 'Вопросы по администрированию Linux');

INSERT INTO questions (questionnaire_id, question_text, question_type, question_order) VALUES
(1, 'Что такое CI/CD?', 'text', 1),
(1, 'Какие инструменты контейнеризации вы знаете?', 'checkbox', 2),
(1, 'Опишите процесс деплоя приложения', 'text', 3),
(2, 'Как посмотреть запущенные процессы?', 'radio', 1),
(2, 'Как изменить права доступа к файлу?', 'text', 2);

-- Проверка
SELECT 'Таблицы созданы успешно!' as status;
SELECT COUNT(*) as users FROM users;
SELECT COUNT(*) as questionnaires FROM questionnaires;
SELECT COUNT(*) as questions FROM questions;