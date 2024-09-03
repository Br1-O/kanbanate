USE sql10728873;

INSERT INTO `Status_area`(name, description) 
VALUES ('activa', 'El area está actualmente funcional.'), 
('inactiva', 'El area se encuentra temporalmente fuera de funcionamiento.'),
('archivada', 'El area no está en funcionamiento y se encuentra archivada sólo para registros historicos'),
('bajo revisión', 'El area está funcional, pero está siendo evaluada para su futuro uso o reestructuración.'),
('planificada', 'El area está siendo planificada para su futura implementación.'), 
('cerrada', 'El area fue cerrada de forma permanente.');

INSERT INTO `Status_group`(name, description) 
VALUES ('disponible', 'El grupo se encuentra disponible para trabajar en una nueva tarea.'), 
('ocupado', 'El grupo está actualmente trabajando en una tarea.'),
('limitado', 'El grupo se encuentra disponible, pero con una cantidad inferior de miembros'),
('bajo reestructuración', 'El grupo no está disponible, ya que está en busqueda de nuevos miembros'),
('no disponible', 'El grupo temporalmente no está disponible ni trabajando en ninguna tarea.'), 
('disuelto', 'El grupo fue disuelto permanentemente.');

INSERT INTO `Status_employee`(name, description) 
VALUES ('disponible', 'El empleado se encuentra disponible para trabajar en una nueva tarea.'), 
('ocupado', 'El empleado está actualmente trabajando en una tarea.'),
('de vacaciones', 'El empleado está de vacaciones.'), 
('con licencia', 'El empleado está bajo algún tipo de licencia.'), 
('no disponible', 'El empleado temporalmente no está disponible ni trabajando en ninguna tarea.'), 
('retirado', 'El empleado ya no se encuentra trabajando en la organización.');

INSERT INTO `Status_task`(name, description) 
VALUES ('recién asignada', 'La tarea fue recién asignada.'), 
('en resolución', 'La tarea ya fue asignada y está siendo resuelta.'),
('completa', 'La tarea ya fue resuelta.'), 
('cancelada', 'La tarea fue cancelada y ya no se requiere su resolución.'), 
('archivada', 'La tarea fue resuelta hace más de 30 días y se archivó para registro historico.');

INSERT INTO `Relation_types`(name, description) 
VALUES ('recién asignada', 'El usuario tiene la tarea asignada.'), 
('bajo resolución', 'El usuario está trabajando en la tarea.'),
('completa', 'La tarea ya fue resuelta por el usuario.'), 
('cancelada', 'La tarea fue cancelada por el usuario.'), 
('archivada', 'La tarea fue resuelta hace más de 30 días y el usuario la archivó para registro historico.'),
('Modificada', 'El usuario editó el estado o algún campo de la tarea.');

INSERT INTO `Actions`(name, description) 
VALUES ('Creado', 'El usuario creó la entidad.'), 
('Modificado', 'El usuario modificó la entidad.'),
('Eliminado', 'El usuario eliminó la entidad.'), 
('Archivado', 'El usuario archivó la entidad.'), 
('Asignado', 'El usuario asignó la entidad.');