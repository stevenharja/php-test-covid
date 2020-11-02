<?php include 'db_connection.php';
/*
    Code used to update a single row (designed for the table element in app.js)
*/
$conn = OpenCon($databaseName);
$data = file_get_contents("php://input");
$decodedData = json_decode($data, true);
//  Initialise ID outside with the sets for updating
$id;
$sets = array();
foreach ($decodedData as $key => $value) {
    if ($key == "ID") {
        $id = $value;
    } else {
        array_push($sets, "{$key}='{$value}'");
    }
}
$sql = "UPDATE `{$tableName}` SET " . implode(",", $sets) . " WHERE ID=${id}";
if ($conn->query($sql) == true) {
    echo "Successfully added";
} else {
    echo "Error:" . $conn->error . "<br>";
};

CloseCon($conn);
