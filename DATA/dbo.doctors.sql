CREATE TABLE [dbo].[doctors] (
    [Id]        INT          IDENTITY (1, 1) NOT NULL,
    [firstname] VARCHAR (50) NOT NULL,
    [lastname]  VARCHAR (50) NOT NULL,
    [specialty] VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

