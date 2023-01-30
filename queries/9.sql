-- Calcul du stock par hotel :
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