/* Relación tipo 1:1 */
-- PASO 1
-- Tu código aquí
CREATE TABLE usuarios (
id_usuario INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
edad INT
);

-- PASO 2
-- Tu código aquí
CREATE TABLE roles(
id_rol INT AUTO_INCREMENT PRIMARY KEY,
nombre_rol VARCHAR(50) NOT NULL
);

-- PASO 3
-- Tu código aquí
ALTER TABLE usuarios ADD COLUMN id_rol INT;

UPDATE usuarios SET id_rol = 3 WHERE id_usuario = 1;
UPDATE usuarios SET id_rol = 4 WHERE id_usuario = 2;
UPDATE usuarios SET id_rol = 3 WHERE id_usuario = 3;
UPDATE usuarios SET id_rol = 2 WHERE id_usuario = 4;
UPDATE usuarios SET id_rol = 2 WHERE id_usuario = 5;
UPDATE usuarios SET id_rol = 1 WHERE id_usuario = 6;
UPDATE usuarios SET id_rol = 2 WHERE id_usuario = 7;
UPDATE usuarios SET id_rol = 1 WHERE id_usuario = 8;
UPDATE usuarios SET id_rol = 1 WHERE id_usuario = 9;
UPDATE usuarios SET id_rol = 1 WHERE id_usuario = 10;
UPDATE usuarios SET id_rol = 4 WHERE id_usuario = 11;
UPDATE usuarios SET id_rol = 3 WHERE id_usuario = 12;
UPDATE usuarios SET id_rol = 3 WHERE id_usuario = 13;
UPDATE usuarios SET id_rol = 4 WHERE id_usuario = 14;
UPDATE usuarios SET id_rol = 2 WHERE id_usuario = 15;
UPDATE usuarios SET id_rol = 4 WHERE id_usuario = 16;
UPDATE usuarios SET id_rol = 3 WHERE id_usuario = 17;
UPDATE usuarios SET id_rol = 2 WHERE id_usuario = 18;
UPDATE usuarios SET id_rol = 1 WHERE id_usuario = 19;
UPDATE usuarios SET id_rol = 4 WHERE id_usuario = 20;


-- PASO 4
-- Tu código aquí
SELECT usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol
FROM usuarios
JOIN roles ON usuarios.id_rol = roles.id_rol ORDER BY id_usuario;

/* Relación tipo 1:N */
-- PASO 1
-- Tu código aquí
CREATE TABLE categorias(
id_categoria INT AUTO_INCREMENT PRIMARY KEY,
nombre_categoria VARCHAR(100) NOT NULL
);

-- PASO 2
-- Tu código aquí
ALTER TABLE usuarios ADD COLUMN id_categoria INT;

-- PASO 3
-- Tu código aquí
UPDATE usuarios SET id_categoria = 2 WHERE id_usuario IN (3, 11, 14, 16);
UPDATE usuarios SET id_categoria = 3 WHERE id_usuario IN (2, 6, 12, 18);
UPDATE usuarios SET id_categoria = 4 WHERE id_usuario IN (8, 10, 13);
UPDATE usuarios SET id_categoria = 5 WHERE id_usuario IN (7, 17, 18, 20);
UPDATE usuarios SET id_categoria = 6 WHERE id_usuario IN (2, 15, 16);
UPDATE usuarios SET id_categoria = 7 WHERE id_usuario IN (9, 10, 12, 18);
UPDATE usuarios SET id_categoria = 8 WHERE id_usuario IN (4, 6, 11, 17);
UPDATE usuarios SET id_categoria = 9 WHERE id_usuario IN (3, 5, 7, 13);
UPDATE usuarios SET id_categoria = 10 WHERE id_usuario IN (1, 2, 9, 12, 19);

-- PASO 4
-- Tu código aquí
SELECT usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol, categorias.nombre_categoria
FROM usuarios
JOIN roles ON usuarios.id_rol = roles.id_rol
JOIN categorias ON usuarios.id_categoria = categorias.id_categoria ORDER BY usuarios.id_usuario;

/* Relación tipo N:M */
-- PASO 1
-- Tu código aquí

CREATE TABLE usuarios_categorias(
id_usuario_categoria INT AUTO_INCREMENT PRIMARY KEY,
id_usuario INT,
id_categoria INT
);

ALTER TABLE usuarios_categorias ADD FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario);
ALTER TABLE usuarios_categorias ADD FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria);

-- PASO 2
-- Tu código aquí
INSERT INTO usuarios_categorias (id_usuario, id_categoria) VALUES
(1, 1), (2, 1), (3, 2),
(4, 3), (5, 3),
(6, 4), (7, 6),
(8, 6), (9, 5), (10, 5),
(11, 5), (12, 8), (13, 8), 
(14, 7), (15, 9),
(16, 10), (17, 10), (18, 9), (19, 7), (20, 6);

-- PASO 3
-- Tu código aquí

SELECT usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad,
roles.nombre_rol, categorias.nombre_categoria
FROM usuarios
JOIN usuarios_categorias ON usuarios_categorias.id_usuario = usuarios.id_usuario
JOIN categorias ON usuarios_categorias.id_categoria = categorias.id_categoria
JOIN roles ON usuarios.id_rol = roles.id_rol