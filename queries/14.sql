-- Chiffre d'affaire par employé :
SELECT
   staff_last_name,
 sum(total_payment) as total_chiffreaffaire

FROM booking
INNER JOIN staff ON booking.staff_id = staff.staff_id;