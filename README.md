<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a id="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/user-attachments/assets/825259a5-6541-41a5-bca8-17c579a46380">
    <img src="https://github.com/user-attachments/assets/825259a5-6541-41a5-bca8-17c579a46380" alt="Logo" width="250" height="150" style="border-radius:15px;">
  </a>

  <h3 align="center"> Kanbanate IT · Online task manager </h3>

  <p align="center">
    Sistema de gestión de tareas para proyectos colaborativos
    <br />
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Tabla de contenido </summary>
  <ol>
    <li><a href="#about"> Sobre el proyecto</a></li>
    <li><a href="#develop-with">Desarrollado con</a></li>
    <li><a href="#project-structure">Estructura del proyecto </a></li>
  </ol>
</details>


<a id="about"></a>
<!-- ABOUT THE PROJECT -->
## Sobre este proyecto

Este proyecto se trata de un sistema de gestión de tareas al estilo Kanban, implementando un tablero de tareas común para los participantes del grupo, un sistema de mensajería, y un sistema de cuentas.<br><br>
En el tablero podrán asignarse nuevas tareas a los usuarios. Los usuarios podrán visualizar datos de la tarea y modificar su status en base al avance en la misma.
<br><br>
Originalmente se desarrolló este proyecto bajo el marco de un trabajo integrador para el curso de Desarrollador Fullstack, brindado por [CILSA](https://www.cilsa.org/).

<p align="right">(<a href="#readme-top">Volver al inicio</a>)</p>

<a id="develop-with"></a>
## Desarrollado con:

Para este proyecto se usaron las siguientes técnologias y lenguajes<!-- y librerias:-->.

#### Desarrollo en general:

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![MySQL Workbench](https://img.shields.io/badge/MySQL_Workbench-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![Lucid.app](https://img.shields.io/badge/Lucid.app-FFAB00?style=for-the-badge&logo=data:image/svg+xml;base64,<BASE64_ENCODED_LOGO_HERE>&logoColor=white)

#### Control de versionado: 
<!--y deploy de demo:-->

[![GitHub][GitHub.com]][GitHub-url]
[![Git][Git.com]][Git-url]

#### Personalmente se optó para el desarrollo de este proyecto el uso de:

[![VSCode][VSCode.com]][VSCode-url]

<p align="right">(<a href="#readme-top">Volver al inicio</a>)</p>

<a id="project-structure"></a>
## Estructura de la base de datos

La estructura de la base de datos para el proyecto está organizada de la siguiente manera:

![DB_Kanban](https://github.com/user-attachments/assets/eddc9555-ab9f-497e-9324-99a7f53af68b)

**Tablas de entidades:**

<details>
  <summary> Areas </summary>
  <br>
  <ul>
    <li>
      Create:

   ```sh
     CREATE TABLE IF NOT EXISTS `Areas` (
      `id` INT auto_increment PRIMARY KEY,
      `name` VARCHAR(50) NOT NULL UNIQUE,
      `description` VARCHAR(100),
      `status` INT NOT NULL DEFAULT 1,
      FOREIGN KEY (`status`) REFERENCES `Status_area`(`id`),
      INDEX (`name`)
   ```
  </li>
    <li>
      Insert:

   ```sh
      INSERT INTO `Areas`(`name`, `description`)
      VALUES 
        ('Producción','Creación de productos para la venta.'),
        ('Dirección','Controla todas las áreas de trabajo que se encuentran en la empresa.'),
        ('Administración','Encargada de la operación de la empresaa en sentido general, desde contrataciones, pagos a personal.'),
        ('Ventas', 'Distribuye los productos a cambio de dinero.'),
        ('Contabilidad', 'Llevan el registro contable de la actividad financiera de la empresa.');
   ```
  </li>
    <li>
      Select - Join:
      
   ```sh
    SELECT a.name, a.description, s.name as 'status'
    FROM Areas as a
    INNER JOIN Status_area as s
    ON a.status = s.id;
   ```

![Captura de pantalla 2024-09-04 145121](https://github.com/user-attachments/assets/be143dc2-c182-46fb-82f2-54fd66f6e8cb)

  </li>
      <li>
      Update:
      
   ```sh
    UPDATE `Areas` SET description='área encargada de comercializar los productos.' WHERE name='Ventas';
   ```
  </li>
      <li>
      Delete:
      
   ```sh
    DELETE FROM `Areas` WHERE name='Producción';
   ```
  </li>
  </ul>
</details>

<details>
  <summary> Tasks </summary>
  <br>
  <ul>
    <li>
      Create:

   ```sh
    CREATE TABLE IF NOT EXISTS `Tasks` (
      `id` INT auto_increment PRIMARY KEY,
      `name` VARCHAR(50) NOT NULL,
      `description` VARCHAR(250),
      `status` INT NOT NULL DEFAULT 1,
      `deadline` DATE,
      `date_start` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      `date_last_update` DATETIME,
      `date_end` DATETIME,
      `is_active` TINYINT(1) NOT NULL DEFAULT 1,
      FOREIGN KEY (`status`) REFERENCES `Status_task`(`id`),
      INDEX (`name`)
    );
   ```
  </li>
    <li>
      Insert:

   ```sh
    INSERT INTO `Tasks`(`name`, `description`, `status`, deadline, date_start, date_last_update, date_end, is_active)
    VALUES('Organizar reuniones','Coordinar fechas, preparar agendas y tomar notas.','1','2024/12/04','2024/09/02','2024/09/02 12:02:25','2024/12/04 00:00:00 ','1'),
    ('Presupuestación','Desarrollar y revisar presupuestos anuales o trimestrales','2','2024/12/04','2024/09/02','2024/09/02 12:02:25','2024/12/04 00:00:00 ','1'),
    ('Capacitación','Organizar sesiones de formación y desarrollo para empleados','4','2024/12/04','2024/09/02','2024/09/02 12:02:25','2024/12/04 00:00:00 ','0');
   ```
  </li>
    <li>
      Select - Join:
      
   ```sh
    SELECT t.name, t.description, t.deadline, t.date_start, t.date_last_update, t.date_end, s.name as 'status'
    FROM Tasks as t
    INNER JOIN Status_task as s
    ON t.status = s.id
    WHERE t.is_active = 1;
   ```

![Captura de pantalla 2024-09-04 145140](https://github.com/user-attachments/assets/b9ced7e2-a4cc-4ea7-a56c-9a5e1ef3ab50)

  </li>
      <li>
      Update:
      
   ```sh
    UPDATE `Tasks` SET status='3' WHERE name= 'Organizar reuniones';
   ```
  </li>
      <li>
      Delete:
      
   ```sh
    DELETE FROM `Tasks` WHERE name= 'Capacitación';
   ```
  </li>
  </ul>
</details>

<details>
  <summary> Groups </summary>
  <br>
  <ul>
    <li>
      Create:

   ```sh
    CREATE TABLE IF NOT EXISTS `Groups` (
      `id` INT auto_increment PRIMARY KEY,
      `area` INT,
      `status` INT NOT NULL DEFAULT 1,
      `is_active` TINYINT(1) NOT NULL DEFAULT 1,
      FOREIGN KEY (`area`) REFERENCES `Areas`(`id`),
      FOREIGN KEY (`status`) REFERENCES `Status_group`(`id`)
    );
   ```
  </li>
    <li>
      Insert:

   ```sh
    INSERT INTO `Groups` (area, `status`)
    VALUES (1, 1),
           (2, 1),
           (3, 1);
   ```
  </li>
    <li>
      Select - Join:
      
   ```sh
    SELECT g.id as 'grupo', a.name as 'area', s.name as 'status'
    FROM `Groups` as g
    JOIN Areas as a
    ON g.area = a.id
    JOIN Status_group as s
    ON g.status = s.id
    WHERE is_active = 1;
   ```

![Captura de pantalla 2024-09-04 145109](https://github.com/user-attachments/assets/8d6d9fc1-721f-4b44-bfaa-86e6b5c12ea8)

  </li>
      <li>
      Update:
      
   ```sh
    UPDATE `Groups` SET `status` = 2 WHERE `id`= 1;
    UPDATE `Groups` SET `is_active` = 0 WHERE `id`= 2;
    UPDATE `Groups` SET `area` = 3 WHERE `id`= 3;
   ```
  </li>
      <li>
      Delete:
      
   ```sh
    DELETE FROM `Groups` WHERE `id`= 1;
   ```
  </li>
  </ul>
</details>

<details>
  <summary> Employees </summary>
  <br>
  <ul>
    <li>
      Create:

   ```sh
      CREATE TABLE IF NOT EXISTS `Employees` (
    `id` INT auto_increment PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL,
    `surname` VARCHAR(50) NOT NULL,
    `DNI` VARCHAR(10) NOT NULL UNIQUE,
    `email` VARCHAR(50) NOT NULL UNIQUE,
    `phone` VARCHAR(20),
    `address` VARCHAR(50),
    `city` VARCHAR(50),
    `country` VARCHAR(50),
    `gender` VARCHAR(10),
    `status` INT NOT NULL DEFAULT 1,
    `is_active` TINYINT(1) NOT NULL DEFAULT 1,
    FOREIGN KEY (`status`) REFERENCES `Status_employee`(`id`),
    INDEX (`DNI`),
    INDEX (`email`)
    );
   ```
  </li>
    <li>
      Insert:

   ```sh
    INSERT INTO `Employees` (`name`, surname, DNI, email, phone, address, city, country, gender)
    VALUES ('Carlos', 'González', '30123456', 'carlos.gonzalez@ejemplo.com', '01112345678', 'Av. Corrientes 1234', 'Buenos Aires', 'Argentina', 'Masculino'),
           ('María', 'Fernández', '32123456', 'maria.fernandez@ejemplo.com', '01187654321', 'Calle Florida 4321', 'Córdoba', 'Argentina', 'Femenino'),
           ('Lucía', 'Martínez', '34123456', 'lucia.martinez@ejemplo.com', '01156781234', 'San Martín 567', 'Rosario', 'Argentina', 'Femenino');
   ```
  </li>
    <li>
      Select - Join:
      
   ```sh
    SELECT e.name, e.surname, e.DNI, e.email, e.phone, e.address, e.city, e.country, e.gender, s.name as 'status'
    FROM Employees as e 
    INNER JOIN Status_employee as s
    ON e.status = s.id
    WHERE e.is_active = 1;
   ```

![Captura de pantalla 2024-09-04 145158](https://github.com/user-attachments/assets/d11ac374-fd9b-4f2f-8ce8-69128b1e43b8)

  </li>
      <li>
      Update:
      
   ```sh
      UPDATE `Employees` SET `city` = 'La Plata' WHERE `id`= 1;
      UPDATE `Employees` SET `email` = 'maria.f.nueva@ejemplo.com' WHERE `id`= 2;
      UPDATE `Employees` SET `phone` = '01165432178' WHERE `id`= 3; 
   ```
  </li>
      <li>
      Delete:
      
   ```sh
    DELETE FROM `Employees` WHERE `id`= 1;
   ```
  </li>
  </ul>
</details>

<details>
  <summary> Users </summary>
  <br>
  <ul>
    <li>
      Create:

   ```sh
     CREATE TABLE IF NOT EXISTS `Users` (
    `id` INT auto_increment PRIMARY KEY,
    `username` VARCHAR(50) NOT NULL UNIQUE,
    `password` CHAR(80),
    `employee` INT NOT NULL UNIQUE,
    `profile_picture` VARCHAR(100),
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `last_online` DATETIME,
    `is_active` TINYINT(1) NOT NULL DEFAULT 1,
    FOREIGN KEY (`employee`) REFERENCES `Employees`(`id`),
    INDEX (`username`)
    );
   ```
  </li>
    <li>
      Insert:

   ```sh
    INSERT INTO `Users` (username, `password`, employee, profile_picture)
    VALUES ('cgonzalez', 'contraseña1hash', 1, 'perfil_carlos.jpg'),
           ('mfernandez', 'contraseña2hash', 2, 'perfil_maria.jpg'),
           ('lmartinez', 'contraseña3hash', 3, 'perfil_lucia.jpg');
   ```
  </li>
    <li>
      Select - Join:
      
   ```sh
    SELECT u.username, u.`password`, CONCAT(e.name, ' ', e.surname) as 'employee', e.email as email
    FROM Users as u
    INNER JOIN Employees as e
    ON u.employee = e.id
    WHERE u.is_active = 1;
   ```

![Captura de pantalla 2024-09-04 145208](https://github.com/user-attachments/assets/cd3e7abe-2776-43e2-b8a0-2c79675ee6c3)


  </li>
      <li>
      Update:
      
   ```sh
    UPDATE `Users` SET `password` = 'nuevacontraseña1hash' WHERE `id`= 1;
    UPDATE `Users` SET `last_online` = '2024-09-01 12:34:56' WHERE `id`= 2;
    UPDATE `Users` SET `profile_picture` = 'nueva_perfil_lucia.jpg' WHERE `id`= 3;
   ```
  </li>
      <li>
      Delete:
      
   ```sh
    DELETE FROM `Users` WHERE `id`= 1;
   ```
  </li>
  </ul>
</details>

<details>
  <summary> Messages </summary>
  <br>
  <ul>
    <li>
      Create:

   ```sh
      CREATE TABLE IF NOT EXISTS `Messages` (
    `id` INT auto_increment PRIMARY KEY,
    `subject` VARCHAR(20),
    `content` TEXT NOT NULL,
    `id_sender` INT NOT NULL,
    `id_recipient` INT NOT NULL,
    `date_sent` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `is_active` TINYINT(1) NOT NULL DEFAULT 1,
    FOREIGN KEY (`id_sender`) REFERENCES `Users`(`id`),
    FOREIGN KEY (`id_recipient`) REFERENCES `Users`(`id`),
    INDEX (`date_sent`)
    );
   ```
  </li>
    <li>
      Insert:

   ```sh
      INSERT INTO `Messages`(subject, content, id_sender, id_recipient, date_sent, is_active)
      VALUES('Reunión','lorem ipsum neque porro quisquam est qui dolorem ipsum quia dolor sit amet','1','2','2024/08/02','1'),
      ('Urgente','lorem ipsum neque porro quisquam est qui dolorem ipsum quia dolor sit amet','2','3','2024/08/02','0'),
      ('Cambios','lorem ipsum neque porro quisquam est qui dolorem ipsum quia dolor sit amet','3','1','2024/08/02','1');
   ```
  </li>
    <li>
      Select - Join:
      
   ```sh
    SELECT m.subject, m.content, CONCAT(sender.name, ' ', sender.surname) as 'FROM', CONCAT(recipient.name, ' ', recipient.surname) as 'TO', m.date_sent
    FROM Messages as m
    JOIN Employees as sender
    ON m.id_sender = sender.id
    JOIN Employees as recipient
    ON m.id_recipient = recipient.id
    WHERE m.is_active = 1;
   ```

![Captura de pantalla 2024-09-04 145216](https://github.com/user-attachments/assets/710eeb1c-56ad-4518-8d43-0e82691b59ef)

  </li>
      <li>
      Update:
      
   ```sh
    UPDATE `Messages` SET subject='URGENTE' WHERE id= '2';
   ```
  </li>
      <li>
      Delete:
      
   ```sh
     DELETE FROM `Messages` WHERE subject= 'Cambios';
   ```
  </li>
  </ul>
</details>


**Tablas de relaciones:**

<details>
  <summary> rel_Areas_Tasks </summary>
  <br>
  <ul>
    <li>
      Create:

   ```sh
    CREATE TABLE IF NOT EXISTS `rel_Areas_Tasks` (
      `id` INT auto_increment PRIMARY KEY,
      `area` INT NOT NULL,
      `task` INT NOT NULL,
      `is_current` TINYINT(1) NOT NULL DEFAULT 1,
      FOREIGN KEY (`area`) REFERENCES `Areas`(`id`),
      FOREIGN KEY (`task`) REFERENCES `Tasks`(`id`)
    );
   ```
  </li>
    <li>
      Insert:

   ```sh
    INSERT INTO `rel_Areas_Tasks`(area, task, is_current)
    VALUES('3','3','1'),
    ('2','1', '1'),
    ('5','2','2');
   ```
  </li>
    <li>
      Select - Join:
      
   ```sh
    SELECT 
        rat.id,
        a.name AS 'area',
        t.name AS 'task'
    FROM 
        rel_Areas_Tasks AS rat
    JOIN 
        Areas AS a ON rat.area = a.id
    JOIN 
        Tasks AS t ON rat.task = t.id
    WHERE rat.is_current = 1;
   ```

![Captura de pantalla 2024-09-06 153437](https://github.com/user-attachments/assets/f2a1984c-46ac-4a8e-944c-0f4b518ad5c3)

  </li>
      <li>
      Update:
      
   ```sh
    UPDATE `rel_Areas_Tasks` SET area= 5 WHERE task= 2;
   ```
  </li>
      <li>
      Delete:
      
   ```sh
    DELETE FROM `rel_Areas_Tasks` WHERE area= 2;
   ```
  </li>
  </ul>
</details>

<details>
  <summary> rel_Groups_Tasks </summary>
  <br>
  <ul>
    <li>
      Create:

   ```sh
    CREATE TABLE IF NOT EXISTS `rel_Groups_Tasks` (
      `id` INT auto_increment PRIMARY KEY,
      `group` INT NOT NULL,
      `task` INT NOT NULL,
      FOREIGN KEY (`task`) REFERENCES `Tasks`(`id`),
      FOREIGN KEY (`group`) REFERENCES `Groups`(`id`)
    );
   ```
  </li>
    <li>
      Insert:

   ```sh
    INSERT INTO `rel_Groups_Tasks`(`group`, task)
    VALUES('2','1'),
    ('1','2'),
    ('3','3');
   ```
  </li>
    <li>
      Select - Join:
      
   ```sh
    SELECT 
        rgt.id,
        g.id AS 'group',
        s.name AS 'group status',
        t.name AS 'task'
    FROM 
        rel_Groups_Tasks AS rgt
    JOIN 
        Groups AS g ON rgt.group = g.id
    JOIN
    	Status_group AS s ON g.status = s.id
    JOIN 
        Tasks AS t ON rgt.task = t.id
    WHERE g.is_active = 1
    ORDER BY g.id;
   ```

![Captura de pantalla 2024-09-06 153732](https://github.com/user-attachments/assets/97356c89-abe5-494c-b65d-a175c3559cbe)

  </li>
      <li>
      Update:
      
   ```sh
    UPDATE `rel_Groups_Tasks` SET `group`= 4 WHERE task= 4;
   ```
  </li>
      <li>
      Delete:
      
   ```sh
    DELETE FROM `rel_Groups_Tasks` WHERE `group`= 3;
   ```
  </li>
  </ul>
</details>

<details>
  <summary> rel_Groups_Employees </summary>
  <br>
  <ul>
    <li>
      Create:

   ```sh
    CREATE TABLE IF NOT EXISTS `rel_Groups_Employees` (
      `id` INT auto_increment PRIMARY KEY,
      `group` INT NOT NULL,
      `employee` INT NOT NULL,
      FOREIGN KEY (`employee`) REFERENCES `Employees`(`id`),
      FOREIGN KEY (`group`) REFERENCES `Groups`(`id`)
    );
   ```
  </li>
    <li>
      Insert:

   ```sh
    INSERT INTO `rel_Groups_Employees` (`group`, employee)
    VALUES (1, 1),
           (2, 2),
           (3, 3);
   ```
  </li>
    <li>
      Select - Join:
      
   ```sh
    SELECT 
        rge.id,
        g.id AS 'group',
        e.name AS employee_name,
        e.surname AS employee_surname
    FROM 
        rel_Groups_Employees AS rge
    JOIN 
        Groups AS g ON rge.group = g.id
    JOIN 
        Employees AS e ON rge.employee = e.id
    WHERE e.is_active = 1;
   ```

![Captura de pantalla 2024-09-06 153950](https://github.com/user-attachments/assets/b6d6d13c-0a3b-489b-a5a7-c3a54f789439)

  </li>
      <li>
      Update:
      
   ```sh
    UPDATE `rel_Groups_Employees` SET `employee`= 1 WHERE `id`= 2;
    UPDATE `rel_Groups_Employees` SET `group`= 1 WHERE `id`= 1;
   ```
  </li>
      <li>
      Delete:
      
   ```sh
    DELETE FROM `rel_Groups_Employees` WHERE `id`= 1;
   ```
  </li>
  </ul>
</details>

<details>
  <summary> rel_Users_Tasks </summary>
  <br>
  <ul>
    <li>
      Create:

   ```sh
    CREATE TABLE IF NOT EXISTS `rel_Users_Tasks` (
      `id` INT auto_increment PRIMARY KEY,
      `user` INT NOT NULL,
      `task` INT NOT NULL,
      `relation_type` INT NOT NULL,
      FOREIGN KEY (`relation_type`) REFERENCES `Relation_types`(`id`),
      FOREIGN KEY (`user`) REFERENCES `Users`(`id`),
      FOREIGN KEY (`task`) REFERENCES `Tasks`(`id`)
    );
   ```
  </li>
    <li>
      Insert:

   ```sh
    INSERT INTO `rel_Users_Tasks`(`user`, task, relation_type)
    VALUES('1','2','3'),
    ('2','1','4'),
    ('3','2','1');
   ```
  </li>
    <li>
      Select - Join:
      
   ```sh
    SELECT 
            rut.id,
            u.username AS user_name,
            t.name AS task_name,
            rt.name AS relation_type
        FROM 
            rel_Users_Tasks AS rut
        JOIN 
            Users AS u ON rut.user = u.id
        JOIN 
            Tasks AS t ON rut.task = t.id
        JOIN 
            Relation_types AS rt ON rut.relation_type = rt.id
    	WHERE u.is_active= 1 and t.is_active= 1;
   ```

![Captura de pantalla 2024-09-06 155046](https://github.com/user-attachments/assets/4ed925e1-ca9b-4606-9a3c-0344cc1040df)

  </li>
      <li>
      Update:
      
   ```sh
    UPDATE `rel_Users_Tasks` SET task= 3 WHERE user= 1;	
   ```
  </li>
      <li>
      Delete:
      
   ```sh
    DELETE FROM `rel_Users_Tasks` WHERE `user`= 2;
   ```
  </li>
  </ul>
</details>

<details>
  <summary> rel_Users_Actions </summary>
  <br>
  <ul>
    <li>
      Create:

   ```sh
    CREATE TABLE IF NOT EXISTS `rel_Users_Actions` (
      `id` INT auto_increment PRIMARY KEY,
      `user` INT NOT NULL,
      `action` INT NOT NULL,
      `objective_type` ENUM('user', 'task', 'message', 'group', 'area'),
      `objective_id` INT,
      `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      `is_active` TINYINT(1) NOT NULL DEFAULT 1,
      FOREIGN KEY (`action`) REFERENCES `Actions`(`id`),
      FOREIGN KEY (`user`) REFERENCES `Users`(`id`)
    );
   ```
  </li>
    <li>
      Insert:

   ```sh
    INSERT INTO `rel_Users_Actions` (`user`, `action`, objective_type, objective_id, is_active)
    VALUES (1, 1, 'task', 1, 1),
           (2, 2, 'task', 2, 1),
           (3, 3, 'task', 3, 1);
   ```
  </li>
    <li>
      Select - Join:
      
   ```sh
    SELECT 
        rua.id,
        u.username AS user_name,
        a.name AS action_name,
        rua.objective_type,
        rua.objective_id,
        rua.created_at
    FROM 
        rel_Users_Actions AS rua
    JOIN 
        Users AS u ON rua.user = u.id
    JOIN 
        Actions AS a ON rua.action = a.id;
   ```

![Captura de pantalla 2024-09-06 154255](https://github.com/user-attachments/assets/3717ac0b-3e6b-4457-99c8-22ac094818ac)

  </li>
      <li>
      Update:
      
   ```sh
    UPDATE `rel_Users_Actions` SET `action`= 2 WHERE `id`= 1;
    UPDATE `rel_Users_Actions` SET `objective_id`= 3 WHERE `id`= 2;
    UPDATE `rel_Users_Actions` SET `objective_type`= 'user' WHERE `id`= 3;
   ```
  </li>
      <li>
      Delete:
      
   ```sh
    DELETE FROM `rel_Users_Actions` WHERE `id`= 1;
   ```
  </li>
  </ul>
</details>


**Tablas de estatus, tipos de relaciones y acciones:**

<details>
  <summary> Status_area </summary>
  <br>
  <ul>
    <li>
      Create:

   ```sh
    CREATE TABLE IF NOT EXISTS `Status_area` (
      `id` INT auto_increment PRIMARY KEY,
      `name` VARCHAR(50) NOT NULL UNIQUE,
      `description` VARCHAR(100)
    );
   ```
  </li>
    <li>
      Insert:

   ```sh
    INSERT INTO `Status_area`(name, description) 
    VALUES ('activa', 'El area está actualmente funcional.'), 
    ('inactiva', 'El area se encuentra temporalmente fuera de funcionamiento.'),
    ('archivada', 'El area no está en funcionamiento y se encuentra archivada sólo para registros historicos'),
    ('bajo revisión', 'El area está funcional, pero está siendo evaluada para su futuro uso o reestructuración.'),
    ('planificada', 'El area está siendo planificada para su futura implementación.'), 
    ('cerrada', 'El area fue cerrada de forma permanente.');
   ```
  </li>
    <li>
      Select:
      
   ```sh
    SELECT * FROM `Status_area`;
   ```

![Captura de pantalla 2024-09-04 144901](https://github.com/user-attachments/assets/39582220-272b-4d70-9b49-7186350608c8)

  </li>
      <li>
      Update:
      
   ```sh
    UPDATE `Status_area` SET name = 'nombre', description = 'descripcion' WHERE id = 5; 
   ```
  </li>
      <li>
      Delete:
      
   ```sh
    DELETE FROM `Status_area` WHERE id=5;
   ```
  </li>
  </ul>
</details>

<details>
  <summary> Status_task </summary>
  <br>
  <ul>
    <li>
      Create:

   ```sh
    CREATE TABLE IF NOT EXISTS `Status_task` (
      `id` INT auto_increment PRIMARY KEY,
      `name` VARCHAR(50) NOT NULL UNIQUE,
      `description` VARCHAR(100)
    );
   ```
  </li>
    <li>
      Insert:

   ```sh
    INSERT INTO `Status_task`(name, description) 
    VALUES ('recién asignada', 'La tarea fue recién asignada.'), 
    ('en resolución', 'La tarea ya fue asignada y está siendo resuelta.'),
    ('completa', 'La tarea ya fue resuelta.'), 
    ('cancelada', 'La tarea fue cancelada y ya no se requiere su resolución.'), 
    ('archivada', 'La tarea fue resuelta hace más de 30 días y se archivó para registro historico.');
   ```
  </li>
    <li>
      Select:
      
   ```sh
    SELECT * FROM `Status_task`;
   ```

![Captura de pantalla 2024-09-04 145011](https://github.com/user-attachments/assets/46430365-92a8-4bab-8058-dc3a08e482b8)

  </li>
      <li>
      Update:
      
   ```sh
    UPDATE `Status_task` SET name = 'nombre', description = 'descripcion' WHERE id = 8; 
   ```
  </li>
      <li>
      Delete:
      
   ```sh
    DELETE FROM `Status_task` WHERE id<10;
   ```
  </li>
  </ul>
</details>

<details>
  <summary> Status_group </summary>
  <br>
  <ul>
    <li>
      Create:

   ```sh
    CREATE TABLE IF NOT EXISTS `Status_group` (
      `id` INT auto_increment PRIMARY KEY,
      `name` VARCHAR(50) NOT NULL UNIQUE,
      `description` VARCHAR(100)
    );
   ```
  </li>
    <li>
      Insert:

   ```sh
    INSERT INTO `Status_group`(name, description) 
    VALUES ('disponible', 'El grupo se encuentra disponible para trabajar en una nueva tarea.'), 
    ('ocupado', 'El grupo está actualmente trabajando en una tarea.'),
    ('limitado', 'El grupo se encuentra disponible, pero con una cantidad inferior de miembros'),
    ('bajo reestructuración', 'El grupo no está disponible, ya que está en busqueda de nuevos miembros'),
    ('no disponible', 'El grupo temporalmente no está disponible ni trabajando en ninguna tarea.'), 
    ('disuelto', 'El grupo fue disuelto permanentemente.');
   ```
  </li>
    <li>
      Select:
      
   ```sh
    SELECT * FROM `Status_group`;
   ```

![Captura de pantalla 2024-09-04 144944](https://github.com/user-attachments/assets/57615667-39e3-436e-813c-14e5e0542db8)

  </li>
      <li>
      Update:
      
   ```sh
    UPDATE `Status_group` SET name = 'nombre', description = 'descripcion' WHERE id = 5; 
   ```
  </li>
      <li>
      Delete:
      
   ```sh
    DELETE FROM `Status_group` WHERE id>=5;
   ```
  </li>
  </ul>
</details>

<details>
  <summary> Status_employee </summary>
  <br>
  <ul>
    <li>
      Create:

   ```sh
    CREATE TABLE IF NOT EXISTS `Status_employee` (
      `id` INT auto_increment PRIMARY KEY,
      `name` VARCHAR(50) NOT NULL UNIQUE,
      `description` VARCHAR(100)
    );
   ```
  </li>
    <li>
      Insert:

   ```sh
    INSERT INTO `Status_employee`(name, description) 
    VALUES ('disponible', 'El empleado se encuentra disponible para trabajar en una nueva tarea.'), 
    ('ocupado', 'El empleado está actualmente trabajando en una tarea.'),
    ('de vacaciones', 'El empleado está de vacaciones.'), 
    ('con licencia', 'El empleado está bajo algún tipo de licencia.'), 
    ('no disponible', 'El empleado temporalmente no está disponible ni trabajando en ninguna tarea.'), 
    ('retirado', 'El empleado ya no se encuentra trabajando en la organización.');
   ```
  </li>
    <li>
      Select:
      
   ```sh
    SELECT * FROM `Status_employee`;
   ```

![Captura de pantalla 2024-09-04 144958](https://github.com/user-attachments/assets/3be9f26b-9ba8-4681-865d-4e9953edb4d1)

  </li>
      <li>
      Update:
      
   ```sh
    UPDATE `Status_employee` SET name = 'nombre', description = 'descripcion' WHERE id = 5; 
   ```
  </li>
      <li>
      Delete:
      
   ```sh
    DELETE FROM `Status_employee` WHERE id<10;
   ```
  </li>
  </ul>
</details>

<details>
  <summary> Relation_types </summary>
  <br>
  <ul>
    <li>
      Create:

   ```sh
    CREATE TABLE IF NOT EXISTS `Relation_types` (
      `id` INT auto_increment PRIMARY KEY,
      `name` VARCHAR(50) NOT NULL UNIQUE,
      `description` VARCHAR(100)
    );
   ```
  </li>
    <li>
      Insert:

   ```sh
    INSERT INTO `Relation_types`(name, description) 
    VALUES ('recién asignada', 'El usuario tiene la tarea asignada.'), 
    ('bajo resolución', 'El usuario está trabajando en la tarea.'),
    ('completa', 'La tarea ya fue resuelta por el usuario.'), 
    ('cancelada', 'La tarea fue cancelada por el usuario.'), 
    ('archivada', 'La tarea fue resuelta hace más de 30 días y el usuario la archivó para registro historico.'),
    ('Modificada', 'El usuario editó el estado o algún campo de la tarea.');
   ```
  </li>
    <li>
      Select:
      
   ```sh
    SELECT * FROM `Relation_types`;
   ```

![Captura de pantalla 2024-09-06 152635](https://github.com/user-attachments/assets/be748493-31de-4106-aafc-5114e3dddb3d)

  </li>
      <li>
      Update:
      
   ```sh
    UPDATE `Relation_types` SET name = 'nombre', description = 'descripcion' WHERE id = 8; 
   ```
  </li>
      <li>
      Delete:
      
   ```sh
    DELETE FROM `Relation_types` WHERE id<10;
   ```
  </li>
  </ul>
</details>

<details>
  <summary> Actions </summary>
  <br>
  <ul>
    <li>
      Create:

   ```sh
    CREATE TABLE IF NOT EXISTS `Actions` (
      `id` INT auto_increment PRIMARY KEY,
      `name` VARCHAR(50) NOT NULL UNIQUE,
      `description` VARCHAR(100)
    );
   ```
  </li>
    <li>
      Insert:

   ```sh
    INSERT INTO `Actions`(name, description) 
    VALUES ('Creado', 'El usuario creó la entidad.'), 
    ('Modificado', 'El usuario modificó la entidad.'),
    ('Eliminado', 'El usuario eliminó la entidad.'), 
    ('Archivado', 'El usuario archivó la entidad.'), 
    ('Asignado', 'El usuario asignó la entidad.');
   ```
  </li>
    <li>
      Select:
      
   ```sh
    SELECT * FROM `Actions`;
   ```

![Captura de pantalla 2024-09-06 152653](https://github.com/user-attachments/assets/6b1d05e2-3603-4e57-bad0-f48277395526)

  </li>
      <li>
      Update:
      
   ```sh
    UPDATE `Actions` SET name = 'nombre', description = 'descripcion' WHERE id = 8; 
   ```
  </li>
      <li>
      Delete:
      
   ```sh
    DELETE FROM `Actions` WHERE id<10;
   ```
  </li>
  </ul>
</details>

<!--
```plaintext

└── 
    └── 
        └── 
            ├── 
            |    └── 
            ├── 
            |      └── 
            ├── 
            |  └── 
            |
            ├── 
            └── 
```
-->

<p align="right">(<a href="#readme-top">Volver al inicio</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributors-url]: https://github.com/othneildrew/Best-README-Template/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=for-the-badge
[forks-url]: https://github.com/othneildrew/Best-README-Template/network/members
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=for-the-badge
[stars-url]: https://github.com/othneildrew/Best-README-Template/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=for-the-badge
[issues-url]: https://github.com/othneildrew/Best-README-Template/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[product-screenshot]: images/screenshot.png

[JavaScript.com]: https://img.shields.io/badge/JavaScript-F7DF1E?logo=javascript&logoColor=white&style=for-the-badge
[JavaScript-url]: https://developer.mozilla.org/en-US/docs/Web/JavaScript

[CSS.com]: https://img.shields.io/badge/CSS-1572B6?logo=css3&logoColor=white&style=for-the-badge
[CSS-url]: https://developer.mozilla.org/en-US/docs/Web/CSS

[HTML.com]: https://img.shields.io/badge/HTML-E34F26?logo=html5&logoColor=white&style=for-the-badge
[HTML-url]: https://developer.mozilla.org/en-US/docs/Web/HTML

[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?logo=bootstrap&logoColor=white&style=for-the-badge
[Bootstrap-url]: https://getbootstrap.com

[AOS.com]: https://img.shields.io/badge/AOS-000000?logo=aos&logoColor=white&style=for-the-badge
[AOS-url]: https://michalsnik.github.io/aos/

[SweetAlert.com]: https://img.shields.io/badge/SweetAlert-0078D7?logo=sweetalert&logoColor=white&style=for-the-badge
[SweetAlert-url]: https://sweetalert.js.org/

[GitHub.com]: https://img.shields.io/badge/GitHub-181717?logo=github&logoColor=white&style=for-the-badge
[GitHub-url]: https://github.com/

[Git.com]: https://img.shields.io/badge/Git-F05032?logo=git&logoColor=white&style=for-the-badge
[Git-url]: https://git-scm.com/

[GitHubPages.com]: https://img.shields.io/badge/GitHub_Pages-222?logo=github&logoColor=white&style=for-the-badge
[GitHubPages-url]: https://pages.github.com/

[VSCode.com]: https://img.shields.io/badge/VSCode-007ACC?logo=visual-studio-code&logoColor=white&style=for-the-badge
[VSCode-url]: https://code.visualstudio.com/

[LiveServer.com]: https://img.shields.io/badge/LiveServer-4993CD?logo=visual-studio-code&logoColor=white&style=for-the-badge
[LiveServer-url]: https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer
