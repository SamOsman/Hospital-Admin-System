CREATE TABLE [dbo].[visits] (
    [Id]          INT          IDENTITY (1, 1) NOT NULL,
    [visit_start] DATETIME     NULL,
    [visit_end]   DATETIME     NULL,
    [reason]      VARCHAR (70) NULL,
    [patient_id]  INT          NOT NULL,
    [doctor_id]   INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_visits_ToDooctors] FOREIGN KEY ([doctor_id]) REFERENCES [dbo].[doctors] ([Id]),
    CONSTRAINT [FK_visits_ToPatients] FOREIGN KEY ([patient_id]) REFERENCES [dbo].[patients] ([Id])
    ON DELETE CASCADE
);

