<?php
$conn = mysqli_connect("localhost","root","");
mysqli_select_db($conn,"manu");

$sql = "select * from exercice";
if(!$conn->query($sql)){
    echo "Error in connecting to Database.";
}
else{
    $result = $conn->query($sql);
    if($result->num_rows > 0){
        $return_arr['exercice'] = array();
        while($row = $result->fetch_array()){
            array_push($return_arr['exercice'], array(
                'id_exercice'=>$row['id_exercice'],
                'nm_exercice'=>$row['nm_exercice']
            ));
        }
        echo json_encode($return_arr);
    }
}
?>
