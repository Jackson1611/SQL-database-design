CREATE TABLE Customer (
customer_ref INTEGER NOT NULL, 
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
address VARCHAR(100),
phone_number VARCHAR(20),
email VARCHAR(50),
CONSTRAINT PK_Customer PRIMARY KEY(customer_ref)
);

CREATE TABLE Event (
event_id INTEGER NOT NULL,
event_name VARCHAR(50) NOT NULL,
price FLOAT,
start_time TIME,
venue_id INTEGER NOT NULL,
artist_id INTEGER NOT NULL,
CONSTRAINT PK_Event PRIMARY KEY(event_id),
CONSTRAINT FK_Event_Venue FOREIGN KEY(venue_id) REFERENCES Venue(venue_id),
CONSTRAINT FK_Event_Artist FOREIGN KEY(artist_id) REFERENCES Artist(artist_id),
CONSTRAINT CHK_Time CHECK (start_time LIKE '^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$')
);

CREATE TABLE Booking (
booking_ref INTEGER NOT NULL,
booking_date DATE NOT NULL,
quantity INTEGER NOT NULL,
event_date DATE NOT NULL,
customer_ref INTEGER NOT NULL,
payment_id INTEGER NOT NULL,
event_id INTEGER NOT NULL,
CONSTRAINT PK_Booking PRIMARY KEY(booking_ref),
CONSTRAINT FK_Booking_Customer FOREIGN KEY(customer_ref) REFERENCES Customer(customer_ref),
CONSTRAINT FK_Booking_Payment FOREIGN KEY(payment_id) REFERENCES Payment(payment_id),
CONSTRAINT FK_Booking_Event FOREIGN KEY(event_id) REFERENCES Event(event_id),
CONSTRAINT CHK_Booking_quantity CHECK(quantity > 0)
);

CREATE TABLE Venue (
venue_id INTEGER NOT NULL,
size INTEGER,
vanue_name VARCHAR(50) NOT NULL,
CONSTRAINT PK_Venue PRIMARY KEY(venue_id),
CONSTRAINT CHK_Venue_size CHECK(size IN(50, 250, 800))
);

CREATE TABLE Payment (
payment_id INTEGER NOT NULL,
method VARCHAR(50) NOT NULL,
CONSTRAINT PK_Payment PRIMARY KEY(payment_id)
);

CREATE TABLE Artist (
artist_id INTEGER NOT NULL,
artist_name VARCHAR(50) NOT NULL,
email VARCHAR(50),
phone VARCHAR(20),
CONSTRAINT PK_Artist PRIMARY KEY(artist_id)
);

CREATE TABLE Ticket (
ticket_ref INTEGER NOT NULL,
booking_ref INTEGER NOT NULL,
ticket_status VARCHAR(50) NOT NULL,
CONSTRAINT PK_ticket_ref PRIMARY KEY(ticket_ref),
CONSTRAINT FK_booking_ref FOREIGN KEY(booking_ref) REFERENCES Booking(booking_ref),
CONSTRAINT CHK_ticket_status CHECK(ticket_status IN ("Paid","Unpaid")));

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


