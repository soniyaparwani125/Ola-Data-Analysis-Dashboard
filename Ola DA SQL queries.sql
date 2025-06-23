CREATE database Ola;
Use Ola;

SELECT * FROM Bookings
WHERE Booking_Status='Success';



 #1. Retrieve all successful bookings:
Create View Succesful_Booking As
SELECT * FROM Bookings
WHERE Booking_Status='Success';
 
 Select * From Succesful_Booking;
 
 
 #2. Find the average ride distance for each vehicle type:
 
 create view ride_distance_for_each_vehicle as
 SELECT Vehicle_Type, AVG(Ride_Distance)
 as avg_distance FROM Bookings
 GROUP BY Vehicle_Type;
 
 SELECT * FROM ride_distance_for_each_vehicle;
 
 #3. Get the total number of cancelled rides by customers:
 Create view canceled_rides_by_customers As
 SELECT COUNT(*) FROM Bookings
 WHERE Booking_Status = 'Canceled by Customer';
 
 
 
 #4. List the top 5 customers who booked the highest number of rides:
 Create view Top_five_customers as
 SELECT Customer_ID, Count(Booking_ID) as total_rides
 FROM Bookings
 GROUP BY Customer_ID
 ORDER BY total_rides DESC LIMIT 5;
 

 
 #5. Get the number of rides cancelled by drivers due to personal and car-related issues:
 CreATE view Canceled_Rides_By_Drivers as
 SELECT COUNT(*) FROM Bookings 
 WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';
 
 #6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
 Create view Max_Min_Driver_Rating As
 SELECT MAX(Driver_Ratings) as max_rating,
 MIN(Driver_Ratings) as min_rating
 FROM Bookings WHERE Vehicle_Type = 'Prime Sedan';
 
 
 #7. Retrieve all rides where payment was made using UPI:
 
 SELECT * FROM Bookings
 WHERE Payment_Method = 'UPI';
 
 #8. Find the average customer rating per vehicle type:
 
 Select Vehicle_Type, AVG(Customer_Rating) as avg_customber_rating
 FROM Bookings
 GROUP BY (Vehicle_Type);
 
 #9. Calculate the total booking value of rides completed successfully:
 
 SELECT SUM(Booking_Value) as total_successful_bookings
 FROM Bookings
 WHERE Booking_Status = 'Success';
 
 #10. List all incomplete rides along with the reason:
 SELECT Customer_ID, Incomplete_Rides_Reason
 FROM Bookings
 WHERE Incomplete_Rides = 'Yes';
