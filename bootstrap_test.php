<?php 
	include 'open.php';
        // $password = $_POST["password"];                                 		// Get the user input.
        $mysqli->multi_query("CALL AllRawScoresPHP('GuessMe');");      // Execute the query with the input.
        $res = $mysqli->store_result();
		$arrVal = array();
 		
		$i=1;
 		while ($rowList = mysqli_fetch_array($res)) {
 								 
						$name = array(
								'num' => $i,
								// 'num' => $rowList['SSN'],
 	 		 	 				'first'=> $rowList['FName'],
	 		 	 				'last'=> $rowList['LName']
 	 		 	 			);		
 
 
							array_push($arrVal, $name);	
			$i++;			
	 	}
	 		 echo  json_encode($arrVal);		
 
 
	 	mysqli_close($con);
?>   
