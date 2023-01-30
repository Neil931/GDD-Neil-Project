--Liste des chambres :
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