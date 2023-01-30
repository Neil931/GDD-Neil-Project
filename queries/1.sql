-- Liste des client :
SELECT
  gender_name,
  cust_first_name,
  cust_last_name,
  cust_address1,
  cust_address2,
  cust_address3,
  cust_zipcode,
  name_country,
  cust_country_id,
  cust_phone_num,
  cust_email
FROM customer  
 
INNER JOIN gender ON customer.cust_gender_id = gender.gender_id
INNER JOIN country ON customer.cust_country_id = country.country_id;