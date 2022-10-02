<!DOCTYPE html>
<html>
    <header>
        <head>
            <meta charset="utf-8" />
            <meta http-equiv="x-ua-compatible" content="ie=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <title>Managers</title>
            <link rel="stylesheet" href="css/style.css" />
            <style>
                h1{
                    margin-top:100px;
                    width: 250px;
                    margin-bottom: 20px; 
                    padding-left: 20px;
                    border-left: 4px gold solid;
                    
                    }
                footer{
                    margin-top: 150px;
                    border-top:2px solid grey;
                }
                footer p {
                    width:100%;
                    text-align: center;
                }
            </style>
        </head>
    </header>
    <body class= "homepage">
        <a href="home2.php"><h1> TROTRO MANAGEMENT SYSTEM </h1></a>
		<a href="home2.php"><img src="images/bus.png" alt="bus" width="200" height="200"></a>
        <div class="homediv" class="table_top">
            <!-- connect to the database -->
            <?php
                $servername = "localhost";
                $username = "root";
                $password = "";
                $database = "trotro_system";

                // Create connection
                $conn = new mysqli($servername, $username, $password, $database);

                // Check connection
                if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
                }

                $sql = "SELECT driverID, duration AS 'tripDuration', distance AS 'tripDistance(km)', rating AS 'tripRating'
                        FROM Trip 
                        ORDER BY tripRating DESC";

                // run/execute the query
                $result = $conn->query($sql);
                
                echo "<table class = \"table\"> 
                    <tr class=\"tr\"> 
                        <th class=\"th\">driverID</th> 
                        <th class=\"th\">tripDuration</th> 
                        <th class=\"th\">tripDistance(km)</th>
                        <th class=\"th\">tripRating</th> 
                    </tr>";
                

                if ($result->num_rows> 0) {
                    while($row = $result->fetch_assoc()) {

                        $d_id= $row["driverID"];
                        $td = $row["tripDuration"];
                        $td2 = $row["tripDistance(km)"];
                        $td3 = $row["tripRating"];
                        
                        echo "<tr class=\"tr\">
                                <td class=\"td\">$d_id</td>
                                <td class=\"td\">$td</td>
                                <td class=\"td\">$td2</td>
                                <td class=\"td\">$td3</td>
                            </tr>";
                    }
                }
                else {
                    echo "0 results";
                }
                echo "</table>";
                
                $result->free();

                $conn->close();    
            ?>
        </div>
    </body>
    <footer>
		<p> Copyright &copy; TMS 2021 </p>
	</footer>
</html>
