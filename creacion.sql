DO $$ 
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = 'tarea_db') THEN
        CREATE DATABASE tarea_db;
        RAISE NOTICE 'La base de datos tarea_db ha sido creada';
    ELSE
        RAISE NOTICE 'La base de datos tarea_db ya existe';
    END IF;
END $$;


\c tarea_db;


DO $$ 
BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'pg_tabla') THEN
        -- Crear la tabla pg_tabla
        CREATE TABLE pg_tabla (
            id SERIAL PRIMARY KEY,
            mensaje TEXT
        );
        RAISE NOTICE 'La tabla pg_tabla ha sido creada';
    ELSE
        RAISE NOTICE 'La tabla pg_tabla ya existe';
    END IF;
END $$;
