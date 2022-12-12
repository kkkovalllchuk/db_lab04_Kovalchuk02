-- Function

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
$$;

SELECT * FROM title_likes ('Climate action needs new frontline leadership')


---PROCEDURE
DROP PROCEDURE IF EXISTS insert_main(integer, varchar,varchar);
CREATE OR REPLACE PROCEDURE insert_main(m_id_1 integer, title_1 varchar,author_1 varchar)
LANGUAGE 'plpgsql'
AS $$
BEGIN
    INSERT INTO main(m_id, title, author) VALUES (m_id_1, title_1, author_1);
END;
$$;
CALL insert_main(8, 'fkkffkfkfk','fkfkfkfk');
SELECT * FROM Main

---trigger
CREATE OR REPLACE FUNCTION new() RETURNS trigger 
LANGUAGE 'plpgsql'
AS
$$
     BEGIN
          UPDATE main 
          SET title = '---' WHERE main.m_id = NEW.m_id; 
		  RETURN NULL; -- result is ignored since this is an AFTER trigger
     END;
$$;

-- Creating triger, which will reduce market share of new genres to 0
CREATE TRIGGER main_ins 
AFTER INSERT ON main
FOR EACH ROW EXECUTE FUNCTION new();
INSERT INTO main  
VALUES ('10', 'fffjjffj','fkfkfkfk');
