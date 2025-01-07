
ALTER DATABASE ELROI SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
drop database  ELROI

create database ELROI


CREATE TABLE Usuarios (
    idUsuario INT PRIMARY KEY IDENTITY(1,1),
    cNombre NVARCHAR(100) NOT NULL,
    cApellido NVARCHAR(100) NOT NULL,
    cEmail NVARCHAR(150) UNIQUE NOT NULL,
    cContraseña NVARCHAR(255) NULL,
    cDirección NVARCHAR(255) NULL,
    cTeléfono NVARCHAR(15) NULL,
    dFechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Roles (
    idRol INT PRIMARY KEY IDENTITY(1,1),
    cNombreRol NVARCHAR(50) NOT NULL
);

CREATE TABLE UsuariosRoles (
    idUsuarioRol INT PRIMARY KEY IDENTITY(1,1),
    idUsuario INT NOT NULL,
    idRol INT NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES Usuarios(idUsuario),
    FOREIGN KEY (idRol) REFERENCES Roles(idRol)
);


CREATE TABLE Categorias (
    idCategoria INT PRIMARY KEY IDENTITY(1,1),
    cNombreCategoria NVARCHAR(100) NOT NULL,
    cDescripcion NVARCHAR(255) NULL
);

CREATE TABLE Productos (
    idProducto INT PRIMARY KEY IDENTITY(1,1),
    cNombreProducto NVARCHAR(150) NOT NULL,
    cDescripcion NVARCHAR(MAX) NULL,
    idCategoria INT NOT NULL,
    bEsNuevo BIT DEFAULT 1, -- Indica si es un producto nuevo
    dFechaCreacion DATETIME DEFAULT GETDATE(), -- Fecha de creación del producto
    FOREIGN KEY (idCategoria) REFERENCES Categorias(idCategoria)
);

CREATE TABLE ImagenesProductos (
    idImagen INT PRIMARY KEY IDENTITY(1,1),
    idProducto INT NOT NULL, -- Relación con el producto
    cRutaImagen NVARCHAR(255) NOT NULL, -- Ruta o URL de la imagen
    bEsPrincipal BIT DEFAULT 0, -- Indica si esta imagen es la principal del producto
    dFechaCreacion DATETIME DEFAULT GETDATE(), -- Fecha de creación de la imagen
    FOREIGN KEY (idProducto) REFERENCES Productos(idProducto)
);


CREATE TABLE Precios (
    idPrecio INT PRIMARY KEY IDENTITY(1,1),
    idProducto INT NOT NULL,
    fPrecioBase DECIMAL(10,2) NOT NULL, -- Precio original del producto
    fPrecioDescuento DECIMAL(10,2) NULL, -- Precio con descuento (NULL si no hay descuento)
    --dFechaInicio DATETIME DEFAULT GETDATE(),  Fecha de inicio del precio
    --dFechaFin DATETIME NULL, Fecha de fin del precio (NULL si el precio sigue activo)
    bEsActivo BIT DEFAULT 1, -- Indica si este precio está activo (1 = activo, 0 = inactivo)
    FOREIGN KEY (idProducto) REFERENCES Productos(idProducto)
);


CREATE TABLE Promociones (
    idPromocion INT PRIMARY KEY IDENTITY(1,1),
    cNombrePromocion NVARCHAR(100) NOT NULL,
    fDescuentoPorcentaje DECIMAL(5,2) NULL, -- Porcentaje de descuento (e.g., 15%)
    --FechaInicio DATETIME DEFAULT GETDATE(),
    --FechaFin DATETIME NULL,
    bEsActivo BIT DEFAULT 1 -- Indica si la promoción está activa
);


CREATE TABLE PromocionesProductos (
    idPromocionProducto INT PRIMARY KEY IDENTITY(1,1),
    idPromocion INT NOT NULL,
    idProducto INT NOT NULL,
    FOREIGN KEY (idPromocion) REFERENCES Promociones(idPromocion),
    FOREIGN KEY (idProducto) REFERENCES Productos(idProducto)
);


CREATE TABLE Tallas (
    idTalla INT PRIMARY KEY IDENTITY(1,1),
    cNombreTalla NVARCHAR(10) NOT NULL
);


CREATE TABLE Inventario (
    idInventario INT PRIMARY KEY IDENTITY(1,1),
    idProducto INT NOT NULL,
    idTalla INT NOT NULL,
    Stock INT NOT NULL DEFAULT 0,
    FOREIGN KEY (idTalla) REFERENCES Productos(idProducto),
    FOREIGN KEY (idTalla) REFERENCES Tallas(idTalla),
);

