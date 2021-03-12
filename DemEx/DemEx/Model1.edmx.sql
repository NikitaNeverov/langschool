
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/13/2021 03:28:31
-- Generated from EDMX file: C:\Users\nevni\source\repos\DemEx\DemEx\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [LanguageSchool];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_AttachedProduct_Product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AttachedProduct] DROP CONSTRAINT [FK_AttachedProduct_Product];
GO
IF OBJECT_ID(N'[dbo].[FK_AttachedProduct_Product1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AttachedProduct] DROP CONSTRAINT [FK_AttachedProduct_Product1];
GO
IF OBJECT_ID(N'[dbo].[FK_DocumentByService_ClientService]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DocumentByService] DROP CONSTRAINT [FK_DocumentByService_ClientService];
GO
IF OBJECT_ID(N'[dbo].[FK_Product_Manufacturer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_Manufacturer];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductPhoto_Product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductPhoto] DROP CONSTRAINT [FK_ProductPhoto_Product];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductSale_ClientService]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductSale] DROP CONSTRAINT [FK_ProductSale_ClientService];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductSale_Product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductSale] DROP CONSTRAINT [FK_ProductSale_Product];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductSale_Service]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductSale] DROP CONSTRAINT [FK_ProductSale_Service];
GO
IF OBJECT_ID(N'[dbo].[FK_TagOfClient_Client]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TagOfClient] DROP CONSTRAINT [FK_TagOfClient_Client];
GO
IF OBJECT_ID(N'[dbo].[FK_TagOfClient_Tag]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TagOfClient] DROP CONSTRAINT [FK_TagOfClient_Tag];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AttachedProduct]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AttachedProduct];
GO
IF OBJECT_ID(N'[dbo].[Client]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Client];
GO
IF OBJECT_ID(N'[dbo].[ClientService]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ClientService];
GO
IF OBJECT_ID(N'[dbo].[DocumentByService]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DocumentByService];
GO
IF OBJECT_ID(N'[dbo].[Gender]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Gender];
GO
IF OBJECT_ID(N'[dbo].[Manufacturer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Manufacturer];
GO
IF OBJECT_ID(N'[dbo].[Product]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Product];
GO
IF OBJECT_ID(N'[dbo].[ProductPhoto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductPhoto];
GO
IF OBJECT_ID(N'[dbo].[ProductSale]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductSale];
GO
IF OBJECT_ID(N'[dbo].[Service]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Service];
GO
IF OBJECT_ID(N'[dbo].[service_s_import]', 'U') IS NOT NULL
    DROP TABLE [dbo].[service_s_import];
GO
IF OBJECT_ID(N'[dbo].[ServicePhoto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ServicePhoto];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[Tag]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tag];
GO
IF OBJECT_ID(N'[dbo].[TagOfClient]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TagOfClient];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Client'
CREATE TABLE [dbo].[Client] (
    [ID] nvarchar(50)  NOT NULL,
    [FirstName] nvarchar(50)  NOT NULL,
    [LastName] nvarchar(50)  NOT NULL,
    [Patronymic] nvarchar(50)  NULL,
    [Birthday] datetime  NULL,
    [RegistrationDate] datetime  NOT NULL,
    [Email] nvarchar(255)  NULL,
    [Phone] nvarchar(20)  NOT NULL,
    [GenderCode] nchar(3)  NOT NULL,
    [PhotoPath] nvarchar(1000)  NULL
);
GO

-- Creating table 'ClientService'
CREATE TABLE [dbo].[ClientService] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Client] nvarchar(50)  NOT NULL,
    [ServiceID] int  NOT NULL,
    [StartTime] datetime  NOT NULL,
    [Comment] nvarchar(max)  NULL
);
GO

-- Creating table 'DocumentByService'
CREATE TABLE [dbo].[DocumentByService] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [ClientServiceID] int  NOT NULL,
    [DocumentPath] nvarchar(1000)  NOT NULL
);
GO

-- Creating table 'Gender'
CREATE TABLE [dbo].[Gender] (
    [Code] nchar(3)  NOT NULL,
    [Name] nvarchar(10)  NULL
);
GO

-- Creating table 'Manufacturer'
CREATE TABLE [dbo].[Manufacturer] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(100)  NOT NULL,
    [StartDate] datetime  NULL
);
GO

-- Creating table 'Product'
CREATE TABLE [dbo].[Product] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(100)  NOT NULL,
    [Cost] decimal(19,4)  NOT NULL,
    [Description] nvarchar(max)  NULL,
    [MainImagePath] nvarchar(1000)  NULL,
    [IsActive] bit  NOT NULL,
    [ManufacturerID] int  NULL
);
GO

-- Creating table 'ProductPhoto'
CREATE TABLE [dbo].[ProductPhoto] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [ProductID] int  NOT NULL,
    [PhotoPath] nvarchar(1000)  NOT NULL
);
GO

-- Creating table 'ProductSale'
CREATE TABLE [dbo].[ProductSale] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [SaleDate] datetime  NOT NULL,
    [ProductID] int  NOT NULL,
    [Quantity] int  NOT NULL,
    [ClientServiceID] int  NULL
);
GO

-- Creating table 'Service'
CREATE TABLE [dbo].[Service] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [TITLE] nvarchar(100)  NOT NULL,
    [TIME] int  NOT NULL,
    [COST] decimal(19,4)  NOT NULL,
    [DISCOUNT] float  NOT NULL
);
GO

-- Creating table 'service_s_import'
CREATE TABLE [dbo].[service_s_import] (
    [Наименование_услуги] nvarchar(100)  NOT NULL,
    [Длительность] nvarchar(50)  NOT NULL,
    [Стоимость] nvarchar(50)  NOT NULL,
    [Действующая_скидка] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'ServicePhoto'
CREATE TABLE [dbo].[ServicePhoto] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [ServiceID] int  NOT NULL,
    [PhotoPath] nvarchar(1000)  NOT NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'Tag'
CREATE TABLE [dbo].[Tag] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(30)  NOT NULL,
    [Color] nchar(6)  NOT NULL
);
GO

-- Creating table 'AttachedProduct'
CREATE TABLE [dbo].[AttachedProduct] (
    [Product2_ID] int  NOT NULL,
    [Product1_ID] int  NOT NULL
);
GO

-- Creating table 'TagOfClient'
CREATE TABLE [dbo].[TagOfClient] (
    [Client_ID] nvarchar(50)  NOT NULL,
    [Tag_ID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Client'
ALTER TABLE [dbo].[Client]
ADD CONSTRAINT [PK_Client]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'ClientService'
ALTER TABLE [dbo].[ClientService]
ADD CONSTRAINT [PK_ClientService]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'DocumentByService'
ALTER TABLE [dbo].[DocumentByService]
ADD CONSTRAINT [PK_DocumentByService]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [Code] in table 'Gender'
ALTER TABLE [dbo].[Gender]
ADD CONSTRAINT [PK_Gender]
    PRIMARY KEY CLUSTERED ([Code] ASC);
GO

-- Creating primary key on [ID] in table 'Manufacturer'
ALTER TABLE [dbo].[Manufacturer]
ADD CONSTRAINT [PK_Manufacturer]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Product'
ALTER TABLE [dbo].[Product]
ADD CONSTRAINT [PK_Product]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'ProductPhoto'
ALTER TABLE [dbo].[ProductPhoto]
ADD CONSTRAINT [PK_ProductPhoto]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'ProductSale'
ALTER TABLE [dbo].[ProductSale]
ADD CONSTRAINT [PK_ProductSale]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Service'
ALTER TABLE [dbo].[Service]
ADD CONSTRAINT [PK_Service]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [Наименование_услуги] in table 'service_s_import'
ALTER TABLE [dbo].[service_s_import]
ADD CONSTRAINT [PK_service_s_import]
    PRIMARY KEY CLUSTERED ([Наименование_услуги] ASC);
GO

-- Creating primary key on [ID] in table 'ServicePhoto'
ALTER TABLE [dbo].[ServicePhoto]
ADD CONSTRAINT [PK_ServicePhoto]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [ID] in table 'Tag'
ALTER TABLE [dbo].[Tag]
ADD CONSTRAINT [PK_Tag]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [Product2_ID], [Product1_ID] in table 'AttachedProduct'
ALTER TABLE [dbo].[AttachedProduct]
ADD CONSTRAINT [PK_AttachedProduct]
    PRIMARY KEY CLUSTERED ([Product2_ID], [Product1_ID] ASC);
GO

-- Creating primary key on [Client_ID], [Tag_ID] in table 'TagOfClient'
ALTER TABLE [dbo].[TagOfClient]
ADD CONSTRAINT [PK_TagOfClient]
    PRIMARY KEY CLUSTERED ([Client_ID], [Tag_ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ClientServiceID] in table 'DocumentByService'
ALTER TABLE [dbo].[DocumentByService]
ADD CONSTRAINT [FK_DocumentByService_ClientService]
    FOREIGN KEY ([ClientServiceID])
    REFERENCES [dbo].[ClientService]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DocumentByService_ClientService'
CREATE INDEX [IX_FK_DocumentByService_ClientService]
ON [dbo].[DocumentByService]
    ([ClientServiceID]);
GO

-- Creating foreign key on [ClientServiceID] in table 'ProductSale'
ALTER TABLE [dbo].[ProductSale]
ADD CONSTRAINT [FK_ProductSale_ClientService]
    FOREIGN KEY ([ClientServiceID])
    REFERENCES [dbo].[ClientService]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductSale_ClientService'
CREATE INDEX [IX_FK_ProductSale_ClientService]
ON [dbo].[ProductSale]
    ([ClientServiceID]);
GO

-- Creating foreign key on [ManufacturerID] in table 'Product'
ALTER TABLE [dbo].[Product]
ADD CONSTRAINT [FK_Product_Manufacturer]
    FOREIGN KEY ([ManufacturerID])
    REFERENCES [dbo].[Manufacturer]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Product_Manufacturer'
CREATE INDEX [IX_FK_Product_Manufacturer]
ON [dbo].[Product]
    ([ManufacturerID]);
GO

-- Creating foreign key on [ProductID] in table 'ProductPhoto'
ALTER TABLE [dbo].[ProductPhoto]
ADD CONSTRAINT [FK_ProductPhoto_Product]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Product]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductPhoto_Product'
CREATE INDEX [IX_FK_ProductPhoto_Product]
ON [dbo].[ProductPhoto]
    ([ProductID]);
GO

-- Creating foreign key on [ProductID] in table 'ProductSale'
ALTER TABLE [dbo].[ProductSale]
ADD CONSTRAINT [FK_ProductSale_Product]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Product]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductSale_Product'
CREATE INDEX [IX_FK_ProductSale_Product]
ON [dbo].[ProductSale]
    ([ProductID]);
GO

-- Creating foreign key on [ProductID] in table 'ProductSale'
ALTER TABLE [dbo].[ProductSale]
ADD CONSTRAINT [FK_ProductSale_Service]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Service]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductSale_Service'
CREATE INDEX [IX_FK_ProductSale_Service]
ON [dbo].[ProductSale]
    ([ProductID]);
GO

-- Creating foreign key on [Product2_ID] in table 'AttachedProduct'
ALTER TABLE [dbo].[AttachedProduct]
ADD CONSTRAINT [FK_AttachedProduct_Product]
    FOREIGN KEY ([Product2_ID])
    REFERENCES [dbo].[Product]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Product1_ID] in table 'AttachedProduct'
ALTER TABLE [dbo].[AttachedProduct]
ADD CONSTRAINT [FK_AttachedProduct_Product1]
    FOREIGN KEY ([Product1_ID])
    REFERENCES [dbo].[Product]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AttachedProduct_Product1'
CREATE INDEX [IX_FK_AttachedProduct_Product1]
ON [dbo].[AttachedProduct]
    ([Product1_ID]);
GO

-- Creating foreign key on [Client_ID] in table 'TagOfClient'
ALTER TABLE [dbo].[TagOfClient]
ADD CONSTRAINT [FK_TagOfClient_Client]
    FOREIGN KEY ([Client_ID])
    REFERENCES [dbo].[Client]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Tag_ID] in table 'TagOfClient'
ALTER TABLE [dbo].[TagOfClient]
ADD CONSTRAINT [FK_TagOfClient_Tag]
    FOREIGN KEY ([Tag_ID])
    REFERENCES [dbo].[Tag]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TagOfClient_Tag'
CREATE INDEX [IX_FK_TagOfClient_Tag]
ON [dbo].[TagOfClient]
    ([Tag_ID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------