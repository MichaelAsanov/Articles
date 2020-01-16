USE Articles

SELECT a.Title AS 'Тема статьи'
    , t.[Name] AS 'Тег'
    FROM Article a
        LEFT JOIN rlArticleToTag rl ON a.ArticleID = rl.ArticleID
        LEFT JOIN Tag t ON rl.TagID = t.TagID