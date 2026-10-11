CREATE DATABASE IF NOT EXISTS mi_mayor_bendicion;

USE mi_mayor_bendicion;

-- Tabla para registrar los proyectos
CREATE TABLE IF NOT EXISTS proyecto (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    fecha_inicio DATE
);

-- Tabla para registrar los avances
CREATE TABLE IF NOT EXISTS avance (
    id_avance INT AUTO_INCREMENT PRIMARY KEY,
    id_proyecto INT NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    fecha_avance DATE,
    estado VARCHAR(30),
    FOREIGN KEY (id_proyecto)
        REFERENCES proyecto(id_proyecto)
);

-- Registrar dos proyectos
INSERT INTO proyecto (nombre, descripcion, fecha_inicio)
VALUES

(
    'Mi hija, mi mayor bendicion',
    'Crear una pagina web para expresar el amor por mi hija',
    '2026-10-01'
),
(
    'Album de recuerdos familiares',
    'Organizar fotos y recuerdos de la familia',
    '2026-10-02'
);

-- Registrar cuatro avances
INSERT INTO avance
(id_proyecto, descripcion, fecha_avance, estado)
VALUES
(1, 'Definir el tema de la pagina web', '2026-10-03', 'Completado'),
(1, 'Preparar el contenido de la pagina', '2026-10-04', 'En proceso'),
(2, 'Seleccionar las fotografias familiares', '2026-10-05', 'Completado'),
(2, 'Organizar los recuerdos por fecha', '2026-10-06', 'Pendiente');

-- Consulta 1: mostrar todos los proyectos
SELECT * FROM proyecto;


-- Consulta 2: buscar proyectos por nombre
SELECT *
FROM proyecto
WHERE nombre LIKE '%hija%';

-- Consulta 3: mostrar los avances ordenados por fecha
SELECT *
FROM avance
ORDER BY fecha_avance ASC;

-- Consulta 4: relacionar proyectos y avances
SELECT
    proyecto.nombre AS nombre_proyecto,
    avance.descripcion AS descripcion_avance,
    avance.fecha_avance,
    avance.estado
FROM proyecto
INNER JOIN avance
    ON proyecto.id_proyecto = avance.id_proyecto
ORDER BY proyecto.id_proyecto, avance.fecha_avance;