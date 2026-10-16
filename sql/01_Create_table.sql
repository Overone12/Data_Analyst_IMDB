CREATE SCHEMA IF NOT EXISTS imdb;

CREATE TABLE IF NOT EXISTS imdb.name_basics (
    nconst              VARCHAR(10) PRIMARY KEY,
    primaryname        TEXT,
    birthyear          SMALLINT,
    deathyear          SMALLINT,
    primaryprofession  TEXT,
    knownfortitles    TEXT
);

CREATE TABLE IF NOT EXISTS imdb.title_basics (
    tconst          VARCHAR(10) PRIMARY KEY,
    titletype      TEXT,
    primarytitle   TEXT,
    originaltitle  TEXT,
    isadult        BOOLEAN,
    startyear      SMALLINT,
    endyear        SMALLINT,
    runtimeminutes INTEGER,
    genres          TEXT
);


CREATE TABLE IF NOT EXISTS imdb.title_ratings (
    tconst         VARCHAR(10) PRIMARY KEY,
    averagerating NUMERIC(3,1),
    numvotes      INTEGER
);



CREATE TABLE IF NOT EXISTS imdb.title_crew (
    tconst    VARCHAR(10) PRIMARY KEY,
    directors TEXT,
    writers   TEXT
);


CREATE TABLE IF NOT EXISTS imdb.title_principals (
    tconst     VARCHAR(10) NOT NULL,
    ordering   INTEGER NOT NULL,
    nconst     VARCHAR(10),
    category   TEXT,
    job        TEXT,
    characters TEXT,

    PRIMARY KEY (tconst, ordering)
);


CREATE TABLE IF NOT EXISTS imdb.title_episode (
    tconst         VARCHAR(10) PRIMARY KEY,
    parenttconst  VARCHAR(10) NOT NULL,
    seasonnumber  INTEGER,
    episodenumber INTEGER
);



CREATE TABLE IF NOT EXISTS imdb.title_akas (
    titleid          VARCHAR(10) NOT NULL,
    ordering          INTEGER NOT NULL,
    title             TEXT,
    region            TEXT,
    language          TEXT,
    types             TEXT,
    attributes        TEXT,
    isoriginaltitle BOOLEAN,

    PRIMARY KEY (titleid, ordering)
);