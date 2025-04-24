<?php
$conn = new mysqli("localhost", "root", "", "Practice");
if ($conn->connect_error){
    die("Не удалось подключиться");
}
$sql = "SELECT * FROM Store WHERE Amount > 0";
if($result = $conn->query($sql)){
    foreach($result as $row){
        $ProductName = $row["ProductName"];
        $Amount = $row["Amount"];
        echo "{$ProductName} - {$Amount}<br/>";
        
    }
}
