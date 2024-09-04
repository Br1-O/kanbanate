UPDATE `rel_Areas_Tasks` SET area= 5 WHERE task= 2;

UPDATE `rel_Users_Tasks` SET task= 3 WHERE user= 1;	

UPDATE `rel_Groups_Tasks` SET `group`= 4 WHERE task= 4;


UPDATE `rel_Groups_Employees` SET `employee`= 1 WHERE `id`= 2;
UPDATE `rel_Groups_Employees` SET `group`= 1 WHERE `id`= 1;

UPDATE `rel_Users_Actions` SET `action`= 2 WHERE `id`= 1;
UPDATE `rel_Users_Actions` SET `objective_id`= 3 WHERE `id`= 2;
UPDATE `rel_Users_Actions` SET `objective_type`= 'user' WHERE `id`= 3;

DELETE FROM `rel_Areas_Tasks` WHERE area= 2;
DELETE FROM `real_Users_Tasks` WHERE `user`= 2;
DELETE FROM `real_Groups_Tasks` WHERE `group`= 3;
DELETE FROM `rel_Groups_Employees` WHERE `id`= 1;
DELETE FROM `rel_Users_Actions` WHERE `id`= 1;