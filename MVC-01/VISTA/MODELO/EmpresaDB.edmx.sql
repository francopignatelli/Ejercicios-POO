
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/30/2022 11:33:54
-- Generated from EDMX file: D:\Visual Studio\Proyectos\II AÑO\Practica-Ej01-MVC\MVC-01\MODELO\EmpresaDB.edmx
-- --------------------------------------------------

--ACA BORRE TODO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'EmpresaSet'
CREATE TABLE [dbo].[EmpresaSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ClienteSet'
CREATE TABLE [dbo].[ClienteSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nombre] nvarchar(max)  NOT NULL,
    [edad] nvarchar(max)  NOT NULL,
    [telefono] nvarchar(max)  NOT NULL,
    [Empresa_Id] int  NOT NULL
);
GO

-- Creating table 'EmpleadoSet'
CREATE TABLE [dbo].[EmpleadoSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nombre] nvarchar(max)  NOT NULL,
    [edad] nvarchar(max)  NOT NULL,
    [salario] nvarchar(max)  NOT NULL,
    [categoria] nvarchar(max)  NOT NULL,
    [Empresa_Id] int  NOT NULL,
    [Categoria_Id] int  NOT NULL
);
GO

-- Creating table 'CategoriaSet'
CREATE TABLE [dbo].[CategoriaSet] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'EmpleadoEmpleado'
CREATE TABLE [dbo].[EmpleadoEmpleado] (
    [Superior_Id] int  NOT NULL,
    [Subordinado_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'EmpresaSet'
ALTER TABLE [dbo].[EmpresaSet]
ADD CONSTRAINT [PK_EmpresaSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ClienteSet'
ALTER TABLE [dbo].[ClienteSet]
ADD CONSTRAINT [PK_ClienteSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EmpleadoSet'
ALTER TABLE [dbo].[EmpleadoSet]
ADD CONSTRAINT [PK_EmpleadoSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CategoriaSet'
ALTER TABLE [dbo].[CategoriaSet]
ADD CONSTRAINT [PK_CategoriaSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Superior_Id], [Subordinado_Id] in table 'EmpleadoEmpleado'
ALTER TABLE [dbo].[EmpleadoEmpleado]
ADD CONSTRAINT [PK_EmpleadoEmpleado]
    PRIMARY KEY CLUSTERED ([Superior_Id], [Subordinado_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Empresa_Id] in table 'ClienteSet'
ALTER TABLE [dbo].[ClienteSet]
ADD CONSTRAINT [FK_EmpresaClientes]
    FOREIGN KEY ([Empresa_Id])
    REFERENCES [dbo].[EmpresaSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmpresaClientes'
CREATE INDEX [IX_FK_EmpresaClientes]
ON [dbo].[ClienteSet]
    ([Empresa_Id]);
GO

-- Creating foreign key on [Empresa_Id] in table 'EmpleadoSet'
ALTER TABLE [dbo].[EmpleadoSet]
ADD CONSTRAINT [FK_EmpresaEmpleados]
    FOREIGN KEY ([Empresa_Id])
    REFERENCES [dbo].[EmpresaSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmpresaEmpleados'
CREATE INDEX [IX_FK_EmpresaEmpleados]
ON [dbo].[EmpleadoSet]
    ([Empresa_Id]);
GO

-- Creating foreign key on [Superior_Id] in table 'EmpleadoEmpleado'
ALTER TABLE [dbo].[EmpleadoEmpleado]
ADD CONSTRAINT [FK_EmpleadoEmpleado_Empleado]
    FOREIGN KEY ([Superior_Id])
    REFERENCES [dbo].[EmpleadoSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Subordinado_Id] in table 'EmpleadoEmpleado'
ALTER TABLE [dbo].[EmpleadoEmpleado]
ADD CONSTRAINT [FK_EmpleadoEmpleado_Empleado1]
    FOREIGN KEY ([Subordinado_Id])
    REFERENCES [dbo].[EmpleadoSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmpleadoEmpleado_Empleado1'
CREATE INDEX [IX_FK_EmpleadoEmpleado_Empleado1]
ON [dbo].[EmpleadoEmpleado]
    ([Subordinado_Id]);
GO

-- Creating foreign key on [Categoria_Id] in table 'EmpleadoSet'
ALTER TABLE [dbo].[EmpleadoSet]
ADD CONSTRAINT [FK_EmpleadoCategoria]
    FOREIGN KEY ([Categoria_Id])
    REFERENCES [dbo].[CategoriaSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmpleadoCategoria'
CREATE INDEX [IX_FK_EmpleadoCategoria]
ON [dbo].[EmpleadoSet]
    ([Categoria_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------