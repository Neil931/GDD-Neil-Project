-- Liste des fournisseurs :
SELECT
  pvd_name,
  pvd_address1,
  pvd_address2,
  pvd_address3,
  pvd_zipcode,
  pvd_city_name,
  name_country,
  pvd_contact_name,
  pvd_phone_num,
  pvd_email
FROM provider
INNER JOIN country ON provider.pvd_country_id = country.country_id;
