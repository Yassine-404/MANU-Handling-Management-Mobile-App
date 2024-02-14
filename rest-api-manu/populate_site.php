<?php
$conn = mysqli_connect("localhost","root","");
mysqli_select_db($conn,"manu");

$sql = "select * from site";
if(!$conn->query($sql)){
    echo "Error in connecting to Database.";
}
else{
    $result = $conn->query($sql);
    if($result->num_rows > 0){
        $return_arr['site'] = array();
        while($row = $result->fetch_array()){
            array_push($return_arr['site'], array(
                'id_site'=>$row['id_site'],
                'nm_site'=>$row['nm_site']
            ));
        }
        echo json_encode($return_arr);
    }
}
?>
