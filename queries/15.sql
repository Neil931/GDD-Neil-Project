-- Dépense par prestataire :
SELECT
    pvd_name,  
    price_product,
    quantity*price_product as total 
FROM htlpurchase, product, provider
WHERE  htlpurchase.product_id = product.product_id and product.pvd_id = provider.pvd_id;