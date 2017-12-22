CREATE TABLE users (   id    VARCHAR(100) NOT NULL,    name    VARCHAR(100),   gender    VARCHAR(1),   area_code    VARCHAR(100),   Age   INT,   PRIMARY KEY(ID) );
REATE TABLE likes (
  user_id  VARCHAR(100),
  track_id  VARCHAR(100),
  PRIMARY KEY(user_id, track_id)
  FOREIGN KEY(user_id) REFERENCES USERS(ID)
  FOREIGN KEY(track_id) REFERENCES track(ID)
);
REATE TABLE likes (   user_id  VARCHAR(100),   track_id  VARCHAR(100),   PRIMARY KEY(user_id, track_id)   FOREIGN KEY(user_id) REFERENCES USERS(ID)   FOREIGN KEY(track_id) REFERENCES track(ID) );
CREATE TABLE likes (
  user_id  VARCHAR(100),
  track_id  VARCHAR(100),
  PRIMARY KEY(user_id, track_id),
  FOREIGN KEY(user_id) REFERENCES USERS(ID),
  FOREIGN KEY(track_id) REFERENCES track(ID)
);
CREATE TABLE likes (   user_id  VARCHAR(100),   track_id  VARCHAR(100),   PRIMARY KEY(user_id, track_id),   FOREIGN KEY(user_id) REFERENCES USERS(ID),   FOREIGN KEY(track_id) REFERENCES track(ID) );
select * from likes;
CREATE TABLE follows (
  user_id  VARCHAR(100),
  artist_id  VARCHAR(100),
  PRIMARY KEY(user_id, ArtistID),
  FOREIGN KEY(user_id) REFERENCES USERS(ID),
  FOREIGN KEY(ArtistID) REFERENCES artist(ID)
);
CREATE TABLE follows (   user_id  VARCHAR(100),   artist_id  VARCHAR(100),   PRIMARY KEY(user_id, ArtistID),   FOREIGN KEY(user_id) REFERENCES USERS(ID),   FOREIGN KEY(ArtistID) REFERENCES artist(ID) );
CREATE TABLE follows (
  user_id  VARCHAR(100),
  artist_id  VARCHAR(100),
  PRIMARY KEY(user_id, artist_id),
  FOREIGN KEY(user_id) REFERENCES users(ID),
  FOREIGN KEY(ArtistID) REFERENCES artist(ID),
);
CREATE TABLE follows (   user_id  VARCHAR(100),   artist_id  VARCHAR(100),   PRIMARY KEY(user_id, artist_id),   FOREIGN KEY(user_id) REFERENCES users(ID),   FOREIGN KEY(ArtistID) REFERENCES artist(ID), );
CREATE TABLE follows (   user_id  VARCHAR(100),   artist_id  VARCHAR(100),   PRIMARY KEY(user_id, artist_id),   FOREIGN KEY(user_id) REFERENCES users(ID),   FOREIGN KEY(ArtistID) REFERENCES artist(ID) );
CREATE TABLE follows (   user_id  VARCHAR(100),   artist_id  VARCHAR(100),   PRIMARY KEY(user_id, artist_id),   FOREIGN KEY(user_id) REFERENCES users(ID),   FOREIGN KEY(artist_id) REFERENCES artist(ID) );
CREATE TABLE payment_method (
  method_id VARCHAR(100),
  method_name VARCHAR(100),
  PRIMARY KEY(method_id)
);
CREATE TABLE payment_method (   method_id VARCHAR(100),   method_name VARCHAR(100),   PRIMARY KEY(method_id) );
CREATE TABLE user_playlist (
  list_id  VARCHAR(100)
  user_id  VARCHAR(100)
  track_id  VARCHAR(100)
  PRIMARY KEY(list_id, user_id, track_id)
  FOREIGN KEY(user_id) REFERENCES users(ID)
  FOREIGN KEY(track_id) REFERENCES track(ID)
);
CREATE TABLE user_playlist (   list_id  VARCHAR(100)   user_id  VARCHAR(100)   track_id  VARCHAR(100)   PRIMARY KEY(list_id, user_id, track_id)   FOREIGN KEY(user_id) REFERENCES users(ID)   FOREIGN KEY(track_id) REFERENCES track(ID) );
CREATE TABLE user_playlist (
  list_id  VARCHAR(100),
  user_id  VARCHAR(100),
  track_id  VARCHAR(100),
  PRIMARY KEY(list_id, user_id, track_id),
  FOREIGN KEY(user_id) REFERENCES users(ID),
  FOREIGN KEY(track_id) REFERENCES track(ID)
);
CREATE TABLE user_playlist (   list_id  VARCHAR(100),   user_id  VARCHAR(100),   track_id  VARCHAR(100),   PRIMARY KEY(list_id, user_id, track_id),   FOREIGN KEY(user_id) REFERENCES users(ID),   FOREIGN KEY(track_id) REFERENCES track(ID) );
select * from artist where name="John Mayer";
select * from artist where name="Queen";
select * from area limit 10
;
select * from area limit 10;
select * from track limit 10;
select * from artist limit 10;
select * from area where name="California" limit 10;
CREATE or replace TABLE users (
  id    VARCHAR(100) NOT NULL, 
  name    VARCHAR(100),
  -- gender    VARCHAR(1),
  -- area_code    VARCHAR(100),
  area                INTEGER, -- references area.id
  gender              INTEGER, -- references gender.id
  Age   INT,
  FOREIGN KEY(area) references area(id),
  FOREIGN KEY(gender) references gender(id),
  PRIMARY KEY(ID)
);
CREATE or replace TABLE users (   id    VARCHAR(100) NOT NULL,    name    VARCHAR(100),         area                INTEGER,    gender              INTEGER,    Age   INT,   FOREIGN KEY(area) references area(id),   FOREIGN KEY(gender) references gender(id),   PRIMARY KEY(ID) );
CREATE or replace TABLE users (
  id    VARCHAR(100) NOT NULL, 
  name    VARCHAR(100),
  -- gender    VARCHAR(1),
  -- area_code    VARCHAR(100),
  area                INTEGER, -- references area.id
  gender              INTEGER, -- references gender.id
  age   INT,
  FOREIGN KEY(area) references area(id),
  FOREIGN KEY(gender) references gender(id),
  PRIMARY KEY(ID)
);
CREATE or replace TABLE users (   id    VARCHAR(100) NOT NULL,    name    VARCHAR(100),         area                INTEGER,    gender              INTEGER,    age   INT,   FOREIGN KEY(area) references area(id),   FOREIGN KEY(gender) references gender(id),   PRIMARY KEY(ID) );
DROP TABLE users;
CREATE TABLE users (
  id    VARCHAR(100) NOT NULL, 
  name    VARCHAR(100),
  -- gender    VARCHAR(1),
  -- area_code    VARCHAR(100),
  area                INTEGER, -- references area.id
  gender              INTEGER, -- references gender.id
  age   INT,
  FOREIGN KEY(area) references area(id),
  FOREIGN KEY(gender) references gender(id),
  PRIMARY KEY(ID)
);
CREATE TABLE users (   id    VARCHAR(100) NOT NULL,    name    VARCHAR(100),         area                INTEGER,    gender              INTEGER,    age   INT,   FOREIGN KEY(area) references area(id),   FOREIGN KEY(gender) references gender(id),   PRIMARY KEY(ID) );
