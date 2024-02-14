<?php
    $conn = mysqli_connect("localhost","root","");
    mysqli_select_db($conn,"manu");
    
    
    $ref=$_POST["ref"];
    $qteReel=$_POST["qteReel"];
    
    
    $sql = "UPDATE manutention_detail SET qt_reel_manutention = $qteReel WHERE id_manutention = $ref";
    $result = mysqli_query($conn,$sql);
    
    if($result){
         echo "Enregistré";
        
     }
    else{
         echo "Echec";
     }
     mysqli_close($conn);
?>
