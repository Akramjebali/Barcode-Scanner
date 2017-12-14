<?php
    $host='localhost';
	$uname='root';
	$pwd='root';
	$db="scan";
	
	$output=array();

	$con = @mysql_connect($host,$uname,$pwd) or die("connection failed");
	@mysql_select_db($db,$con) or die("db selection failed");
	 

	$id=$_REQUEST['id'];
	$codebar=$_REQUEST['code_bar'];

	
  	$r=@mysql_query("insert into cis_agentportier values('','$codebar','$id',now())",$con);
    if($r>0)	
    {
    $data = array('state' => '1', 'id' => 'Noid');
    print (json_encode($data));

    }else
    {
    	echo "erreur";
    }
    mysql_close();      
       
	
?>