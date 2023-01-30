-- Liste des hotels en France :
SELECT
  htl_name,
  htl_address1,
  htl_address2,
  htl_address3,
  htl_zipcode,
  htl_city_name,
  name_country,
  htl_phone_contact,
  htl_email_contact

FROM hotel
INNER JOIN country ON hotel.htl_country_id = country.country_id
WHERE name_country = 'France';