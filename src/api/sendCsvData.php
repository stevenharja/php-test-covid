<?php include 'db_connection.php';

$conn = OpenCon("coviddata");
// Delete all records from lga_data to restart the csv upload
$conn->query("DELETE FROM lga_data");
$csvData = file_get_contents("php://input");
$decodedData = json_decode($csvData, true);
foreach ($decodedData as $item) {
    $keys = array();
    $values = array();
    foreach ($item as $key => $value) {
        // echo $key . " => " . $value . "<br>";
        $dateRegex = "/date/i";
        array_push($keys, "`{$key}`");
        if (preg_match($dateRegex, $key)) {
            // Since date is in format of dd/mm/yyyy, we must transform
            array_push($values, "STR_TO_DATE('{$value}','%d/%m/%Y')");
        } else {
            array_push($values, "'{$value}'");
        }
    }
    // echo "<br>";
    $sql = "INSERT INTO `lga_data`(" . implode(",", $keys) . ") VALUES (" . implode(",", $values) . ");";
    if ($conn->query($sql) == true) {
        echo "Successfully added";
    } else {
        echo "Error:" . $conn->error . "<br>";
    };
}
$result = $conn->query("SELECT * FROM `lga_data`");
echo $result->num_rows;

CloseCon($conn);
