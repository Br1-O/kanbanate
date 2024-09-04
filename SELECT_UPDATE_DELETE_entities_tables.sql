SELECT g.id, a.name as 'area', s.name as 'status'
FROM `Groups` as g
JOIN Areas as a
ON g.area = a.id
JOIN Status_group as s
ON g.status = s.id
WHERE is_active = 1;

SELECT a.name, a.description, s.name as 'status'
FROM Areas as a
INNER JOIN Status_area as s
ON a.status = s.id;

SELECT t.name, t.description, t.deadline, t.date_start, t.date_last_update, t.date_end, s.name as 'status'
FROM Tasks as t
INNER JOIN Status_task as s
ON t.status = s.id
WHERE t.is_active = 1;

SELECT e.name, e.surname, e.DNI, e.email, e.phone, e.address, e.city, e.country, e.gender, s.name as 'status'
FROM Employees as e 
INNER JOIN Status_employee as s
ON e.status = s.id
WHERE e.is_active = 1;

SELECT u.username, u.`password`, CONCAT(e.name, ' ', e.surname) as 'employee', e.email as email
FROM Users as u
INNER JOIN Employees as e
ON u.employee = e.id
WHERE u.is_active = 1;

SELECT m.subject, m.content, CONCAT(sender.name, ' ', sender.surname) as 'FROM', CONCAT(recipient.name, ' ', recipient.surname) as 'TO', m.date_sent
FROM Messages as m
JOIN Employees as sender
ON m.id_sender = sender.id
JOIN Employees as recipient
ON m.id_recipient = recipient.id
WHERE m.is_active = 1;

UPDATE `Groups` SET `status` = 2 WHERE `id` = 1;
UPDATE `Groups` SET `is_active` = 0 WHERE `id` = 2;
UPDATE `Groups` SET `area` = 3 WHERE `id` = 3;

UPDATE `Employees` SET `city` = 'La Plata' WHERE `id` = 1;
UPDATE `Employees` SET `email` = 'maria.f.nueva@ejemplo.com' WHERE `id` = 2;
UPDATE `Employees` SET `phone` = '01165432178' WHERE `id` = 3; 

UPDATE `Users` SET `password` = 'nuevacontraseña1hash' WHERE `id` = 1;
UPDATE `Users` SET `last_online` = '2024-09-01 12:34:56' WHERE `id` = 2;
UPDATE `Users` SET `profile_picture` = 'nueva_perfil_lucia.jpg' WHERE `id` = 3; 

UPDATE `Areas` SET description='área encargada de comercializar los productos.' WHERE name='Ventas';
UPDATE `Tasks` SET status='3' WHERE name='Organizar reuniones';
UPDATE `Messages` SET subject='URGENTE' WHERE id='2';

DELETE FROM `Areas` WHERE name='Producción';
DELETE FROM `Tasks` WHERE name='Capacitación';
DELETE FROM `Messages` WHERE subject='Cambios';
DELETE FROM `Groups` WHERE `id` = 1;
DELETE FROM `Employees` WHERE `id` = 1;
DELETE FROM `Users` WHERE `id` = 1;


