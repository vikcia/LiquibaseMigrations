--liquibase formatted sql
 
-- Explicitly set the schema search path
SET search_path TO public;
 
-- changeset Viktoras:1  
-- comment: Create items table
CREATE TABLE IF NOT EXISTS public.items
(
    id serial NOT NULL,
    name VARCHAR(50) NOT NULL,
    price DECIMAL NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT movies_pkey PRIMARY KEY (id)
);

-- changeset Viktoras:2  
-- comment: Create orders table
CREATE TABLE IF NOT EXISTS public.orders
(
    id SERIAL NOT NULL,
    item_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    delivery_status VARCHAR NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT orders_pkey PRIMARY KEY (id),
    CONSTRAINT orders_items_id_fkey FOREIGN KEY (item_id) REFERENCES items(id)
);