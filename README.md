# Integrantes : 
Bayron Jojoa (2242917) Bayron.jojoa@correounivalle.edu.co

Alejandro Guerrero(2242951) munoz.cesar@correounivalle.edu.co
# Linnk Video Youtube :  
# las sigientes son las instruciones paso a paso de como se realizo la actividad 
# primero se crea la red 

docker network create pg_network

# Se crea el primer contenedor del cliente 

docker run -v D:\DocumentosSD\Semestreactual\NotasSO\entrega3\misscripts:/docker-entrypoint-initdb.d -v D:\DocumentosSD\Semestreactual\NotasSO\entrega3\pg_db:/var/lib/postgresql/data --name pg_server -e POSTGRES_DB=tarea_db -e POSTGRES_USER=yo -e POSTGRES_PASSWORD=empanada --network pg_network postgres:15-bookworm

# Se crea el registro con el "hola mundo" ejecutando el psql en el server 

docker exec -it pg_server psql -U yo tarea_db
INSERT INTO pg_tabla (mensaje) VALUES ('hola mundo');

# se crea el contenedor del cliente 

docker run -it --name pg_client --network pg_network ubuntu

# se ejecuta la consulta desde el cliente con el psql

docker exec -it pg_client bash 

apt-get update 

apt-get install -y postgresql-client


psql -h pg_server -p 5432 -U yo tarea_db            
SELECT * FROM pg_tabla;


