-- add booking status
ALTER TABLE Booking
ADD booking_status varchar(255)
CONSTRAINT CHK_booking_status CHECK(booking_status IN ("Pending","Sold","Refunded"));

-- add venue address
ALTER TABLE Venue
ADD venue_address varchar(255);
-- add Event status
ALTER TABLE Event
ADD event_status varchar(255)
CONSTRAINT CHK_event_status CHECK(event_status IN ("Canceled","Not canceled"));

-- insert data
INSERT INTO Artist (artist_id, artist_name, email, phone) VALUES
('112', 'Hellshock', 'hellshock@gmail.com', '+358401234567'),
('113', 'Ed Sheeran', 'ed.sheeran@gmail.com', '+358407891234'),
('114', 'Galimatias', 'galimatias@gmail.com', '+358400022573'),
('115', 'The Dead Kennedys', 'deadkennedy@gmail.com', '+358401934736'),
('116', 'Adele', 'adele@hotmail.com', '+18019358427'),
('117', 'Michael Connory', 'connory.michael@gmail.com', '+18018663902');

ALTER TABLE Venue
RENAME COLUMN vanue_name TO venue_name;

INSERT INTO Customer (customer_ref, first_name, last_name, address, phone_number, email) VALUES
('1435', 'Jukka', 'Lapalainen', 'Pajalahdentie 5, 00200 Helsinki', '+358408572401', 'lappis@gmail.com'),
('9435', 'Jackson', 'Harrison', 'Kalevankatu 12, 00180 Helsinki', '+358402968395', 'yunqharrison@outlook.com'),
('2901', 'James', 'Jameson', 'Syystie 35, 00780 Helsinki', '+358409254830', 'jjameson@gmail.com'),
('8405', 'Andrew', 'Smith', 'Vastukatu 19, 15680 Lahti', '+358401927477', 'aSmith@outlook.com');

INSERT INTO Venue (venue_id, size,venue_name,venue_address) VALUES
(101,250,"Madison Square Garden","4th Street,New York 35225"),
(102,50,"Olympic Stadium","Olympinkatu 5, Helsinki 00100"),
(103,50,"Dingwall","24 Kaskelantie, Vantaa 00872"),
(104,800,"Toolo Venue","56 Toolonkatu 00900");

INSERT INTO Payment (payment_id, method) VALUES
('395017349', 'Visa'),
('493057293', 'MasterCard'),
('294011299', 'Visa'),
('592810840', 'PayPal');

ALTER TABLE EVENT
DROP COLUMN start_time;

ALTER TABLE Event
ADD COLUMN event_date DATE NOT NULL;

INSERT INTO Event (event_id, event_name, price, venue_id, artist_id, event_status, event_date) VALUES
(1,"Ed Sheeran's concert",120.00,104,113,"Not canceled", '2023-04-04'),
(2,"Reggae Sun",60.00,102,112,"Not canceled", '2023-07-15'),
(3,"Adele’s concert",150.00,103,116,"Not canceled", '2023-09-11'),
(4,"Break a Leg",90.00,103,117,"Not canceled", '2023-06-10');

ALTER TABLE Booking
DROP COLUMN event_date;

INSERT INTO Booking (booking_ref, booking_date, quantity, customer_ref, payment_id, event_id, booking_status) VALUES
(80235, '2023-01-25', 2, 2901, 493057293, 2, 'Pending'),
(91053, '2022-12-20', 4, 1435, 592810840, 1, 'Sold'),
(03681, '2023-02-13', 1, 8405, 294011299, 3, 'Sold'),
(82094, '2023-01-11', 6, 9435, 395017349, 4, 'Sold');

INSERT INTO Ticket (ticket_ref, booking_ref, ticket_status) VALUES
(547, 80235, 'Unpaid'),
(925, 91053, 'Paid'),
(201, 03681, 'Paid'),
(332, 82094, 'Paid');

