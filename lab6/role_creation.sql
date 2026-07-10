-- Active: 1780277581223@@127.0.0.1@3306@lab3
-- //creating roles 
CREATE ROLE 'read_only_role'@'localhost';
CREATE ROLE 'data_entry_role';
CREATE ROLE 'admin_role';


use lab3;

-- granting privellages to roles
GRANT ALL PRIVILEGES on lab3.* to 'admin_role';
GRANT SELECT ON lab3.students TO read_only_role;
GRANT INSERT,UPDATE on lab3.* to 'data_entry_role';

-- giving role to users 
GRANT read_only_role TO user_demo_1;
grant 'data_entry_role' to 'user_demo_2';


REVOKE data_entry_role FROM user_demo_2;
FLUSH PRIVILEGES;
