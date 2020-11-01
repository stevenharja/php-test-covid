<?php include 'db_connection.php';

$conn = OpenCon();

echo "Connected succesfully";
$result = $conn->query("SELECT * FROM `lga_data`");
echo $result->num_rows;

CloseCon($conn);
