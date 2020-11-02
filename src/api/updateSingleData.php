<?php include 'db_connection.php';
$conn = OpenCon("coviddata");
$data = file_get_contents("php://input");
$decodedData = json_decode($data, true);
$id;
$sets = array();
foreach ($decodedData as $key => $value) {
    if ($key == "ID") {
        $id = $value;
    } else {
        array_push($sets, "{$key}='{$value}'");
    }
}
$sql = "UPDATE `lga_data` SET " . implode(",", $sets) . " WHERE ID=${id}";
if ($conn->query($sql) == true) {
    echo "Successfully added";
} else {
    echo "Error:" . $conn->error . "<br>";
};

CloseCon($conn);
