-- Project Phase II: Final
-- 6488189 Chommakorn Sontesadisai 
-- 6488190 Nattanicha Sinsawet 
-- 6488191 Poohtanmai Siriwachirapap 
-- 6488195 Sarutaya Yuenyong

USE project;

-- Basic

-- 1 List all passengers (Name and Seat ID) who sit in row C. The resulting table must be sorted by the number of seats in C.
SELECT PName, SeatID
FROM Ticket
WHERE SeatID LIKE "%C"
ORDER BY SeatID;

-- 2 Show the list of passengers (Name) who are Japanese. The resulting table must be sorted by the first passenger’s name alphabetically 
SELECT PName
FROM Passenger
WHERE PNational = 'japanese'
ORDER BY PName ASC;

-- 3 Show the list of memberships (Name and registration membership date) who register in year 2022. The result table must be sorted by membership start date alphabetically.
SELECT PName, MStartDate
FROM Membership
WHERE MStartDate LIKE "2022%"
ORDER BY MStartDate ASC;

-- 4 List all payments (Payment ID and total amount) that are more than 30000. Sort the result by the lowest to highest amount.
SELECT PaymentID, Amount
FROM Payment
WHERE Amount > '30000'
ORDER BY Amount ASC;

-- 5 Find the total number of passengers of each class (e.g., First Class, Premium Economy Class, Business Class, and Economy Class). The result must have 2 columns: Class and “Total # of Class” and ordered by “Total # of Class”.
SELECT Class, COUNT(Class) AS `Total # of Class`
FROM Ticket
GROUP BY Class
ORDER BY `Total # of Class` ASC;

-- 6 Find the total number of passengers of each Takeoff Date (e.g., 2022-08-12, 2022-10-18, 2022-11-13, and 2022-11-30). The result must have 2 columns: Takeoff Date and “Total # of Takeoff Date” and ordered by Takeoff Date.
SELECT TakeOffDate, COUNT(TakeOffDate) AS `Total # of TakeOffDate`
FROM BoardingPass
GROUP BY TakeOffDate
ORDER BY TakeOffDate ASC;

-- 7 Find the total number of memberships who start on each date. The result must have 2 columns: MStartDate and “Total # of MStartDate” and ordered by MStartDate.
SELECT MStartDate, COUNT(MStartDate) AS `Total # of MStartDate`
FROM Membership
GROUP BY MStartDate
ORDER BY MStartDate ASC;

-- 8 Find the total number of memberships who start on each date. The result must have 2 columns: MEndDate and “Total # of MEndDate” and ordered by MEndDate.
SELECT MEndDate, COUNT(MEndDate) AS `Total # of MEndDate`
FROM Membership
GROUP BY MEndDate
ORDER BY MEndDate ASC;

-- 9 Find the total number of passengers who pay with credit card (e.g., JCB and VISA). The result must have two 2 columns: CType and “Total # of CType” and sorted by the lowest to highest of “Total # of CType”.
SELECT CType, COUNT(CType) AS `Total # of CType`
FROM Credit_card
WHERE CType = "JCB" OR CType = "VISA"
GROUP BY CType
ORDER BY COUNT(CType) ASC;

-- 10 Find the total number of passengers who have holder name “Chase Freedom Unlimited” and “JALCARD”. The result must have two 2 columns: HolderName and “Total # of HolderName” and sorted by the lowest to highest of “Total # of HolderName”.
SELECT HolderName, COUNT(HolderName) AS `Total # of HolderName`
FROM Credit_card
WHERE HolderName = "JALCARD" OR HolderName = "Chase Freedom Unlimited"
GROUP BY HolderName
ORDER BY COUNT(HolderName) ASC;

-- 11 Count the number of passengers from each country. Order in descending order.
SELECT PNational, count(PassportID) AS "passenger count" 
FROM Passenger 
GROUP BY PNational 
ORDER BY count(PassportID) DESC;

-- 12 List all passenger’s name, email and phone number whose phone number contains number 25. Sort the result alphabetically.
SELECT PName, PEmail, PPhone 
FROM Passenger 
WHERE PPhone LIKE '%25%' 
ORDER BY PName;

-- 13 Display member’s name along with their remaining membership day (from the current date to the nearest end date), sort remaining date ascendingly.
SELECT PName, datediff(min(MEndDate),curdate()) AS 'remaining membership day' 
FROM Membership 
GROUP BY PName 
ORDER BY datediff(min(MEndDate),curdate()) ;

-- 14 Find passengers who are boarding at the gate with higher number than 28, display their names, seats, take off date, and boarding gate.
SELECT PName, SeatID, TakeOffDate, Gate 
FROM BoardingPass 
WHERE Gate > 28;

-- 15 Find passengers whose seat class contains the letter I. The result must contain their names, seats, and class. 
SELECT PName, SeatID, Class 
FROM Ticket 
WHERE Class LIKE "%I%";

-- 16 Find the total numbers of passenger who seat type is JAL Economy Class Seat. 
SELECT s.SeatType AS 'Seat Type', COUNT(*) AS "Number of JAL Economy Class Seat" 
FROM Seat s
WHERE s.SeatType IN ("JAL Economy Class Seat") 
GROUP BY s.SeatType;

-- 17 Find the total numbers of passenger who class is Premium Economy Class. 
SELECT s.Class AS 'Class Type', COUNT(*) AS "Premium Economy Class" 
FROM Seat s
WHERE s.Class IN ("Premium Economy Class") 
GROUP BY s.Class;

-- 18 Show the list of passengers of in each of the following from: " “Tokyo”, “Bangkok” and “New york” sorted by from.
SELECT b.PName AS "Name", b.FFrom AS "From "
FROM BoardingPass b
WHERE b.FFrom IN ("Tokyo","New york","Bangkok")
ORDER BY b.FFrom ASC;

-- 19 Show the list of passengers of in each of the following Destinations: " “Osaka”, “Tokyo” and “Nagoya” sorted by destinations. 
SELECT t.PName AS "Name", t.Destination
FROM Ticket t
WHERE t.Destination IN ("Osaka","Tokyo","Nagoya")
ORDER BY t.Destination ASC;

--  20 List all names (first name and last name) and their ID o passengers whose first names begin with "N"
SELECT ps.PName AS "passenger name", ps.PassportID AS "ID" 
FROM Passenger ps
WHERE ps.PName LIKE "N%";

-- Advanced

-- 1 Display Payment ID, Passport ID, Passenger Name, and Amount. Sort the result by amount.
SELECT p.PaymentID, t.PassportID, t.PName, Amount
FROM Ticket t
INNER JOIN Payment p ON p.PaymentID = t.PaymentID
ORDER BY Amount ASC;

-- 2 Display Payment ID, Passport ID, Credit card type, Holder Name, and Changes (for passengers who use cash). The result must be sorted by payment ID.
SELECT p.PaymentID, t.PassportID, CType, HolderName, Changes
FROM Ticket t
INNER JOIN Payment p ON p.PaymentID = t.PaymentID
INNER JOIN Credit_card cr ON cr.PaymentID = p.PaymentID
INNER JOIN Cash c ON c.PaymentID = p.PaymentID
ORDER BY p.PaymentID ASC;

-- 3 List all passengers (Passport ID, Passenger Name, National, Email, Phone, Ticket ID, Seat ID, Class, Take Off Date, From, Destination, Airline, and Gate) that national is U.S.A but not paid with VISA. 
SELECT ps.PassportID, ps.PName, ps.PNational, ps.PEmail, ps.PPhone, t.TicketID, t.SeatID, t.Class, bp.TakeOffDate, bp.FFrom, t.Destination, bp.Airline, bp.Gate
FROM Ticket t
INNER JOIN Passenger ps ON t.PassportID = ps.PassportID
INNER JOIN Payment p ON p.PaymentID = t.PaymentID
INNER JOIN BoardingPass bp ON bp.PaymentID = t.PaymentID
INNER JOIN Credit_card cr ON cr.PaymentID = p.PaymentID
WHERE PNational = "U.S.A" AND CType NOT IN
	(
		SELECT CType
		FROM Credit_card cr
		INNER JOIN Payment p ON p.PaymentID = cr.PaymentID
		INNER JOIN Ticket t ON t.PaymentID = p.PaymentID
		WHERE CType = "VISA"
	);

-- 4 Find the list of passengers (Passport ID, Passenger Name, National, Email, Phone, Ticket ID, Seat ID, Class, Take Off Date, From, Destination, Airline, Gate, Payment ID, and Amount) whose their amount are higher than the average of amount. Sort the result by the highest to lowest amount. The average of amount is 26229.30.
SELECT  
	ps.PassportID, ps.PName, ps.PNational, ps.PEmail, ps.PPhone, t.TicketID, t.SeatID, t.Class, bp.TakeOffDate, 
	bp.FFrom, t.Destination, bp.Airline, bp.Gate, p.PaymentID, p.Amount
FROM Ticket t
INNER JOIN Passenger ps ON t.PassportID = ps.PassportID
INNER JOIN BoardingPass bp ON bp.PassportID = t.PassportID
INNER JOIN Payment p ON p.PaymentID = bp.PaymentID
WHERE Amount > 
	(
		SELECT AVG(p.Amount)
        FROM Payment p
	)
ORDER BY p.Amount DESC;

-- 5 Find the list of passengers (Passport ID, Passenger Name, National, Email, Phone, Ticket ID, Seat ID, Class, Take Off Date, From, Destination, Airline, Gate, Payment ID, and Amount) whose their amount are less than the average of amount. Sort the result by the highest to lowest amount. The average of amount is 26229.30.
SELECT ps.PassportID, ps.PName, ps.PNational, ps.PEmail, ps.PPhone, t.TicketID, t.SeatID, t.Class, bp.TakeOffDate, 
	   bp.FFrom, t.Destination, bp.Airline, bp.Gate, p.PaymentID, p.Amount
FROM Ticket t
INNER JOIN Passenger ps ON t.PassportID = ps.PassportID
INNER JOIN BoardingPass bp ON bp.PaymentID = t.PaymentID
INNER JOIN Payment p ON p.PaymentID = t.PaymentID
WHERE Amount <
	(
		SELECT AVG(Amount)
        FROM Payment
	)
ORDER BY Amount DESC;

-- 6 Find the VAT 7% of passengers that need to pay. The result must have three columns: PaymentID, PName, and “VAT 7%” and displayed in 2 decimal places and ranked from the lowest value to the highest one.
SELECT p.PaymentID, ps.PName, ROUND(0.07*Amount,2) AS `VAT 7%` 
FROM Ticket t
INNER JOIN Passenger ps ON t.PassportID = ps.PassportID
INNER JOIN Payment p ON p.PaymentID = t.PaymentID
ORDER BY `VAT 7%` ASC;

-- 7 Find the summary of amount and VAT 7%. The result must have three columns: PaymentID, PName, and “Amount with VAT 7%”. and displayed in 2 decimal places and ranked from the lowest value to the highest one.
SELECT p.PaymentID, ps.PName, ROUND(Amount+(0.07*Amount),2) AS `Amount with VAT 7%` 
FROM Ticket t
INNER JOIN Passenger ps ON t.PassportID = ps.PassportID
INNER JOIN Payment p ON p.PaymentID = t.PaymentID
ORDER BY `Amount with VAT 7%` ASC;

-- 8 Find the amount after discount 10%The result must have three columns: PaymentID, PName, and “Price with Discount 10% and displayed in 2 decimal places and ranked from the lowest value to the highest one.
SELECT p.PaymentID, ps.PName, ROUND(Amount-(0.10*Amount),2) AS `Price with Discount 10%` 
FROM Ticket t
INNER JOIN Passenger ps ON t.PassportID = ps.PassportID
INNER JOIN Payment p ON p.PaymentID = t.PaymentID
ORDER BY `Price with Discount 10%` ASC;

-- 9 List all passengers (Passport ID, Ticket ID, PName, FFRom, and Destination) who take off from Bangkok to Tokyo. Sorted by the lowest to highest passport id. 
SELECT t.PassportID, t.TicketID, t.PName, FFrom, Destination
FROM Ticket t
INNER JOIN BoardingPass bp ON t.PassportID = bp.PassportID
WHERE FFrom = "Bangkok" AND Destination = "Tokyo"
ORDER BY t.PassportID ASC;

-- 10 List all passengers (Passport ID, PName, PEmail, and Phone) who register with Gmail.
SELECT t.PassportID, p.PName, p.PEmail, p.PPhone
FROM Ticket t
INNER JOIN Passenger p ON p.PassportID = t.PassportID
WHERE PEmail LIKE "%gmail%";

-- 11 Shows passenger’s name and destinations whose nationality is Japanese. Sort the result by destination.
SELECT t.PName, Destination 
FROM Passenger p 
INNER JOIN Ticket t ON p.PName = t.PName 
WHERE p.PNational = 'japanese' 
ORDER BY Destination;

-- 12 Find all passengers who are not a JAL member. The result must contain their names, email, and nationality.
SELECT PName, PEmail, PNational 
FROM Passenger 
WHERE PName NOT IN (SELECT DISTINCT PName FROM Membership);

-- 13 List all passengers that paid in cash and received changes. Display everything from passenger table.
SELECT  * 
FROM Passenger 
WHERE PName IN (SELECT PName 
				FROM Cash c 
				INNER JOIN Ticket t ON c.PaymentID = t.PaymentID 
				WHERE c.Changes != 0); 

-- 14 List all passengers name and how many days away from their flight regardless of if the flight has taken off or not. Display only passengers with the least days.
SELECT PName, abs(datediff(curdate(), TakeOffDate)) as 'days away from the flight'  
FROM BoardingPass 
WHERE abs(datediff(curdate(), TakeOffDate)) = (select min(abs(datediff(curdate(), TakeOffDate))) FROM BoardingPass);

-- 15 List all details of the flight and its passenger, the result must contain passengers’ name, their seat, date of the flight, boarding airport, boarding gates, and destination.
SELECT t.PName, b.SeatID, t.TakeOffDate, FFrom, Gate, Destination 
FROM BoardingPass b 
INNER JOIN Ticket t ON b.PassportID = t.PassportID;

-- 16 Display passenger whose are membership.
SELECT ps.PassportID, ps.PName, ps.PEmail, ps.PPhone, ps.PNational, s.SeatID, s.SeatType, s.Class
FROM Passenger ps 
INNER JOIN Ticket t ON t.PassportID = ps.PassportID
INNER JOIN BoardingPass b ON t.TicketID = b.TicketID 
INNER JOIN Seat s ON s.SeatID = t.SeatID 
WHERE t.TakeOffDate ='2022-11-30' and s.Class = 'Economy Class' 
ORDER BY ps.PName asc;

-- 17 Show all passenger who use holdcard "JALCARD".
SELECT ps.PassportID, ps.PName, ps.PEmail, ps.PPhone, ps.PNational, p.PaymentID, p.Amount, p.PaymentDate, cr.CType, cr.HolderName
FROM Passenger ps 
INNER JOIN Ticket t ON t.PassportID = ps.PassportID 
INNER JOIN BoardingPass b ON t.TicketID = b.TicketID 
INNER JOIN Seat s ON s.SeatID = t.SeatID 
INNER JOIN Payment p ON p.PaymentID = t.PaymentID 
INNER JOIN Credit_card cr ON cr.PaymentID = p.PaymentID 
WHERE cr.HolderName = "JALCARD";

-- 18 Show all passenger who use had pay on 11 October 2022.
SELECT ps.PassportID, ps.PName, ps.PEmail, ps.PPhone, ps.PNational, p.PaymentID, p.Amount, p.PaymentDate
FROM Passenger ps 
INNER JOIN Ticket t ON t.PassportID = ps.PassportID 
INNER JOIN BoardingPass b ON t.TicketID = b.TicketID 
INNER JOIN Seat s ON s.SeatID = t.SeatID 
INNER JOIN Payment p ON p.PaymentID = t.PaymentID 
WHERE p.PaymentDate = "2022-11-10";

-- 19 Show all passenger who had pay maximum.
SELECT ps.PassportID, ps.PName, ps.PEmail, ps.PPhone, ps.PNational, p.PaymentID, p.Amount, p.PaymentDate
FROM Passenger ps 
INNER JOIN Ticket t ON t.PassportID = ps.PassportID 
INNER JOIN BoardingPass b ON t.TicketID = b.TicketID 
INNER JOIN Seat s ON s.SeatID = t.SeatID 
INNER JOIN Payment p ON p.PaymentID = t.PaymentID
WHERE p.Amount = (select MAX(Amount) FROM payment);

-- 20 Show all passenger who use type of credit card is "VISA".
SELECT ps.PassportID, ps.PName, ps.PEmail, ps.PPhone, ps.PNational, p.PaymentID, p.Amount, p.PaymentDate, cr.CType, cr.HolderName
FROM Passenger ps 
INNER JOIN Ticket t ON t.PassportID = ps.PassportID 
INNER JOIN BoardingPass b ON t.TicketID = b.TicketID 
INNER JOIN Seat s ON s.SeatID = t.SeatID 
INNER JOIN Payment p ON p.PaymentID = t.PaymentID 
INNER JOIN Credit_card cr ON cr.PaymentID = p.PaymentID 
WHERE cr.CType = "VISA"
ORDER BY ps.PName ASC;

