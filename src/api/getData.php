<?php include 'db_connection.php';

$conn = OpenCon("coviddata");
$result = $conn->query("SELECT * FROM `lga_data`");

// Check if there is any results, if there are no results then do not do anything.
if ($result->num_rows > 0) {
    // output data of each row
    while ($row = $result->fetch_assoc()) {
        // Returns an encoded string with an extra string to split in the App.js
        echo json_encode($row);
        echo "split";
    }
}

CloseCon($conn);
