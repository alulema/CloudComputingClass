
-- Total requests per operating system for a given time frame
INSERT OVERWRITE DIRECTORY '${OUTPUT}/movies_request/' SELECT Title STRING,Rating, Votes FROM movies_data ORDER BY CAST(Votes AS INT) DESC LIMIT 20;
