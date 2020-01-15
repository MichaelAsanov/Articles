BEGIN TRAN
BEGIN TRY

    INSERT INTO 
        Article (Title)
    VALUES('Математика для разработчиков')

    DECLARE @mathArticleId INT = SCOPE_IDENTITY()

    INSERT INTO
        Tag ([Name])
    VALUES('Математика')
    
    DECLARE @mathTagId INT = SCOPE_IDENTITY()

    INSERT INTO
        Tag ([Name])
    VALUES('Разработка')
    
    DECLARE @devTagId INT = SCOPE_IDENTITY()
    
    INSERT INTO
        Tag ([Name])
    VALUES('Информатика')
    
    DECLARE @infTagId INT = SCOPE_IDENTITY()

    INSERT INTO RlArticleToTag
        (ArticleID,      TagID      )
    VALUES
        (@mathArticleId, @mathTagId ),
        (@mathArticleId, @devTagId  ),
        (@mathArticleId, @infTagId  )

    INSERT INTO 
        Article (Title)
    VALUES('Алгоритмы для разработчиков')

    DECLARE @algArticleId INT = SCOPE_IDENTITY()

    INSERT INTO
        Tag ([Name])
    VALUES('Алгоритмы')
    
    DECLARE @algTagId INT = SCOPE_IDENTITY()

    INSERT INTO RlArticleToTag
        (ArticleID,     TagID      )
    VALUES
        (@algArticleId, @algTagId  ),
        (@algArticleId, @devTagId  ),
        (@algArticleId, @infTagId  )

    INSERT INTO
        Article (Title)
    VALUES('Что такое ОГАС')

    DECLARE @ogasArticleId INT = SCOPE_IDENTITY()

    INSERT INTO
        Tag ([Name])
    VALUES('Экономика')
    
    DECLARE @economicsTagId INT = SCOPE_IDENTITY()

    INSERT INTO RlArticleToTag
        (ArticleID,      TagID            )
    VALUES
        (@ogasArticleId, @infTagId        ),
        (@ogasArticleId, @economicsTagId  )

    INSERT INTO
        Article (Title)
    VALUES('Статья без тегов')
        
IF XACT_STATE() > 0 
	COMMIT TRAN

END TRY
BEGIN CATCH
	IF XACT_STATE() != 0 
		ROLLBACK TRAN
	DECLARE @err varchar(MAX) = ERROR_MESSAGE()
	DECLARE @line INT = ERROR_LINE()
	
	RAISERROR('Line: %d. Error: %s', 15, 1, @line, @err)
END CATCH