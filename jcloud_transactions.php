<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
        include 'open.php';
        // $userid = $_GET["userid"];                                              // Get the user input.
        $mysqli->multi_query("CALL ShowTransactions();");      // Execute the query with the input.
        $res = $mysqli->store_result();
                $arrVal = array();

                $i=1;
                while ($rowList = mysqli_fetch_array($res)) {

                    $name = array(
                            'transaction_id' => $rowList['transaction_id'],
                            'track_id' => $rowList['track_id'],
                            'title' => $rowList['title'],
                            'user_id' => $rowList['user_id'],
                            'user' => $rowList['user'],
                            'payment_method' => $rowList['payment_method'],
                            'price' => $rowList['price'],

                            );


                            array_push($arrVal, $name);
                        $i++;
                }
                         echo  json_encode($arrVal);


//              mysqli_close($con);
		// return arrVal;
?>

