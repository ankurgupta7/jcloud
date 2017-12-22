<html>
    <body>
        <?php
            include 'open.php';
            $password = $_POST["password"];                                 		// Get the user input.
            $mysqli->multi_query("CALL AllRawScoresPHP('".$password"');");      // Execute the query with the input.
            $res = $mysqli->store_result();
            if ($res) {
                echo "<table border=\"1px solid black\">";                  		// The procedure executed successfully.
		echo "<tr>
			<th>SSN  </th> 
			<th>LName   </th> 
			<th>FName    </th> 
			<th>Section </th> 
			<th>HW1    </th> 
			<th>HW2a   </th> 
			<th>HW2b  </th> 
			<th>Midterm </th> 
			<th>HW3    </th> 
			<th>FExam </th>
		     </tr>";
                while ($row = $res->fetch_assoc()) {
			echo "<tr>
			<td>" . $row['SSN'] . 			"</td> 
			<td>" . $row['LName'] . 			"</td> 
			<td>" . $row['FName'] . 			"</td> 
			<td>" . $row['Section'] . 		"</td> 
			<td>" . $row['HW1'] . 			"</td> 
			<td>" . $row['HW2a'] . 			"</td> 
			<td>" . $row['HW2b'] . 			"</td> 
			<td>" . $row['Midterm'] . 		"</td> 
			<td>" . $row['HW3'] . 			"</td> 
			<td>" . $row['FExam'] . 			"</td>	
			</tr>";        		// Print every row of the result.

		}
                echo "</table>";
                $res->free();                                               				// Clean-up.
	    } else {
		$errmsg = $mysqli->error;
		$s = strpos($errmsg, ':');
		$e = strpos($errmsgg,',');
		$msg = substr($errmsg,$s,strlen($errmsg) - $s - 19);

                printf("<br>Error: %s\n", $msg);                 		// The procedure failed to execute.
            }
            $mysqli->close();                                               				// Clean-up.
        ?>
    </body>
</html>

