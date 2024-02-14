<?php
$conn = mysqli_connect("localhost","root","");
mysqli_select_db($conn,"manu");

$sql = "select * from operation";
if(!$conn->query($sql)){
    echo "Error in connecting to Database.";
}
else{
    $result = $conn->query($sql);
    if($result->num_rows > 0){
        $return_arr['operation'] = array();
        while($row = $result->fetch_array()){
            array_push($return_arr['operation'], array(
                'id_operation'=>$row['id_operation'],
                'libelle_oper'=>$row['libelle_oper']
            ));
        }
        echo json_encode($return_arr);
    }
}
?>
