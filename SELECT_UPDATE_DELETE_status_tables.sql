SELECT * FROM `Status_area`;
SELECT * FROM `Status_group`;
SELECT * FROM `Status_employee`;
SELECT * FROM `Status_task`;
SELECT * FROM `Relation_types`;
SELECT * FROM `Actions`;

UPDATE `Status_area` SET name = 'nombre', description = 'descripcion' WHERE id = 8; 
UPDATE `Status_group` SET name = 'nombre', description = 'descripcion' WHERE id = 8; 
UPDATE `Status_employee` SET name = 'nombre', description = 'descripcion' WHERE id = 8; 
UPDATE `Status_task` SET name = 'nombre', description = 'descripcion' WHERE id = 8; 
UPDATE `Relation_types` SET name = 'nombre', description = 'descripcion' WHERE id = 8; 
UPDATE `Actions` SET name = 'nombre', description = 'descripcion' WHERE id = 8; 

DELETE FROM `Status_area` WHERE id=8;
DELETE FROM `Status_group` WHERE id>=8;
DELETE FROM `Status_employee` WHERE id<10;
DELETE FROM `Status_task` WHERE id<10;
DELETE FROM `Relation_types` WHERE id<10;
DELETE FROM `Actions` WHERE id<10;

