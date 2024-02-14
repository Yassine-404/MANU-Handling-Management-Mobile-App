<?php
    $conn = mysqli_connect("localhost","root","");
    mysqli_select_db($conn,"manu");
    
    
    $ordonnateur=$_POST["ordonnateur"];

    $exer=$_POST["exercice"];
    $exercice=$conn->query("SELECT * FROM exercice WHERE nm_exercice='$exer'");
    while($data=$exercice->fetch_assoc())
    {
        $id_exercice=$data['id_exercice'];
    }

    $prest=$_POST["prestataire"];
    $prestataire=$conn->query("SELECT * FROM prestataire WHERE nm_prestataire='$prest'");
    while($data=$prestataire->fetch_assoc())
    {
        $id_prestataire=$data['id_prestataire'];
    }
    
    $sit=$_POST["site"];
    $site=$conn->query("SELECT * FROM site WHERE nm_site='$sit'");
    while($data=$site->fetch_assoc())
    {
        $id_site=$data['id_site'];
    }
    
    $art=$_POST["article"];
    $article=$conn->query("SELECT * FROM article WHERE libelle_article='$art'");
    while($data=$article->fetch_assoc())
    {
        $id_article=$data['id_article'];
    }

    $oper=$_POST["operation"];
    $operation=$conn->query("SELECT * FROM operation WHERE libelle_oper='$oper'");
    while($data=$operation->fetch_assoc())
    {
        $id_operation=$data['id_operation'];
        $pu_manutention=$data['prix_unit'];
    }

    $qte=$_POST["qte"];
    
    $observation=$_POST["observation"];
    
    
    $sql = "INSERT INTO manutention VALUES (NULL,NULL,'$ordonnateur',NULL,NULL,NULL,NULL,NULL,NULL,'$id_exercice','$id_prestataire','$id_site')";
    $result = mysqli_query($conn,$sql);
    
    $id_manutention = mysqli_insert_id($conn);
    $sql = "INSERT INTO manutention_detail VALUES (NULL,'$id_manutention','$qte','$pu_manutention',NULL,'$observation',NULL,NULL,'$id_article','$id_operation','1')";
    $result = mysqli_query($conn,$sql);
    
    
    
    if($result){
         echo "Enregistré";
        
     }
    else{
         echo "Echec";
     }
     mysqli_close($conn);
?>
