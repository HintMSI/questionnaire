<?php
class Database {
    private $host = 'localhost';
    private $port = '5432';
    private $db_name = 'questionnaire_db';
    private $username = 'questionnaire_app';
    private $password = '1234';
    private $conn;
    
    public function getConnection() {
        $this->conn = null;
        
        try {
            $dsn = "pgsql:host={$this->host};port={$this->port};dbname={$this->db_name}";
            $this->conn = new PDO($dsn, $this->username, $this->password);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->conn->exec("SET NAMES 'UTF8'");
            return $this->conn;
        } catch(PDOException $exception) {
            error_log("[DB Error] " . $exception->getMessage());
            return null;
        }
    }
}
?>