-- Liste des achats de fourniture par hotel :
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