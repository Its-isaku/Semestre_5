<?php
header('Content-Type: application/json');
header("Cache-Control: no-cache, no-store, must-revalidate"); 
header("Pragma: no-cache"); 
header("Expires: 0");

//? Configuración de la conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "AlmLan@1911-";
$dbname = "webdev";

//? Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

//? Verificar conexión
if ($conn->connect_error) {
    die(json_encode(array("error" => "Connection failed: " . $conn->connect_error)));
}

//? Consulta SQL para obtener todos los usuarios
$sql = "SELECT name, age, email FROM users";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    //? Array para almacenar los datos de usuarios
    $users = array();
    
    //? Obtener cada fila y agregarla al array
    while($row = $result->fetch_assoc()) {
        $users[] = $row;
    }
    
    //? Devolver los datos como JSON
    echo json_encode(array("users" => $users));
} else {
    echo json_encode(array("users" => [], "message" => "No hay usuarios registrados"));
}

//? Cerrar conexión
$conn->close();
?>