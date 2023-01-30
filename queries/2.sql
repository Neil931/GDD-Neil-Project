-- Liste des employés :
SELECT
  htl_name,
  gender_name,
  staff_first_name,
  staff_last_name,
  staff_address1,
  staff_address2,
  staff_address3,
  staff_zipcode,
  staff_city_name,
  name_country,
  staff_phone_num,
  staff_email,
  role_name,
  salary,  
  dates_recruitment,
  dates_end_contract
FROM staff
INNER JOIN gender ON staff.staff_gender_id = gender.gender_id
INNER JOIN hotel ON staff.htl_id = hotel.htl_id
INNER JOIN country ON staff.staff_country_id = country.country_id
INNER JOIN role ON staff.staff_role_id = role.role_id;