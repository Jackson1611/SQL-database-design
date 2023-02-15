# SQL-database-design[DM_Case_Design.pdf](https://github.com/Jackson1611/SQL-database-design/files/10745240/DM_Case_Design.pdf)
BOOKING SYSTEM ER DIAGRAM
![Screenshot_2022-11-23_184001](https://user-images.githubusercontent.com/103312138/219092133-7ce096aa-6cf2-4eee-80c1-28135605f6e4.jpg)
Schema

#Customer (customer_ref, firstname, lastname, address, phone_number, email)
#Event (event_id, name, price, time, venue_id, artist_id)
#FK (venue_id) REFERENCES Venue (venue_id)
#FK (artist_id) REFERENCES Artist (artist_id)
#Booking (booking_ref, booking_date, quantity, event_date, customer_ref, payment_id, 
#event_id)
#FK (customer_ref) REFERENCES Customer (customer_ref)
#FK (payment_id) REFERENCES Payment (payment_id)
#FK (event_id) REFERENCES Event (event_id)
#Payment (payment_id, method)
#Venue (venue_id, size, name)
#Artist (artist_id, name, email, phone)

