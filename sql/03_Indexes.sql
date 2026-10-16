CREATE INDEX IF NOT EXISTS idx_title_ratings_tconst ON imdb.title_ratings(tconst);
CREATE INDEX IF NOT EXISTS idx_title_ratings_votes ON imdb.title_ratings(numvotes DESC);
CREATE INDEX IF NOT EXISTS idx_title_basics_type ON imdb.title_basics(titletype);
CREATE INDEX IF NOT EXISTS idx_title_basics_year ON imdb.title_basics(startyear);
CREATE INDEX IF NOT EXISTS idx_title_principals_nconst ON imdb.title_principals(nconst);
CREATE INDEX IF NOT EXISTS idx_title_episode_parent ON imdb.title_episode(parenttconst);
CREATE INDEX IF NOT EXISTS idx_name_basics_name ON imdb.name_basics(primaryname);

-- Составной индекс для частых фильтров
CREATE INDEX IF NOT EXISTS idx_title_basics_type_year 
    ON imdb.title_basics(titletype, startyear);