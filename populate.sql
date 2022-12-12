--Function to return likes from chosen title


DROP FUNCTION IF EXISTS title_likes(varchar);
CREATE OR REPLACE FUNCTION title_likes(likesss varchar) 
    RETURNS TABLE (title1 varchar, likes1 varchar, views1 int)
    LANGUAGE 'plpgsql'
AS $$
BEGIN
    RETURN QUERY
        SELECT title::varchar, likes::varchar, views::int
		FROM Main
		join Date_ted using (m_id) 
		join views_likes ON views_likes.date_id = Date_ted.date_id
		WHERE title = likesss;
END;
$$