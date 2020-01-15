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