CREATE TABLE [dbo].[users] (
    [Id]        INT          IDENTITY (1, 1) NOT NULL,
    [firstname] VARCHAR (50) NULL,
    [lastname]  VARCHAR (50) NULL,
    [username]  VARCHAR (50) NOT NULL,
    [password]  VARCHAR (50) NOT NULL,
    [status]    VARCHAR (6)  DEFAULT (user_name()) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

