INSERT INTO `Areas`(`name`, `description`)
VALUES ('Producción','Creación de productos para la venta.'),
('Dirección','Controla todas las áreas de trabajo que se encuentran en la empresa.'),
('Administración','Encargada de la operación de la empresaa en sentido general, desde contrataciones, pagos a personal.'),
('Ventas', 'Distribuye los productos a cambio de dinero.'),
('Contabilidad', 'Llevan el registro contable de la actividad financiera de la empresa.');

INSERT INTO `Tasks`(`name`, `description`, `status`, deadline, date_start, date_last_update, date_end, is_active)
VALUES('Organizar reuniones','Coordinar fechas, preparar agendas y tomar notas.','1','2024/12/04','2024/09/02','2024/09/02 12:02:25','2024/12/04 00:00:00 ','1'),
('Presupuestación','Desarrollar y revisar presupuestos anuales o trimestrales','2','2024/12/04','2024/09/02','2024/09/02 12:02:25','2024/12/04 00:00:00 ','1'),
('Capacitación','Organizar sesiones de formación y desarrollo para empleados','4','2024/12/04','2024/09/02','2024/09/02 12:02:25','2024/12/04 00:00:00 ','2');

INSERT INTO `Groups` (area, `status`)
VALUES (1, 1),
       (2, 1),
       (3, 1);

INSERT INTO `Employees` (`name`, surname, DNI, email, phone, address, city, country, gender)
VALUES ('Carlos', 'González', '30123456', 'carlos.gonzalez@ejemplo.com', '01112345678', 'Av. Corrientes 1234', 'Buenos Aires', 'Argentina', 'Masculino'),
       ('María', 'Fernández', '32123456', 'maria.fernandez@ejemplo.com', '01187654321', 'Calle Florida 4321', 'Córdoba', 'Argentina', 'Femenino'),
       ('Lucía', 'Martínez', '34123456', 'lucia.martinez@ejemplo.com', '01156781234', 'San Martín 567', 'Rosario', 'Argentina', 'Femenino');
  
INSERT INTO `Users` (username, `password`, employee, profile_picture)
VALUES ('cgonzalez', 'contraseña1hash', 1, 'perfil_carlos.jpg'),
       ('mfernandez', 'contraseña2hash', 2, 'perfil_maria.jpg'),
       ('lmartinez', 'contraseña3hash', 3, 'perfil_lucia.jpg');

INSERT INTO `Messages`(subject, content, id_sender, id_recipient, date_sent, is_active)
VALUES('Reunión','lorem ipsum neque porro quisquam est qui dolorem ipsum quia dolor sit amet','7','7','2024/08/02','1'),
('Urgente','lorem ipsum neque porro quisquam est qui dolorem ipsum quia dolor sit amet','8','8','2024/08/02','2'),
('Cambios','lorem ipsum neque porro quisquam est qui dolorem ipsum quia dolor sit amet','9','9','2024/08/02','1');