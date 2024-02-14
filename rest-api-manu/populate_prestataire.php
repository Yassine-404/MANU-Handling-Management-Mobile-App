<?php
$conn = mysqli_connect("localhost","root","");
mysqli_select_db($conn,"manu");

$sql = "select * from prestataire";
if(!$conn->query($sql)){
    echo "Error in connecting to Database.";
}
else{
    $result = $conn->query($sql);
    if($result->num_rows > 0){
        $return_arr['prestataire'] = array();
        while($row = $result->fetch_array()){
            array_push($return_arr['prestataire'], array(
                'id_prestataire'=>$row['id_prestataire'],
                'nm_prestataire'=>$row['nm_prestataire']
            ));
        }
        echo json_encode($return_arr);
    }
}
?>
