-- Create tourmanager schema
CREATE SCHEMA IF NOT EXISTS tourmanager;

-- Drop public schema
DROP SCHEMA IF EXISTS public;

-- Set tourmanager_user path to tourmanager_db
ALTER ROLE tourmanager_admin IN DATABASE "postgres" set search_path = 'tourmanager_db';

-- Extensions
CREATE EXTENSION IF NOT EXISTS "btree_gist";
CREATE EXTENSION IF NOT EXISTS "citext";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create email type
-- CREATE DOMAIN email AS tourmanager.citext
-- CHECK ( value ~ '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$' );

-- Create authenticator role + usage / PostgREST
CREATE ROLE authenticator noinherit login password 'password';
GRANT USAGE ON SCHEMA tourmanager TO authenticator;

-- Create anonymous role + usage / PostgREST
CREATE ROLE anonymous nologin;
GRANT USAGE ON SCHEMA tourmanager TO anonymous;

-- Grant roles to authenticator
GRANT anonymous TO authenticator;
