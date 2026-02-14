-- +migrate Up
-- Drop the analytics.users view temporarily (it references ui_language column)
DROP VIEW IF EXISTS analytics.users;

-- Alter the ui_language column type
ALTER TABLE users ALTER COLUMN ui_language TYPE varchar(10);

-- Recreate the analytics.users view
CREATE OR REPLACE VIEW analytics.users AS 
SELECT * FROM public.users 
WHERE tenant_id = current_setting('app.tenant_id', TRUE)::uuid;

-- +migrate Down
-- Drop the analytics.users view temporarily
DROP VIEW IF EXISTS analytics.users;

-- Revert the ui_language column type
ALTER TABLE users ALTER COLUMN ui_language TYPE varchar(3);

-- Recreate the analytics.users view
CREATE OR REPLACE VIEW analytics.users AS 
SELECT * FROM public.users 
WHERE tenant_id = current_setting('app.tenant_id', TRUE)::uuid;
