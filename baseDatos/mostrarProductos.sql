delete procedure sp_InsertProductoCompleto

DECLARE @ImagenesProductos TABLE (
    cRutaImagen NVARCHAR(255),
    bEsPrincipal BIT
);
ALTER PROCEDURE sp_InsertProductoCompleto
    @NombreProducto NVARCHAR(150),
    @Descripcion NVARCHAR(MAX),
    @IdCategoria INT,
    @IdTemporada INT,
    @EsNuevo BIT,
    @PrecioBase DECIMAL(10, 2),
    @PrecioDescuento DECIMAL(10, 2) = NULL, -- Precio con descuento (opcional)
    @Stock INT,
    @Talla INT,
    @ImagenesProductos AS TABLE ( -- Aquí defines la tabla en el procedimiento
        cRutaImagen NVARCHAR(255),
        bEsPrincipal BIT
    ) -- Tabla de imágenes (ruta y si es principal)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Insertar producto
        INSERT INTO Productos (cNombreProducto, cDescripcion, idCategoria, idTemporada, bEsNuevo, dFechaCreacion)
        VALUES (@NombreProducto, @Descripcion, @IdCategoria, @IdTemporada, @EsNuevo, GETDATE());

        DECLARE @IdProducto INT = SCOPE_IDENTITY();

        -- Insertar precio base y, si aplica, precio con descuento
        INSERT INTO Precios (idProducto, fPrecioBase, fPrecioDescuento, bEsActivo)
        VALUES (@IdProducto, @PrecioBase, @PrecioDescuento, 1);

        -- Insertar inventario
        INSERT INTO Inventario (idProducto, idTalla, Stock)
        VALUES (@IdProducto, @Talla, @Stock);

        -- Insertar imágenes (hasta dos)
        INSERT INTO ImagenesProductos (idProducto, cRutaImagen, bEsPrincipal, dFechaCreacion)
        SELECT @IdProducto, cRutaImagen, bEsPrincipal, GETDATE()
        FROM @ImagenesProductos;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

---datos:

-- Insertar Pantalón Casual
EXEC sp_InsertProductoCompleto
    @NombreProducto = 'Pantalón Casual',
    @Descripcion = 'Pantalón para uso diario.',
    @IdCategoria = 1,
    @IdTemporada = 1, -- Verano
    @EsNuevo = 1, -- True
    @PrecioBase = 120.00,
    @Stock = 6,
    @Talla = 2; -- M

-- Insertar Blusa Floral
EXEC sp_InsertProductoCompleto
    @NombreProducto = 'Blusa Floral',
    @Descripcion = 'Blusa con estampado floral.',
    @IdCategoria = 2,
    @IdTemporada = 2, -- Primavera
    @EsNuevo = 1, -- True
    @PrecioBase = 90.00,
    @Stock = 6,
    @Talla = 3; -- L

-- Insertar Casaca de Invierno
EXEC sp_InsertProductoCompleto
    @NombreProducto = 'Casaca de Invierno',
    @Descripcion = 'Casaca acolchada para bajas temperaturas.',
    @IdCategoria = 3,
    @IdTemporada = 3, -- Invierno
    @EsNuevo = 0, -- False
    @PrecioBase = 250.00,
    @Stock = 6,
    @Talla = 1; -- S

-- Insertar Blusa Elegante
EXEC sp_InsertProductoCompleto
    @NombreProducto = 'Blusa Elegante',
    @Descripcion = 'Blusa formal para eventos.',
    @IdCategoria = 2,
    @IdTemporada = 2, -- Primavera
    @EsNuevo = 0, -- False
    @PrecioBase = 150.00,
    @Stock = 6,
    @Talla = 2; -- M


	


	--MOSTRAR LOS TODOS LOS PRODUCTOS CON DESCEUNTO
CREATE PROCEDURE sp_MostrarProductosConDescuento
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        p.idProducto,
        p.cNombreProducto,
        p.cDescripcion,
        cat.cNombreCategoria AS Categoria,
        t.cNombreTalla AS Talla,
        pr.fPrecioBase AS PrecioBase,
        ISNULL(pr.fPrecioDescuento, pr.fPrecioBase) AS PrecioConDescuento,
        CASE 
            WHEN pr.fPrecioDescuento IS NOT NULL THEN 
                CAST((pr.fPrecioBase - pr.fPrecioDescuento) * 100.0 / pr.fPrecioBase AS DECIMAL(5, 2))
            ELSE 0
        END AS DescuentoPorcentaje,
        img.cRutaImagen AS Imagen1,
        img2.cRutaImagen AS Imagen2
    FROM 
        Productos p
    INNER JOIN 
        Categorias cat ON p.idCategoria = cat.idCategoria
    LEFT JOIN 
        Inventario inv ON p.idProducto = inv.idProducto
    LEFT JOIN 
        Tallas t ON inv.idTalla = t.idTalla
    LEFT JOIN 
        Precios pr ON p.idProducto = pr.idProducto AND pr.bEsActivo = 1
    LEFT JOIN 
        ImagenesProductos img ON p.idProducto = img.idProducto AND img.bEsPrincipal = 1
    LEFT JOIN 
        ImagenesProductos img2 ON p.idProducto = img2.idProducto AND img2.bEsPrincipal = 0
    WHERE 
        pr.fPrecioDescuento IS NOT NULL -- Mostrar solo productos con descuento
    ORDER BY 
        p.cNombreProducto;
END;
GO

EXEC sp_MostrarProductosConDescuento;


--PRODUCTOS NUEVOS
ALTER PROCEDURE sp_MostrarProductosNews
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        p.idProducto,
        p.cNombreProducto,
        p.cDescripcion,
        cat.cNombreCategoria AS Categoria,
        t.cNombreTalla AS Talla,
        pr.fPrecioBase AS PrecioBase,  -- Solo mostramos el precio base
        CASE 
            WHEN pr.fPrecioDescuento IS NOT NULL THEN 
                ISNULL(pr.fPrecioDescuento, pr.fPrecioBase)  -- Solo si tiene descuento, mostrar precio con descuento
            ELSE NULL
        END AS PrecioConDescuento,  -- Dejar en NULL para los productos nuevos
        CASE 
            WHEN pr.fPrecioDescuento IS NOT NULL THEN 
                CAST((pr.fPrecioBase - pr.fPrecioDescuento) * 100.0 / pr.fPrecioBase AS DECIMAL(5, 2))
            ELSE 0
        END AS DescuentoPorcentaje,
        img.cRutaImagen AS Imagen1,
        img2.cRutaImagen AS Imagen2
    FROM 
        Productos p
    INNER JOIN 
        Categorias cat ON p.idCategoria = cat.idCategoria
    LEFT JOIN 
        Inventario inv ON p.idProducto = inv.idProducto
    LEFT JOIN 
        Tallas t ON inv.idTalla = t.idTalla
    LEFT JOIN 
        Precios pr ON p.idProducto = pr.idProducto AND pr.bEsActivo = 1
    LEFT JOIN 
        ImagenesProductos img ON p.idProducto = img.idProducto AND img.bEsPrincipal = 1
    LEFT JOIN 
        ImagenesProductos img2 ON p.idProducto = img2.idProducto AND img2.bEsPrincipal = 0
    WHERE 
        p.bEsNuevo = 1  -- Mostrar solo productos nuevos
    ORDER BY 
        p.cNombreProducto;
END;
GO

EXEC sp_MostrarProductosNews;




--TODOS LOSPRODUCTOS

CREATE PROCEDURE sp_MostrarTodosLosProductos
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        p.idProducto,
        p.cNombreProducto,
        p.cDescripcion,
        cat.cNombreCategoria AS Categoria,
        t.cNombreTalla AS Talla,
        pr.fPrecioBase AS PrecioBase,
        ISNULL(pr.fPrecioDescuento, pr.fPrecioBase) AS PrecioFinal,
        CASE 
            WHEN pr.fPrecioDescuento IS NOT NULL THEN 
                CAST((pr.fPrecioBase - pr.fPrecioDescuento) * 100.0 / pr.fPrecioBase AS DECIMAL(5, 2))
            ELSE 0
        END AS DescuentoPorcentaje,
        img.cRutaImagen AS Imagen1,
        img2.cRutaImagen AS Imagen2,
        p.bEsNuevo AS EsNuevo
    FROM 
        Productos p
    INNER JOIN 
        Categorias cat ON p.idCategoria = cat.idCategoria
    LEFT JOIN 
        Inventario inv ON p.idProducto = inv.idProducto
    LEFT JOIN 
        Tallas t ON inv.idTalla = t.idTalla
    LEFT JOIN 
        Precios pr ON p.idProducto = pr.idProducto AND pr.bEsActivo = 1
    LEFT JOIN 
        ImagenesProductos img ON p.idProducto = img.idProducto AND img.bEsPrincipal = 1
    LEFT JOIN 
        ImagenesProductos img2 ON p.idProducto = img2.idProducto AND img2.bEsPrincipal = 0
    ORDER BY 
        p.cNombreProducto;
END;
GO

EXEC sp_MostrarTodosLosProductos;