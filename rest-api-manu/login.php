<?php
$conn=mysqli_connect("localhost","root","");
mysqli_select_db($conn,"manu");

$login=$_GET['t1'];
$mdp=$_GET['t2'];

$qry="select * from utilisateur where login='$login' and mdp='$mdp' and id_profil='1'";

$raw=mysqli_query($conn,$qry);

$count=mysqli_num_rows($raw);


$qrya="select * from utilisateur where login='$login' and mdp='$mdp' and id_profil='2'";

$rawa=mysqli_query($conn,$qrya);

$counta=mysqli_num_rows($rawa);


$qryb="select * from utilisateur where login='$login' and mdp='$mdp' and id_profil='3'";

$rawb=mysqli_query($conn,$qryb);

$countb=mysqli_num_rows($rawb);

if($count>0)
 echo "found";
elseif($counta)
 echo "trouve";
elseif($countb)
 echo "ok";
else
 echo "E-mail ou mot de passe incorrect";

?>