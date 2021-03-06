﻿CREATE DATABASE Articles
GO

USE Articles

CREATE TABLE dbo.Article (
    ArticleID INT IDENTITY
    ,Title VARCHAR(100) NOT NULL
    ,CONSTRAINT PK_Article_ArticleID PRIMARY KEY CLUSTERED (ArticleID)
) ON [PRIMARY]
GO

CREATE TABLE dbo.Tag (
    TagID INT IDENTITY
    ,Name VARCHAR(100) NOT NULL
    ,CONSTRAINT PK_Tag_TagID PRIMARY KEY CLUSTERED (TagID)
) ON [PRIMARY]
GO

CREATE TABLE dbo.rlArticleToTag (
    RlArticleToTagID INT IDENTITY
    ,ArticleID INT NOT NULL
    ,TagID INT NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE dbo.rlArticleToTag
    ADD CONSTRAINT FK_rlArticleToTag_To_Article FOREIGN KEY (ArticleID) REFERENCES dbo.Article (ArticleID)
GO

ALTER TABLE dbo.rlArticleToTag
    ADD CONSTRAINT FK_rlArticleToTag_To_Tag FOREIGN KEY (TagID) REFERENCES dbo.Tag (TagID)
GO

ALTER TABLE dbo.rlArticleToTag
    ADD CONSTRAINT UC_ArticleID_TagID UNIQUE(ArticleID, TagID)
GO