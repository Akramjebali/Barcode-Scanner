
<?php

    $host='localhost';
	$uname='root';
	$pwd='root';
	$db="scan";
	
	$con = @mysql_connect($host,$uname,$pwd) or die("connection failed");
	@mysql_select_db($db,$con) or die("db selection failed");
	 
	$code_bar=$_REQUEST['code_bar'];

	//$code_bar="9780123456786";
	 

	$r=mysql_query("select * from spectateur where num_CIS ='$code_bar'",$con);
	while($row=mysql_fetch_array($r))
	{
		$etat=$row['etat'];
		 
	}
	
    $data = array('id' =>'1','state' => $etat);
    print (json_encode($data));
       
    mysql_close($con);

?>

