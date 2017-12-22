<html>
    <body>
        <?php
            include 'open.php';
            $password = $_POST["password"];                                 		// Get the user input.
            $ssn = $_POST["ssn"];                                 		// Get the user input.
            $score = $_POST["score"];                                 		// Get the user input.
	    
	    if (!ctype_digit($score)) 
	    {
		echo "Score should be a number";
		return;	
	    }
	    if($score < 0 || $score > 100)
	    {
	    	echo "score should be between 0-100";
		return;
	    }
	    $mysqli->multi_query("CALL UpdateMidterm('$password','$ssn', '$score');");      // Execute the query with the input.
            $res = $mysqli->store_result();
	    if ($res) {
                while ($row = $res->fetch_assoc()) {
                    echo $row['Result'] ;        		// Print every row of the result.
                }
                $res->free();                                               				// Clean-up.
            } else {
                printf("<br>Error: %s\n", $mysqli->error);                 		// The procedure failed to execute.
            }
            $mysqli->close();                                               				// Clean-up.
        ?>
    </body>
</html>

