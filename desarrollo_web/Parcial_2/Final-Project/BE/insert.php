<?php
header('Content-Type: application/json');
header("Cache-Control: no-cache, no-store, must-revalidate"); 
header("Pragma: no-cache"); 
header("Expires: 0");

//? set up the database connection
$servername = "localhost"; //? default server name
$username = "root"; //? default username
$password = "AlmLan@1911-"; //? my passs form XAMPP
$dbname = "webdev";  //? database name

//? Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

//? Check connection
if ($conn -> connect_error)
    die(json_decode(array("error" => "Connection failed: " . $conn -> connect_error)));

//? Get the data from the frontend
$data = json_decode(file_get_contents("php://input"), true);

//?Check that the data was received corrctly
if($data){
    //? extract the data from the object
    $name = $conn -> real_escape_string($data['name']); //? escape the string to prevent SQL injection
    $age  = intval($data['age']); //? convert the string to an integer
    $email = $conn -> real_escape_string($data['email']);

    //? validate that the fields are not empty and are correct
    if(!empty($name) && filter_var($email, FILTER_VALIDATE_EMAIL) && $age > 0){
        //? SQL query to insert the data into the users table
        $sql = "INSERT INTO users (name, age, email) VALUES ('$name', $age, '$email')";

        if($conn -> query($sql) === TRUE){
            //? send a success message
            echo json_encode(array("message" => "User successfully registered in the database"));
        } else {
            //? send an error message
            echo json_encode(array("error" => "error reguistering the user: " . $conn -> error));
        }
    } else {
        //? send an error message if data not valid
        http_response_code(400);
        echo json_encode(array("error" => "Invalid data. please check that all fields are correct"));
    }
    
} else { 
    //? in no data was received, send error
    http_response_code(400);
    echo json_encode(array("error" => "No data was received"));
}

//? Close the database connection  
$conn -> close();
?>