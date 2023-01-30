-- Chiffre d'affaire par pays:

SELECT
    name_country,
    sum(total_payment) as total_chiffreaffaire,
FROM booking
INNER JOIN hotel ON booking.htl_id= hotel.htl_id
INNER JOIN country ON hotel.htl_country_id = country.country_id;