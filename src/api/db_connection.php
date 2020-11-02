<?php
//Required for external access, as the data is accessed from localhost:3000 to localhost.
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, X-Requested-With");
header("Content-Type: application/json; charset=UTF-8");

// Function for opening connection to the database that is being requested
function OpenCon($dbname)
{
    $dbhost = "localhost";
    $dbuser = "root";
    $dbpass = "stevenharjapramana";
    $db = $dbname;
    $conn = new mysqli($dbhost, $dbuser, $dbpass, $db) or die("Connect failed: %s\n" . $conn->error);

    return $conn;
}

// Function to close the connection of the database that is already opened.
function CloseCon($conn)
{
    $conn->close();
}
