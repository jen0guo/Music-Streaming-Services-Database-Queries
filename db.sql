
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
  follow_time_stamp TIMESTAMP NOT NULL,
)

CREATE TABLE dbo.PurchaseHistory(
  invoice_num INT NOT NULL PRIMARY KEY,
  user_ID INT NOT NULL REFERENCES User(user_ID),
  product_ID INT NOT NULL REFERENCES Product(product_ID),
  unit_price MONEY NOT NULL,
  quantity INT NOT NULL,
  invoice_price AS unit_price*quantity
  purchase_time_stamp TIMESTAMP NOT NULL,
)

CREATE TABLE dbo.MusicianSpeciality(
  specialty_ID INT NOT NULL PRIMARY KEY,
  specialty_desc varchar(1000),
)


  
