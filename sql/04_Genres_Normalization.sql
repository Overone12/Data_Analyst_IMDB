
CREATE TABLE IF NOT EXISTS imdb.genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name TEXT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS imdb.title_genres (
    tconst VARCHAR(10) NOT NULL,
    genre_id INTEGER NOT NULL,
    PRIMARY KEY (tconst, genre_id)
);

INSERT INTO imdb.genres (genre_name)
SELECT DISTINCT TRIM(UNNEST(STRING_TO_ARRAY(genres, ',')))
FROM imdb.title_basics
WHERE genres IS NOT NULL AND genres != '\N'
ON CONFLICT (genre_name) DO NOTHING;

INSERT INTO imdb.title_genres (tconst, genre_id)
SELECT 
    tb.tconst,
    g.genre_id
FROM imdb.title_basics tb
CROSS JOIN LATERAL UNNEST(STRING_TO_ARRAY(tb.genres, ',')) AS genre_raw
JOIN imdb.genres g ON g.genre_name = TRIM(genre_raw)
WHERE tb.genres IS NOT NULL AND tb.genres != '\N'
ON CONFLICT DO NOTHING;