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

                $sql = "SELECT Bus.vehicle_no AS 'busNumber', Mechanic.mechanicID AS 'MechanicIDs', Bus.model, 
                        Bus.driverID, Bus.state AS 'Status'
                        FROM BusMechanic
                        INNER JOIN Bus ON Bus.vehicle_no = BusMechanic.vehicle_no
                        INNER JOIN Mechanic ON BusMechanic.mechanicID = Mechanic.mechanicID
                        WHERE Bus.maintenance = 'Yes' OR Bus.maintenance='No'";

                $result = $conn->query($sql);
                
                echo "<table class = \"table\"> 
                    <tr class=\"tr\"> 
                        <th class=\"th\">busNumber</th> 
                        <th class=\"th\">MechanicIDs</th> 
                        <th class=\"th\">Model</th> 
                        <th class=\"th\">driverIDs</th> 
                        <th class=\"th\">Status</th> 
                    </tr>";
                
                if ($result->num_rows> 0) {

                    while($row = $result->fetch_assoc()) {

                        $bn = $row["busNumber"];
                        $mid = $row["MechanicIDs"];
                        $bm= $row["model"];
                        $d_id = $row["driverID"];
                        $stats = $row["Status"];

                        echo "<tr class=\"tr\">
                                <td class=\"td\">$bn</td>
                                <td class=\"td\">$mid</td>
                                <td class=\"td\">$bm</td>
                                <td class=\"td\">$d_id</td>
                                <td class=\"td\">$stats</td>
                            </tr>";
                    }
                }else {
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

