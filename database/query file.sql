
-- Queries 

USE trotro_system;

-- Buses
SELECT Bus.vehicle_no AS 'busNumber', Mechanic.mechanicID AS 'MechanicIDs', Bus.model, driverID, Bus.state AS 'Status'
FROM BusMechanic
INNER JOIN Bus ON Bus.vehicle_no = BusMechanic.vehicle_no
INNER JOIN Mechanic ON BusMechanic.mechanicID = Mechanic.mechanicID
where Bus.maintenance = 'Yes' OR Bus.maintenance='No';

-- Trips 
SELECT driverID, duration AS 'tripDuration', distance AS 'tripDistance(km)', rating AS 'tripRating'
FROM Trip 
ORDER BY tripRating DESC;

-- Driver-Bus-Status
SELECT COUNT(driverID) AS 'Number of Drivers', state AS 'Bus Activity'
FROM Bus
GROUP BY state;

-- Managers
SELECT managerID, salary AS 'Salary', Highest_qualification AS 'Qualification' 
FROM Manager
WHERE salary<=5000 AND salary>=1000
ORDER BY salary;

-- Passengers
SELECT passengerID, tripID, seatnumber AS 'seatNumber', date_booked AS 'dateBooked', occupation AS 'Occupation'
FROM Passenger
WHERE occupation IN ('Teacher', 'Trader', 'Doctor', 'Nurse', 'Lawyer')
ORDER BY date_booked ASC;

-- Legal Documents
SELECT * 
FROM Legal_documents
WHERE document_name LIKE '%';
