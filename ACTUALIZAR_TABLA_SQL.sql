-- ===============================================================
-- SCRIPT PARA ACTUALIZAR LA TABLA "Reservas" EN SQL SERVER
-- Ejecutar en: SQL Server Management Studio
-- Base de datos: EvenDoDB
-- ===============================================================

-- Verificar si la tabla existe y modificarla
IF OBJECT_ID('[dbo].[Reservas]', 'U') IS NOT NULL
BEGIN
    -- Columnas
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Reservas' AND COLUMN_NAME = 'Telefono')
        ALTER TABLE Reservas ADD Telefono NVARCHAR(20);
    
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Reservas' AND COLUMN_NAME = 'Email')
        ALTER TABLE Reservas ADD Email NVARCHAR(100);
    
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Reservas' AND COLUMN_NAME = 'ServicioAdicional')
        ALTER TABLE Reservas ADD ServicioAdicional NVARCHAR(255) DEFAULT 'Ninguno';
    
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Reservas' AND COLUMN_NAME = 'CostoAdicional')
        ALTER TABLE Reservas ADD CostoAdicional DECIMAL(10, 2) DEFAULT 0;
    
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Reservas' AND COLUMN_NAME = 'MontoTotal')
        ALTER TABLE Reservas ADD MontoTotal DECIMAL(10, 2);
    
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Reservas' AND COLUMN_NAME = 'MontoInicial')
        ALTER TABLE Reservas ADD MontoInicial DECIMAL(10, 2);
    
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Reservas' AND COLUMN_NAME = 'Estado')
        ALTER TABLE Reservas ADD Estado NVARCHAR(50) DEFAULT 'Pendiente';
    
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Reservas' AND COLUMN_NAME = 'FechaRegistro')
        ALTER TABLE Reservas ADD FechaRegistro DATETIME2 DEFAULT GETDATE();
    
    PRINT 'Tabla Reservas actualizada correctamente.';
END
ELSE
BEGIN
    -- Tablas
    CREATE TABLE [dbo].[Reservas] (
        [Id] INT PRIMARY KEY IDENTITY(1,1),
        [Nombre] NVARCHAR(100) NOT NULL,
        [Apellido] NVARCHAR(100),
        [Email] NVARCHAR(100),
        [Telefono] NVARCHAR(20),
        [Paquete] NVARCHAR(100) NOT NULL,
        [LugarEvento] NVARCHAR(255),
        [FechaEvento] DATE,
        [MontoInicial] DECIMAL(10, 2),
        [ServicioAdicional] NVARCHAR(255) DEFAULT 'Ninguno',
        [CostoAdicional] DECIMAL(10, 2) DEFAULT 0,
        [MontoTotal] DECIMAL(10, 2),
        [Estado] NVARCHAR(50) DEFAULT 'Pendiente',
        [FechaRegistro] DATETIME2 DEFAULT GETDATE(),
        [MetodoPago] NVARCHAR(50)
    );
    
    PRINT 'Tabla Reservas creada correctamente.';
END

-- Mostrar la estructura actual de la tabla
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Reservas' ORDER BY ORDINAL_POSITION;
