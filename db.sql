
-- Title: LIS 543 WI24 Team 3 Final Project
-- Author: Aaliyah Davis, Giselle Shannon, Yawen Guo, and Xinya Tang
CREATE DATABASE Music_Streaming_Service;

USE Music_Streaming_Service;

-- Do we need to create schema for our db?
-- CREATE SCHEMA
-- the currect schema is dbo

CREATE TABLE dbo.User(
  user_ID INT NOT NULL PRIMARY KEY,
  user_name varchar(50) NOT NULL,
  register_date DATE NOT NULL,
  last_login_date DATE NOT NULL,
  login_password varchar(50) NOT NULL,
  email_address varchar(50) NOT NULL,
  phone_number varchar(50) NOT NULL,
  profile_photo varchar(1000), -- optional
  profile_desc varchar(1000) -- optional
);

CREATE TABLE dbo.MusicianActivity(
    user_ID INT NOT NULL REFERENCES User(user_ID),
    track_ID INT NOT NULL REFERENCES Track(track_ID),
    specialty_ID INT NOT NULL REFERENCES MusicianSpeciality(specialty_ID),
    PRIMARY KEY (user_ID, track_ID, specialty_ID),
)

CREATE TABLE dbo.ListenHistory(
    user_ID INT NOT NULL REFERENCES User(user_ID),
    track_ID INT NOT NULL REFERENCES Track(track_ID),
    listen_time_stamp TIMESTAMP NOT NULL,
    PRIMARY KEY (user_ID, track_ID, listen_time_stamp),
)

CREATE TABLE dbo.DownloadHistory(
    user_ID INT NOT NULL REFERENCES User(user_ID),
    track_ID INT NOT NULL REFERENCES Track(track_ID),
    download_time_stamp TIMESTAMP NOT NULL,
    PRIMARY KEY (user_ID, track_ID, download_time_stamp),
)

CREATE TABLE dbo.LikeHistory(
    user_ID INT NOT NULL REFERENCES User(user_ID),
    track_ID INT NOT NULL REFERENCES Track(track_ID),
    like_time_stamp TIMESTAMP NOT NULL,
    PRIMARY KEY (user_ID, track_ID, like_time_stamp),
)

CREATE TABLE dbo.FollowingRelationship(
  follow_num INT NOT NULL PRIMARY KEY,
  user_ID_follower INT NOT NULL REFERENCES User(user_ID),
  user_ID_followed INT NOT NULL REFERENCES User(user_ID),
  follow_time_stamp DATETIME NOT NULL,
  CONSTRAINT check_valid_follow_time
  CHECK (register_date < follow_time_stamp)
)

CREATE TABLE dbo.PurchaseHistory(
  invoice_num INT NOT NULL PRIMARY KEY,
  user_ID INT NOT NULL REFERENCES User(user_ID),
  product_ID INT NOT NULL REFERENCES Product(product_ID),
  quantity INT NOT NULL,
  invoice_price AS quantity * (SELECT product_price FROM Product p WHERE p.product_ID = product_ID)
  purchase_time_stamp DATETIME NOT NULL,
  CONSTRAINT check_valid_purchase_time_album
  CHECK (album_release_date < purchase_time_stamp)
  CONSTRAINT check_valid_purchase_time_track
  CHECK (track_release_date < purchase_time_stamp)
)

CREATE TABLE dbo.MusicianSpeciality(
  specialty_ID INT NOT NULL PRIMARY KEY,
  specialty_desc varchar(1000),
)

CREATE TABLE dbo.Label(
	label_ID INT NOT NULL PRIMARY KEY,
	label_name varchar(50) NOT NULL,
	label_desc varchar(1000) NOT NULL
);

CREATE TABLE dbo.Product(
	product_ID INT NOT NULL PRIMARY KEY,
	product_price DECIMAL(10,2) NOT NULL,
	label_ID INT NOT NULL REFERENCES Label(label_ID)
);

CREATE TABLE dbo.Album(
	album_ID INT NOT NULL PRIMARY KEY,
	product_ID INT NOT NULL REFERENCES Product(product_ID),
	album_release_date DATE NOT NULL,
	album_desc varchar(1000) NOT NULL
);

CREATE TABLE dbo.Track(
	track_ID INT NOT NULL PRIMARY KEY,
	product_ID NOT NULL REFERENCES Product(product_ID),
	album_ID NOT NULL REFERENCES Album(album_ID),
	track_name varchar(50) NOT NULL,
	track_time TIME NOT NULL,
	track_release_date DATE NOT NULL,
	track_bpm INT NOT NULL
);

 --Adding the Playlist Inclusiveness, Playlist, Track Genre, and Genre Tables
 CREATE TABLE dbo.Playlist
 (
  playlist_ID int IDENTITY NOT NULL PRIMARY KEY,
  user_ID int NOT NULL,
  playlist_name varchar(50) NOT NULL, 
  playlist_desc varchar(1000),
  CONSTRAINT FKPlaylist FOREIGN KEY (user_ID)
    REFERENCES dbo.[User](user_ID)
 )

 CREATE TABLE dbo.PlaylistInclusiveness(
  playlist_ID int NOT NULL,
  track_ID int NOT NULL,
  CONSTRAINT FK1PlaylistInclusiveness FOREIGN KEY (playlist_ID)
    REFERENCES dbo.Playlist(playlist_ID),
  CONSTRAINT FK2PlaylistInclusiveness FOREIGN KEY (track_ID)
    REFERENCES dbo.Track(track_ID),
  CONSTRAINT PKPlaylistInclusiveness PRIMARY KEY CLUSTERED (playlist_ID, track_ID)
 ) 

CREATE TABLE dbo.Genre
(
  genre_ID int IDENTITY NOT NULL PRIMARY KEY,
  genre_desc varchar(50) NOT NULL
)

CREATE TABLE dbo.TrackGenre
(
  genre_ID int NOT NULL,
  track_ID int NOT NULL,
  CONSTRAINT FK1TrackGenre FOREIGN KEY (genre_ID)
    REFERENCES dbo.Genre(genre_ID),
  CONSTRAINT FK2TrackGenre FOREIGN KEY (track_ID)
    REFERENCES dbo.Track(track_ID),
  CONSTRAINT PKTrackGenre PRIMARY KEY CLUSTERED (genre_ID, track_ID)
)
