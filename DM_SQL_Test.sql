

-- Test queries
-- 1
INSERT INTO Booking  (booking_ref ,booking_status, booking_date , quantity ,customer_ref ,payment_id ,event_id)
VALUES (1,"Pending", '2023-12-11', 1, 2, 2 ,4);

-- 2
UPDATE Booking
SET quantity = 2
WHERE booking_ref = 80235;

-- 3
DELETE FROM Booking WHERE booking_ref = 80235;

-- 4
UPDATE Booking
SET booking_status ="Sold"
FROM Booking JOIN Ticket ON Ticket.booking_ref = Booking.booking_ref
WHERE ticket_status = "Paid";

-- 5
DELETE FROM Booking WHERE DATEDIFF(DAY,booking_date ,getdate()) > 3 ;

-- 6
UPDATE Event
SET event_status = "Canceled"
WHERE booking_ref = 1;

-- 7
UPDATE Booking
SET booking_status ="Refunded"
FROM Booking JOIN Ticket ON Ticket.booking_ref = Booking.booking_ref
WHERE event_status = "Canceled";

-- 8
SELECT email
FROM Artist
WHERE artist_name = 'Ed Sheeran';

-- 9
SELECT event_name
FROM Event
WHERE MONTH(event_date) = MONTH(getdate());

-- 10
SELECT venue_name
FROM Venue
WHERE venue_id IN (SELECT venue_id FROM Event WHERE artist_id = 116);

-- 11


-- 12
SELECT artist_name
FROM Artist
WHERE artist_id IN (SELECT artist_id FROM Event WHERE event_name = 'Reggae Sun');

-- 13

-- 14
SELECT event_date
FROM Event
WHERE artist_id IN (SELECT artist_id FROM Artist WHERE artist_name = 'Adele');

-- 15
SELECT COUNT(event_id) AS 'Tickets sold'
FROM Booking
WHERE event_id = 4 AND booking_status = 'Sold';

-- 16

-- 17

