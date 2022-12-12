DROP PROCEDURE IF EXISTS insert_main(integer, varchar,varchar);
CREATE OR REPLACE PROCEDURE insert_main(m_id_1 integer, title_1 varchar,author_1 varchar)
LANGUAGE 'plpgsql'
AS $$
BEGIN
    INSERT INTO orders(m_id, title, author) VALUES (m_id_1, title_1, author_1);
END;
$$;