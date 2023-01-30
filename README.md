# GDD-Neil-Project
-- --------------------------------------------------------
--   La base de données a été créée sur mysql
--
--   Création de la base de données hotels
--   Lancer le script de création hotels.sql
--   les inserts constituent un jeu d'essaie
--   En fin de script les index plus les FOREIGN KEY 

--

-- Une fois que la base de données a été crée avec son jeu de tests les requêtes de pilotage des hotels
--pourront être lancer


--Liste des client pourra donner l'ensemble des clients des hotels du groupe

1-Liste des client :


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



--Liste des client pourra monitorer le staff


2-Liste des employés :

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




--Liste des hotels selon les pays

3-Liste des hotels en France :
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


--Veiller a suivre la liste des prestataires

4-Liste des fournisseurs :
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



--Une vue sur les chambre des différents hotels du groupe

5-Liste des chambres :

SELECT                         
                          name_country,
                          htl_name,
		          room_description,
		          price_room,
			  surface,			  
			  handicap,
			  vip,
			  smoking,
			  animals
FROM room
INNER JOIN hotel ON room.htl_id = hotel.htl_id
INNER JOIN typeroom ON room.typeroom_id= typeroom.typeroom_id
INNER JOIN country ON hotel.htl_country_id = country.country_id;


--les réservation par pays 

6-Liste des réservations :

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
			  staff_last_name 
FROM booking
INNER JOIN customer ON booking.cust_id = customer.cust_id
INNER JOIN paymenttype ON booking.payment_id= paymenttype.payment_id
INNER JOIN hotel ON booking.htl_id= hotel.htl_id
INNER JOIN country ON hotel.htl_country_id = country.country_id
INNER JOIN staff ON booking.staff_id = staff.staff_id;



--Liste des dépense en fournitures par hotel à des fin de gestion des commandes

7- Liste des achats de fourniture par hotel :

SELECT
 			  name_country,
 			  htl_name,
 			  reference,
			  description_product,
			  dates_purchase,
			  quantity,
			  price_product,
			  quantity*price_product as total
FROM htlpurchase
INNER JOIN hotel ON htlpurchase.htl_id = hotel.htl_id
INNER JOIN country ON hotel.htl_country_id = country.country_id
INNER JOIN product ON htlpurchase.product_id = product.product_id;


--la consommation en fourniture par hotel

8- Liste des inventaires par hotel :

SELECT
 			  name_country,
 			  htl_name,
			  date_inventory,
			  reference,
			  description_product,
			  quantity,
			  price_product,
			  quantity*price_product as total			  
			  
FROM inventory
INNER JOIN hotel ON inventory.htl_id = hotel.htl_id
INNER JOIN country ON hotel.htl_country_id = country.country_id
INNER JOIN product ON inventory.product_id = product.product_id;


--le stock de fourniture par hotel à des fin de réaprovisionement et gestion des commandes

9- Calcul du stock par hotel :


SELECT
 			  name_country,
 			  htl_name,
 			  reference,
			  description_product,			
			  sum(htlpurchase.quantity) as total_achat,
			  sum(inventory.quantity) as total_inventaire,
			  sum(htlpurchase.quantity) - sum(inventory.quantity) as stock

FROM htlpurchase
INNER JOIN hotel ON htlpurchase.htl_id = hotel.htl_id
INNER JOIN country ON hotel.htl_country_id = country.country_id
INNER JOIN product ON htlpurchase.product_id = product.product_id
INNER JOIN inventory ON htlpurchase.htl_id = inventory.htl_id and htlpurchase.product_id = inventory.product_id;


--L'état des chambre et suivi des réparations

10- Liste des chambres avec avec des réparations :

SELECT                         
                          name_country,
                          htl_name,
		          room_description,
		          dates_review,	 
		          repair_status,
		          dates_repair,		        
		          amount_repair

FROM room
INNER JOIN hotel ON room.htl_id = hotel.htl_id
INNER JOIN typeroom ON room.typeroom_id = typeroom.typeroom_id
INNER JOIN country ON hotel.htl_country_id = country.country_id
INNER JOIN repair ON room.htl_id = repair.htl_id and room.room_id = repair.room_id;



-- la situation des sorties et la gestion des anomalies

11- Liste des checkouts :

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



-- chiffre d'affaire 

12- Chiffre d'affaire par pays:

SELECT
 			  name_country,
			  sum(total_payment) as total_chiffreaffaire,

FROM booking
INNER JOIN hotel ON booking.htl_id= hotel.htl_id
INNER JOIN country ON hotel.htl_country_id = country.country_id;



13- Chiffre d'affaire par hotel pour le mois de décembre 2022:

SELECT
 			  name_country,
 			  htl_name,
			  sum(total_payment) as total_chiffreaffaire

FROM booking
INNER JOIN hotel ON booking.htl_id= hotel.htl_id
INNER JOIN country ON hotel.htl_country_id = country.country_id
WHERE 	arrival BETWEEN '2022-12-01 00:00:00' AND '2022-12-31 23:59:59';



-- gestion des ressources humaines et performence

14- Chiffre d'affaire par employé :

SELECT
 			  staff_last_name,
			  sum(total_payment) as total_chiffreaffaire

FROM booking
INNER JOIN staff ON booking.staff_id = staff.staff_id;


-- Monitoring des prestataires

15- Dépense par prestataire :

SELECT
                          pvd_name,   
                          price_product,
                          quantity*price_product as total
			  
FROM htlpurchase, product, provider

where  htlpurchase.product_id = product.product_id and product.pvd_id = provider.pvd_id;
