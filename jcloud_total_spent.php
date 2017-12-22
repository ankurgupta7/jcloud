<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
        include 'open.php';
        $userid = $_GET["userid"];                                              // Get the user input.
        $mysqli->multi_query("CALL ShowSongsRent('".$userid."');");      // Execute the query with the input.
        $res = $mysqli->store_result();
                $arrVal = "";// array();

                while ($rowList = mysqli_fetch_array($res)) {

                    $arrVal = 'money' => $rowList['Total $ Spent']);
                }
                         echo  $arrVal;


//              mysqli_close($con);
		// return arrVal;
?>

