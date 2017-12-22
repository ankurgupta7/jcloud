<?php 
error_reporting(E_ALL);
ini_set('display_errors', '1');
	include 'open.php';
        $userid = $_GET["userid"];                                 		// Get the user input.
        $mysqli->multi_query("CALL ShowUserPlaylist('".$userid."' ,0,0);");      // Execute the query with the input.
        $res = $mysqli->store_result();
		$arrVal = array();
 		
		$i=1;
 		while ($rowList = mysqli_fetch_array($res)) {
 								 
						$name = array(
								// 'num' => $i,
								'title_id' => $rowList['list_id'],
 	 		 	 				'title'=> $rowList['title'],
	 		 	 				'length'=> $rowList['length']
 	 		 	 			);		
 
 
							array_push($arrVal, $name);	
			$i++;			
	 	}
	 		 echo  json_encode($arrVal);		
 
 
//	 	mysqli_close($con);
	 	// return arrVal;
?>   
