-- Liste des inventaires par hotel :
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