<?php
require_once 'config/database.php';
?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>DevOps Questionnaire</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="container">
        <h1>DevOps Questionnaire</h1>
        <p>Приложение успешно развернуто на AlmaLinux!</p>
        <?php
        $database = new Database();
        $db = $database->getConnection();
        
        if ($db) {
            echo '<p style="color:green;">✓ Подключение к PostgreSQL успешно</p>';
            
            // Проверяем таблицы
            $stmt = $db->query("SELECT table_name FROM information_schema.tables WHERE table_schema='public'");
            $tables = $stmt->fetchAll();
            
            if (count($tables) > 0) {
                echo '<p>Таблицы в базе: ';
                foreach ($tables as $table) {
                    echo $table['table_name'] . ' ';
                }
                echo '</p>';
            } else {
                echo '<p>Таблиц пока нет. <a href="install.php">Создать структуру БД</a></p>';
            }
        } else {
            echo '<p style="color:red;">✗ Ошибка подключения к БД</p>';
        }
        ?>
        <p><a href="take_test.php">Пройти тест</a> | <a href="view_results.php">Результаты</a></p>
    </div>
</body>
</html>