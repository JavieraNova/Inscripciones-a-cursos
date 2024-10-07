-- Inserta al menos cinco nuevos estudiantes en la tabla «estudiantes».
INSERT INTO estudiantes (nombre, edad) VALUES
('Diego Nova', 20),
('Muriel Sanchez', 22),
('Cristina García', 19),
('Elena Aguayo', 21),
('Ana Toro', 23);

SELECT * 
FROM estudiantes;

-- Inserta al menos cuatro nuevos cursos en la tabla «cursos».
INSERT INTO cursos (nombre, duracion) VALUES
('Curso de Programación', '3 meses'),
('Curso de Diseño Gráfico', '2 meses'),
('Curso de Marketing Digital', '4 meses'),
('Curso de Fotografía', '1 mes');


SELECT * 
FROM cursos;

-- Asociar a cuatro de los estudiantes a al menos dos de los cursos dados de alta.
INSERT INTO inscripciones (id_estudiante, id_curso) VALUES
(1, 1), -- Diego en Curso de Programación
(1, 2), -- Diego en Curso de Diseño Gráfico
(2, 1), -- Muriel en Curso de Programación
(3, 3), -- Cristina en Curso de Marketing Digital
(4, 2), -- Elena en Curso de Diseño Gráfico
(5, 4); -- Ana en Curso de Fotografía

SELECT * 
FROM inscripciones;

-- Proyecta a todos los estudiantes y sus respectivos cursos.
SELECT estudiantes.nombre AS estudiante, cursos.nombre AS curso
FROM estudiantes
LEFT JOIN inscripciones ON estudiantes.id = inscripciones.id_estudiante
LEFT JOIN cursos ON inscripciones.id_curso = cursos.id;

-- Proyecta todos los estudiantes que están inscritos en un curso específico.
SELECT estudiantes.nombre
FROM estudiantes
JOIN inscripciones ON estudiantes.id = inscripciones.id_estudiante
JOIN cursos ON inscripciones.id_curso = cursos.id
WHERE cursos.nombre = 'Curso de Programación';

-- Proyecta todos los cursos en los que está inscrito un estudiante específico.
SELECT cursos.nombre
FROM cursos
JOIN inscripciones ON cursos.id = inscripciones.id_curso
JOIN estudiantes ON inscripciones.id_estudiante = estudiantes.id
WHERE estudiantes.nombre = 'Diego Nova';

-- Cuenta el número de estudiantes inscritos en cada curso.
SELECT cursos.nombre, COUNT(inscripciones.id_estudiante) AS num_estudiantes
FROM cursos
LEFT JOIN inscripciones ON cursos.id = inscripciones.id_curso
GROUP BY cursos.nombre;

-- Encuentra los estudiantes que no están inscritos en ningún curso.
SELECT estudiantes.nombre
FROM estudiantes
LEFT JOIN inscripciones ON estudiantes.id = inscripciones.id_estudiante
WHERE inscripciones.id_estudiante IS NULL;








