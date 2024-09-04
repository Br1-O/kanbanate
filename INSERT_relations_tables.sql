INSERT INTO `rel_Groups_Employees` (`group`, `employee`)
VALUES (1, 1),
       (2, 2),
       (3, 3);

INSERT INTO `rel_Groups_Employees` (`group`, `employee`)
VALUES (1, 1),
       (2, 2),
       (3, 3);

INSERT INTO `rel_Users_Actions` (`user`, `action`, `objective_type`, `objective_id`, `is_active`)
VALUES (1, 1, 'task', 1, 1),
       (2, 2, 'task', 2, 1),
       (3, 3, 'task', 3, 1);
       
INSERT INTO `rel_Areas_Tasks`(area,task,is_current),
VALUES('3','3','1'),
('2','1', '1'),
('5','2','2');

INSERT INTO `rel_Users_Tasks`(user,task,relation_type),
VALUES('1','2','3'),
('2','1','4'),
('3','2','1');

INSERT INTO `rel_Group_Tasks`(group,task),
VALUES('2','1'),
('1','2'),
('3','4');
