-- title_ratings → title_basics
ALTER TABLE imdb.title_ratings
ADD CONSTRAINT fk_title_ratings_title
FOREIGN KEY (tconst) REFERENCES imdb.title_basics (tconst)
NOT VALID;

-- title_crew → title_basics
ALTER TABLE imdb.title_crew
ADD CONSTRAINT fk_title_crew_title
FOREIGN KEY (tconst) REFERENCES imdb.title_basics (tconst)
NOT VALID;

-- title_principals → title_basics
ALTER TABLE imdb.title_principals
ADD CONSTRAINT fk_title_principals_title
FOREIGN KEY (tconst) REFERENCES imdb.title_basics (tconst)
NOT VALID;

-- title_principals → name_basics
ALTER TABLE imdb.title_principals
ADD CONSTRAINT fk_title_principals_name
FOREIGN KEY (nconst) REFERENCES imdb.name_basics (nconst)
NOT VALID;

-- title_episode → title_basics (эпизод)
ALTER TABLE imdb.title_episode
ADD CONSTRAINT fk_title_episode_title
FOREIGN KEY (tconst) REFERENCES imdb.title_basics (tconst)
NOT VALID;

-- title_episode → title_basics (сериал-родитель)
ALTER TABLE imdb.title_episode
ADD CONSTRAINT fk_title_episode_parent
FOREIGN KEY (parenttconst) REFERENCES imdb.title_basics (tconst)
NOT VALID;

-- title_akas → title_basics
ALTER TABLE imdb.title_akas
ADD CONSTRAINT fk_title_akas_title
FOREIGN KEY (titleid) REFERENCES imdb.title_basics (tconst)
NOT VALID;