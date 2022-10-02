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

                $sql = "SELECT passengerID, tripID, seatnumber AS 'seatNumber', date_booked AS 'dateBooked', occupation AS 'Occupation'
                        FROM Passenger
                        WHERE occupation IN ('Teacher', 'Trader', 'Doctor', 'Nurse', 'Lawyer')
                        ORDER BY date_booked ASC";

                // run/execute the query
                $result = $conn->query($sql);

                echo "<table class = \"table\"> 
                    <tr class=\"tr\"> 
                        <th class=\"th\">PassengerID</th> 
                        <th class=\"th\">TripID</th> 
                        <th class=\"th\">seatNumber</th> 
                        <th class=\"th\">date_booked</th> 
                        <th class=\"th\">Occupation</th> 
                    </tr>";

                if ($result->num_rows> 0) {
                    while($row = $result->fetch_assoc()) {

                        $passengerID = $row["passengerID"];
                        $tripID = $row["tripID"];
                        $seatNumber = $row["seatNumber"];
                        $datebooked = $row["dateBooked"];
                        $occupation = $row["Occupation"];
                        

                        echo "<tr class=\"tr\">
                                <td class=\"td\">$passengerID</td>
                                <td class=\"td\">$tripID</td>
                                <td class=\"td\">$seatNumber</td>
                                <td class=\"td\">$datebooked</td>
                                <td class=\"td\">$occupation</td>
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
