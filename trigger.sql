-- Create function for triger
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