-- 1. Crear la tabla Temporadas
CREATE TABLE Temporadas (
    idTemporada INT IDENTITY(1,1) PRIMARY KEY,
    cNombreTemporada VARCHAR(50) NOT NULL,
    cDescripcion VARCHAR(255) NULL
);


ALTER TABLE Productos 
ADD idTemporada INT;

ALTER TABLE Productos 
ADD CONSTRAINT fk_temporada_producto FOREIGN KEY (idTemporada) REFERENCES Temporadas(idTemporada);


INSERT INTO Temporadas (cNombreTemporada, cDescripcion) 
VALUES 
    ('Verano', 'Productos ideales para climas cálidos'),
    ('Invierno', 'Productos para proteger del frío'),
    ('Primavera', 'Productos ligeros y coloridos');

-- 1. Insertar categorías
INSERT INTO Categorias (cNombreCategoria, cDescripcion) 
VALUES 
    ('Pantalones', 'Ropa inferior para hombre y mujer'),
    ('Blusas', 'Prendas femeninas superiores'),
    ('Casacas', 'Abrigos de distintas temporadas');

-- 2. Insertar productos (8 nuevos y 4 con descuento)
-- Pantalones

select * from Productos


INSERT INTO Productos (cNombreProducto, cDescripcion, idCategoria, bEsNuevo, dFechaCreacion, idTemporada)
VALUES 
-- Pantalones
('Jean Slim Fit', 'Pantalón casual con diseño moderno', 1, 1, GETDATE(), 1),
('Pantalón Deportivo', 'Cómodo para actividades físicas', 1, 1, GETDATE(), 1),
('Jean Regular', 'Estilo clásico y versátil', 1, 1, GETDATE(), 3),
('Pantalón Formal', 'Para ocasiones especiales', 1, 0, GETDATE(), 2),

-- Blusas
('Blusa Floral', 'Diseño elegante con estampado floral', 2, 1, GETDATE(), 3),
('Blusa Casual', 'Blusa ligera para uso diario', 2, 1, GETDATE(), 3),
('Blusa Elegante', 'Para eventos formales', 2, 0, GETDATE(), 3),
('Blusa de Encaje', 'Estilo romántico y sofisticado', 2, 0, GETDATE(), 3),

-- Casacas
('Casaca de Cuero', 'Abrigo moderno de cuero', 3, 1, GETDATE(), 1),
('Casaca Deportiva', 'Ideal para entrenamientos', 3, 1, GETDATE(), 1),
('Casaca Acolchada', 'Perfecta para el invierno', 3, 1, GETDATE(), 2),
('Casaca de Jean', 'Casual y versátil', 3, 0, GETDATE(), 2);


INSERT INTO Precios (idProducto, fPrecioBase, fPrecioDescuento, bEsActivo) 
VALUES 
    (1, 60.00, NULL, 1), -- Sin descuento
    (2, 45.00, NULL, 1), -- Sin descuento
    (3, 55.00, NULL, 1), -- Sin descuento
    (4, 80.00, 56.00, 1); -- Con descuento (30%)

-- Blusas
INSERT INTO Precios (idProducto, fPrecioBase, fPrecioDescuento, bEsActivo) 
VALUES 
    (5, 50.00, NULL, 1), -- Sin descuento
    (6, 40.00, NULL, 1), -- Sin descuento
    (7, 70.00, 49.00, 1), -- Con descuento (30%)
    (8, 60.00, 42.00, 1); -- Con descuento (30%)

-- Casacas
INSERT INTO Precios (idProducto, fPrecioBase, fPrecioDescuento, bEsActivo) 
VALUES 
    (9, 120.00, NULL, 1), -- Sin descuento
    (10, 80.00, NULL, 1), -- Sin descuento
    (11, 150.00, NULL, 1), -- Sin descuento
    (12, 100.00, 70.00, 1); -- Con descuento (30%)

-- 4. Insertar tallas
INSERT INTO Tallas (cNombreTalla) 
VALUES 
    ('S'), 
    ('M'), 
    ('L');

-- 5. Insertar imágenes para cada producto (2 imágenes por producto)
-- Nota: Ajusta las rutas según sea necesario
INSERT INTO ImagenesProductos (idProducto, cRutaImagen, bEsPrincipal) 
VALUES 
    (1, 'images/producto1_img1.jpg', 1), 
    (1, 'images/producto1_img2.jpg', 0),
    (2, 'images/producto2_img1.jpg', 1), 
    (2, 'images/producto2_img2.jpg', 0),
    (3, 'images/producto3_img1.jpg', 1), 
    (3, 'images/producto3_img2.jpg', 0),
    (4, 'images/producto4_img1.jpg', 1), 
    (4, 'images/producto4_img2.jpg', 0),
    (5, 'images/producto5_img1.jpg', 1), 
    (5, 'images/producto5_img2.jpg', 0),
    (6, 'images/producto6_img1.jpg', 1), 
    (6, 'images/producto6_img2.jpg', 0),
    (7, 'images/producto7_img1.jpg', 1), 
    (7, 'images/producto7_img2.jpg', 0),
    (8, 'images/producto8_img1.jpg', 1), 
    (8, 'images/producto8_img2.jpg', 0),
    (9, 'images/producto9_img1.jpg', 1), 
    (9, 'images/producto9_img2.jpg', 0),
    (10, 'images/producto10_img1.jpg', 1), 
    (10, 'images/producto10_img2.jpg', 0),
    (11, 'images/producto11_img1.jpg', 1), 
    (11, 'images/producto11_img2.jpg', 0),
    (12, 'images/producto12_img1.jpg', 1), 
    (12, 'images/producto12_img2.jpg', 0);

	
	INSERT INTO Inventario (idProducto, idTalla, Stock)
VALUES
-- Producto 1: Jean Slim Fit
(1, 1, 6), -- Talla S
(1, 2, 6), -- Talla M
(1, 3, 6), -- Talla L

-- Producto 2: Pantalón Deportivo
(2, 1, 6),
(2, 2, 6),
(2, 3, 6),

-- Producto 3: Jean Regular
(3, 1, 6),
(3, 2, 6),
(3, 3, 6),

-- Producto 4: Pantalón Formal
(4, 1, 6),
(4, 2, 6),
(4, 3, 6),

-- Producto 5: Blusa Floral
(5, 1, 6),
(5, 2, 6),
(5, 3, 6),

-- Producto 6: Blusa Casual
(6, 1, 6),
(6, 2, 6),
(6, 3, 6),

-- Producto 7: Blusa Elegante
(7, 1, 6),
(7, 2, 6),
(7, 3, 6),

-- Producto 8: Blusa de Encaje
(8, 1, 6),
(8, 2, 6),
(8, 3, 6),

-- Producto 9: Casaca de Cuero
(9, 1, 6),
(9, 2, 6),
(9, 3, 6),

-- Producto 10: Casaca Deportiva
(10, 1, 6),
(10, 2, 6),
(10, 3, 6),

-- Producto 11: Casaca Acolchada
(11, 1, 6),
(11, 2, 6),
(11, 3, 6),

-- Producto 12: Casaca de Jean
(12, 1, 6),
(12, 2, 6),
(12, 3, 6);

