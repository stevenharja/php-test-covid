<?php include 'db_connection.php';

$conn = OpenCon($databaseName);
// Delete all records from lga_data to restart the csv upload
$conn->query("DELETE FROM `{$tableName}`");
// Retrieve content and decode them (as the application will send a POST with the JSON of the CSV)
$csvData = file_get_contents("php://input");
$decodedData = json_decode($csvData, true);
foreach ($decodedData as $item) {
    $keys = array();
    $values = array();
    foreach ($item as $key => $value) {
        $dateRegex = "/date/i";
        array_push($keys, "`{$key}`");
        if (preg_match($dateRegex, $key)) {
            // Since date is in format of dd/mm/yyyy, we must transform
            array_push($values, "STR_TO_DATE('{$value}','%d/%m/%Y')");
        } else {
            array_push($values, "'{$value}'");
        }
    }
    $sql = "INSERT INTO `{$tableName}`(" . implode(",", $keys) . ") VALUES (" . implode(",", $values) . ");";
    if ($conn->query($sql) == true) {
        echo "Successfully added";
    } else {
        echo "Error:" . $conn->error . "<br>";
    };
}
$result = $conn->query("SELECT * FROM `{$tableName}`");
echo $result->num_rows;

CloseCon($conn);
