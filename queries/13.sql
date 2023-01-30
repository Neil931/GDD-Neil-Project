-- Chiffre d'affaire par hotel pour le mois de décembre 2022 :
SELECT
    name_country,
    htl_name,
    sum(total_payment) as total_chiffreaffaire
FROM booking
INNER JOIN hotel ON booking.htl_id= hotel.htl_id
INNER JOIN country ON hotel.htl_country_id = country.country_id
WHERE arrival BETWEEN '2022-12-01 00:00:00' AND '2022-12-31 23:59:59';