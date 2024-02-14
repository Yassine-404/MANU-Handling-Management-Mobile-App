<?php
$conn = mysqli_connect("localhost","root","");
mysqli_select_db($conn,"manu");

$sql = "select * from article";
if(!$conn->query($sql)){
    echo "Error in connecting to Database.";
}
else{
    $result = $conn->query($sql);
    if($result->num_rows > 0){
        $return_arr['article'] = array();
        while($row = $result->fetch_array()){
            array_push($return_arr['article'], array(
                'id_article'=>$row['id_article'],
                'libelle_article'=>$row['libelle_article']
            ));
        }
        echo json_encode($return_arr);
    }
}
?>
