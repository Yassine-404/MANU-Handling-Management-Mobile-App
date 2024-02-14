<?php
$conn=mysqli_connect("localhost","root","");
mysqli_select_db($conn,"manu");

$matricule=$_GET['t3'];
$mdp=$_GET['t4'];

$qry="select * from utilisateur where matricule='$matricule' and mdp='$mdp' and id_profil='2'";

$raw=mysqli_query($conn,$qry);

$count=mysqli_num_rows($raw);

if($count>0)
 echo "found";
else
 echo "Matricule ou mot de passe incorrect";
?>