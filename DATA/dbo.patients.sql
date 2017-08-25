CREATE TABLE [dbo].[patients] (
    [Id]        INT          IDENTITY (1, 1) NOT NULL,
    [firstname] VARCHAR (50) NOT NULL,
    [lastname]  VARCHAR (50) NOT NULL,
    [age]       INT          NULL,
    [OHIP]      INT          NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

