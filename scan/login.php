
<?php

    $host='localhost';
	$uname='root';
	$pwd='root';
	$db="scan";
	$i=0;


	$con =@mysql_connect($host,$uname,$pwd) or die("connection failed");
	@mysql_select_db($db,$con) or die("db selection failed");
	 
	$login=$_REQUEST['login'];
	$pwd=$_REQUEST['pwd'];


	 $r=mysql_query("select * from agent_portier where login ='$login' And pwd='$pwd'",$con);
	 while($row=mysql_fetch_array($r))
	 {
		$identifiant=$row['idAgentPortier'];
		$i++; 
	 }


	if( $i==0)
    {
       
       $data = array('state' => '0', 'id' => 'Noid');
       print (json_encode($data));
     }
     else 
     {

		$data = array('state' => '1', 'id' =>$identifiant);
		print (json_encode($data));
      }
 
	
	    mysql_close($con);

?>

