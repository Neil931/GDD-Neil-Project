-- Liste des checkouts :
SELECT
    name_country,
    htl_name,
    cust_first_name,
    cust_last_name,
    arrival,
    departure,
    numPeople,
    total_payment,
    payment_type,
    room_id,
    staff_last_name,
    checktime,
    status_type,
    staff_last_name 
FROM checkout
INNER JOIN booking ON checkout.booking_id = booking.booking_id
INNER JOIN statuscheckout ON checkout.status_id = statuscheckout.status_id
INNER JOIN customer ON booking.cust_id = customer.cust_id
INNER JOIN paymenttype ON booking.payment_id= paymenttype.payment_id
INNER JOIN hotel ON booking.htl_id= hotel.htl_id
INNER JOIN country ON hotel.htl_country_id = country.country_id
INNER JOIN staff ON booking.staff_id = staff.staff_id;