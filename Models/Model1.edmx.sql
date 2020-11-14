
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/14/2020 16:54:14
-- Generated from EDMX file: C:\Users\Pauline\source\repos\SportAsso\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SportAsso_BDD];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[fk_Creneau_Lieu1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Creneau] DROP CONSTRAINT [fk_Creneau_Lieu1];
GO
IF OBJECT_ID(N'[dbo].[fk_Creneau_Personne1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Creneau] DROP CONSTRAINT [fk_Creneau_Personne1];
GO
IF OBJECT_ID(N'[dbo].[fk_Creneau_Section1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Creneau] DROP CONSTRAINT [fk_Creneau_Section1];
GO
IF OBJECT_ID(N'[dbo].[fk_Document_Dossier1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Document] DROP CONSTRAINT [fk_Document_Dossier1];
GO
IF OBJECT_ID(N'[dbo].[fk_Dossier_Personne1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Dossier] DROP CONSTRAINT [fk_Dossier_Personne1];
GO
IF OBJECT_ID(N'[dbo].[fk_Dossier_Section1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Dossier] DROP CONSTRAINT [fk_Dossier_Section1];
GO
IF OBJECT_ID(N'[dbo].[fk_Personne_has_Creneau_Creneau1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Inscrits] DROP CONSTRAINT [fk_Personne_has_Creneau_Creneau1];
GO
IF OBJECT_ID(N'[dbo].[fk_Personne_has_Créneau_Personne1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Inscrits] DROP CONSTRAINT [fk_Personne_has_Créneau_Personne1];
GO
IF OBJECT_ID(N'[dbo].[fk_Personne_has_Role_Personne1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Personne_has_Role] DROP CONSTRAINT [fk_Personne_has_Role_Personne1];
GO
IF OBJECT_ID(N'[dbo].[fk_Personne_has_Role_Role1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Personne_has_Role] DROP CONSTRAINT [fk_Personne_has_Role_Role1];
GO
IF OBJECT_ID(N'[dbo].[fk_Section_Discipline1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Section] DROP CONSTRAINT [fk_Section_Discipline1];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Creneau]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Creneau];
GO
IF OBJECT_ID(N'[dbo].[Discipline]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Discipline];
GO
IF OBJECT_ID(N'[dbo].[Document]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Document];
GO
IF OBJECT_ID(N'[dbo].[Dossier]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Dossier];
GO
IF OBJECT_ID(N'[dbo].[Inscrits]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Inscrits];
GO
IF OBJECT_ID(N'[dbo].[Lieu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Lieu];
GO
IF OBJECT_ID(N'[dbo].[Personne]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Personne];
GO
IF OBJECT_ID(N'[dbo].[Personne_has_Role]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Personne_has_Role];
GO
IF OBJECT_ID(N'[dbo].[Role]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Role];
GO
IF OBJECT_ID(N'[dbo].[Section]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Section];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Creneau'
CREATE TABLE [dbo].[Creneau] (
    [CreneauId] int  NOT NULL,
    [Nombre_Places_Dispo] int  NOT NULL,
    [Nombre_Places_Max] int  NOT NULL,
    [Section_Id_Section] int  NOT NULL,
    [Lieu_Id_Lieu] int  NOT NULL,
    [Encadrant] int  NOT NULL,
    [Jour] varchar(50)  NULL,
    [Heure] time  NULL
);
GO

-- Creating table 'Discipline'
CREATE TABLE [dbo].[Discipline] (
    [DisciplineId] int  NOT NULL,
    [Nom_Discipline] varchar(50)  NOT NULL
);
GO

-- Creating table 'Document'
CREATE TABLE [dbo].[Document] (
    [DocumentId] int  NOT NULL,
    [Type_Document] varchar(150)  NOT NULL,
    [Dossier_Id_Dossier] int  NOT NULL,
    [Fichier] varbinary(max)  NOT NULL,
    [Est_Valide] tinyint  NULL
);
GO

-- Creating table 'Dossier'
CREATE TABLE [dbo].[Dossier] (
    [DossierId] int  NOT NULL,
    [Paiement] tinyint  NOT NULL,
    [Personne_Id_Personne] int  NOT NULL,
    [Section_Id_Section] int  NOT NULL
);
GO

-- Creating table 'Lieu'
CREATE TABLE [dbo].[Lieu] (
    [LieuId] int  NOT NULL,
    [Adresse] varchar(150)  NOT NULL,
    [Nom] varchar(50)  NOT NULL
);
GO

-- Creating table 'Personne'
CREATE TABLE [dbo].[Personne] (
    [PersonneId] int  NOT NULL,
    [Nom] varchar(50)  NOT NULL,
    [Prenom] varchar(50)  NOT NULL,
    [Date_Naissance] datetime  NOT NULL,
    [E_mail] varchar(70)  NOT NULL,
    [Num_Telephone] varchar(50)  NOT NULL,
    [Sexe] varchar(10)  NULL,
    [Mot_de_Passe] varchar(50)  NOT NULL
);
GO

-- Creating table 'Role'
CREATE TABLE [dbo].[Role] (
    [RoleId] int  NOT NULL,
    [Nom_Role] varchar(50)  NOT NULL
);
GO

-- Creating table 'Section'
CREATE TABLE [dbo].[Section] (
    [SectionId] int  NOT NULL,
    [Nom] varchar(50)  NOT NULL,
    [Prix] decimal(20,0)  NOT NULL,
    [Discipline_Id_Discipline] int  NOT NULL
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

-- Creating table 'Inscrits'
CREATE TABLE [dbo].[Inscrits] (
    [Creneau1_CreneauId] int  NOT NULL,
    [Personne1_PersonneId] int  NOT NULL
);
GO

-- Creating table 'Personne_has_Role'
CREATE TABLE [dbo].[Personne_has_Role] (
    [Personne_PersonneId] int  NOT NULL,
    [Role_RoleId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CreneauId] in table 'Creneau'
ALTER TABLE [dbo].[Creneau]
ADD CONSTRAINT [PK_Creneau]
    PRIMARY KEY CLUSTERED ([CreneauId] ASC);
GO

-- Creating primary key on [DisciplineId] in table 'Discipline'
ALTER TABLE [dbo].[Discipline]
ADD CONSTRAINT [PK_Discipline]
    PRIMARY KEY CLUSTERED ([DisciplineId] ASC);
GO

-- Creating primary key on [DocumentId] in table 'Document'
ALTER TABLE [dbo].[Document]
ADD CONSTRAINT [PK_Document]
    PRIMARY KEY CLUSTERED ([DocumentId] ASC);
GO

-- Creating primary key on [DossierId] in table 'Dossier'
ALTER TABLE [dbo].[Dossier]
ADD CONSTRAINT [PK_Dossier]
    PRIMARY KEY CLUSTERED ([DossierId] ASC);
GO

-- Creating primary key on [LieuId] in table 'Lieu'
ALTER TABLE [dbo].[Lieu]
ADD CONSTRAINT [PK_Lieu]
    PRIMARY KEY CLUSTERED ([LieuId] ASC);
GO

-- Creating primary key on [PersonneId] in table 'Personne'
ALTER TABLE [dbo].[Personne]
ADD CONSTRAINT [PK_Personne]
    PRIMARY KEY CLUSTERED ([PersonneId] ASC);
GO

-- Creating primary key on [RoleId] in table 'Role'
ALTER TABLE [dbo].[Role]
ADD CONSTRAINT [PK_Role]
    PRIMARY KEY CLUSTERED ([RoleId] ASC);
GO

-- Creating primary key on [SectionId] in table 'Section'
ALTER TABLE [dbo].[Section]
ADD CONSTRAINT [PK_Section]
    PRIMARY KEY CLUSTERED ([SectionId] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [Creneau1_CreneauId], [Personne1_PersonneId] in table 'Inscrits'
ALTER TABLE [dbo].[Inscrits]
ADD CONSTRAINT [PK_Inscrits]
    PRIMARY KEY CLUSTERED ([Creneau1_CreneauId], [Personne1_PersonneId] ASC);
GO

-- Creating primary key on [Personne_PersonneId], [Role_RoleId] in table 'Personne_has_Role'
ALTER TABLE [dbo].[Personne_has_Role]
ADD CONSTRAINT [PK_Personne_has_Role]
    PRIMARY KEY CLUSTERED ([Personne_PersonneId], [Role_RoleId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Lieu_Id_Lieu] in table 'Creneau'
ALTER TABLE [dbo].[Creneau]
ADD CONSTRAINT [fk_Creneau_Lieu1]
    FOREIGN KEY ([Lieu_Id_Lieu])
    REFERENCES [dbo].[Lieu]
        ([LieuId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_Creneau_Lieu1'
CREATE INDEX [IX_fk_Creneau_Lieu1]
ON [dbo].[Creneau]
    ([Lieu_Id_Lieu]);
GO

-- Creating foreign key on [Encadrant] in table 'Creneau'
ALTER TABLE [dbo].[Creneau]
ADD CONSTRAINT [fk_Creneau_Personne1]
    FOREIGN KEY ([Encadrant])
    REFERENCES [dbo].[Personne]
        ([PersonneId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_Creneau_Personne1'
CREATE INDEX [IX_fk_Creneau_Personne1]
ON [dbo].[Creneau]
    ([Encadrant]);
GO

-- Creating foreign key on [Section_Id_Section] in table 'Creneau'
ALTER TABLE [dbo].[Creneau]
ADD CONSTRAINT [fk_Creneau_Section1]
    FOREIGN KEY ([Section_Id_Section])
    REFERENCES [dbo].[Section]
        ([SectionId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_Creneau_Section1'
CREATE INDEX [IX_fk_Creneau_Section1]
ON [dbo].[Creneau]
    ([Section_Id_Section]);
GO

-- Creating foreign key on [Discipline_Id_Discipline] in table 'Section'
ALTER TABLE [dbo].[Section]
ADD CONSTRAINT [fk_Section_Discipline1]
    FOREIGN KEY ([Discipline_Id_Discipline])
    REFERENCES [dbo].[Discipline]
        ([DisciplineId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_Section_Discipline1'
CREATE INDEX [IX_fk_Section_Discipline1]
ON [dbo].[Section]
    ([Discipline_Id_Discipline]);
GO

-- Creating foreign key on [Dossier_Id_Dossier] in table 'Document'
ALTER TABLE [dbo].[Document]
ADD CONSTRAINT [fk_Document_Dossier1]
    FOREIGN KEY ([Dossier_Id_Dossier])
    REFERENCES [dbo].[Dossier]
        ([DossierId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_Document_Dossier1'
CREATE INDEX [IX_fk_Document_Dossier1]
ON [dbo].[Document]
    ([Dossier_Id_Dossier]);
GO

-- Creating foreign key on [Personne_Id_Personne] in table 'Dossier'
ALTER TABLE [dbo].[Dossier]
ADD CONSTRAINT [fk_Dossier_Personne1]
    FOREIGN KEY ([Personne_Id_Personne])
    REFERENCES [dbo].[Personne]
        ([PersonneId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_Dossier_Personne1'
CREATE INDEX [IX_fk_Dossier_Personne1]
ON [dbo].[Dossier]
    ([Personne_Id_Personne]);
GO

-- Creating foreign key on [Section_Id_Section] in table 'Dossier'
ALTER TABLE [dbo].[Dossier]
ADD CONSTRAINT [fk_Dossier_Section1]
    FOREIGN KEY ([Section_Id_Section])
    REFERENCES [dbo].[Section]
        ([SectionId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_Dossier_Section1'
CREATE INDEX [IX_fk_Dossier_Section1]
ON [dbo].[Dossier]
    ([Section_Id_Section]);
GO

-- Creating foreign key on [Creneau1_CreneauId] in table 'Inscrits'
ALTER TABLE [dbo].[Inscrits]
ADD CONSTRAINT [FK_Inscrits_Creneau]
    FOREIGN KEY ([Creneau1_CreneauId])
    REFERENCES [dbo].[Creneau]
        ([CreneauId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Personne1_PersonneId] in table 'Inscrits'
ALTER TABLE [dbo].[Inscrits]
ADD CONSTRAINT [FK_Inscrits_Personne]
    FOREIGN KEY ([Personne1_PersonneId])
    REFERENCES [dbo].[Personne]
        ([PersonneId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Inscrits_Personne'
CREATE INDEX [IX_FK_Inscrits_Personne]
ON [dbo].[Inscrits]
    ([Personne1_PersonneId]);
GO

-- Creating foreign key on [Personne_PersonneId] in table 'Personne_has_Role'
ALTER TABLE [dbo].[Personne_has_Role]
ADD CONSTRAINT [FK_Personne_has_Role_Personne]
    FOREIGN KEY ([Personne_PersonneId])
    REFERENCES [dbo].[Personne]
        ([PersonneId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Role_RoleId] in table 'Personne_has_Role'
ALTER TABLE [dbo].[Personne_has_Role]
ADD CONSTRAINT [FK_Personne_has_Role_Role]
    FOREIGN KEY ([Role_RoleId])
    REFERENCES [dbo].[Role]
        ([RoleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Personne_has_Role_Role'
CREATE INDEX [IX_FK_Personne_has_Role_Role]
ON [dbo].[Personne_has_Role]
    ([Role_RoleId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------