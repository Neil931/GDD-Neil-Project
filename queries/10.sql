-- Liste des chambres avec avec des réparations :
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