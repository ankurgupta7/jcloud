<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
        include 'open.php';
        $userid = $_GET["userid"];                                              // Get the user input.
        $mysqli->multi_query("CALL ShowArtistInfoName('".$userid."');");      // Execute the query with the input.
        $res = $mysqli->store_result();
                $arrVal = array();

                $i=1;
                while ($rowList = mysqli_fetch_array($res)) {

                    $name = array(
                                    // 'num' => $i,
                            'artist_id' => $rowList['artist_id'],
                            'artist_name' => $rowList['artist_name'],
                            'artist_begin_date' => $rowList['artist_begin_date'],
                            'artist_end_date' => $rowList['artist_end_date'],
                            'artist_type' => $rowList['artist_type'],
                            'area' => $rowList['area'],
                            'gender_t' => $rowList['gender_t']
                                    // 'title_id' => $rowList['list_id'],
                                    // 'title'=> $rowList['title'],
                                    // 'length'=> $rowList['length']
                            );


                            array_push($arrVal, $name);
                        $i++;
                }
                         echo  json_encode($arrVal);


//              mysqli_close($con);
		// return arrVal;
?>

