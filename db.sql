
-- Title: LIS 543 WI24 Team 3 Final Project
-- Author: Aaliyah Davis, Giselle Shannon, Yawen Guo, and Xinya Tang
-- Schema: dbo
CREATE DATABASE Music_Streaming_Service;

USE Music_Streaming_Service;

CREATE TABLE dbo.User(
  user_ID varchar(50) NOT NULL PRIMARY KEY ,
  user_name varchar(50) NOT NULL,
  register_date DATE NOT NULL, -- 01/01/2023 - 07/31/2023
  last_login_date DATE NOT NULL -- 08/01/2023 - today
  login_password varchar(50) NOT NULL,
  email_address varchar(50) NOT NULL,
  phone_number varchar(50) NOT NULL,
  profile_photo varchar(1000),
  profile_desc varchar(1000),
  CONSTRAINT check_valid_sign_in_DATETIME
  CHECK (register_date < last_login_date)
);

CREATE TABLE dbo.MusicianActivity(
  user_ID varchar(50) NOT NULL REFERENCES User(user_ID),
  track_ID varchar(50) NOT NULL REFERENCES Track(track_ID),
  specialty_ID varchar(50) NOT NULL REFERENCES MusicianSpeciality(specialty_ID),
  PRIMARY KEY (user_ID, track_ID, specialty_ID),
);

CREATE TABLE dbo.ListenHistory(
  user_ID varchar(50) NOT NULL REFERENCES User(user_ID),
  track_ID varchar(50) NOT NULL REFERENCES Track(track_ID),
  listen_time_stamp DATETIME NOT NULL,
  PRIMARY KEY (user_ID, track_ID, listen_time_stamp),
  CONSTRAINT check_listen_timestamp_after_register
  CHECK (listen_time_stamp > (SELECT register_date FROM User WHERE user_ID = ListenHistory.user_ID))
);

CREATE TABLE dbo.DownloadHistory(
  user_ID varchar(50) NOT NULL REFERENCES User(user_ID),
  track_ID varchar(50) NOT NULL REFERENCES Track(track_ID),
  download_time_stamp DATETIME NOT NULL,
  PRIMARY KEY (user_ID, track_ID, download_time_stamp),
  CONSTRAINT check_download_timestamp_after_register
  CHECK (download_time_stamp > (SELECT register_date FROM User WHERE user_ID = DownloadHistory.user_ID))
);

CREATE TABLE dbo.LikeHistory(
  user_ID varchar(50) NOT NULL REFERENCES User(user_ID),
  track_ID varchar(50) NOT NULL REFERENCES Track(track_ID),
  like_time_stamp DATETIME NOT NULL,
  PRIMARY KEY (user_ID, track_ID, like_time_stamp),
  CONSTRAINT check_like_timestamp_after_register
  CHECK (like_time_stamp > (SELECT register_date FROM User WHERE user_ID = LikeHistory.user_ID))
);


insert into User (user_ID, user_name, register_date, last_login_date, login_password, email_address, phone_number, profile_photo, profile_desc) values
  ('a4385066-147b-4560-9dc9-afd258c89791', 'drenac0', '3/4/2023', '10/28/2023', 'zG4</VI3K(4O{0=', 'vastman0@theglobeandmail.com', '809-893-0248', 'http://dummyimage.com/139x100.png/ff4444/ffffff', 'WCowtXzonxe4FW4gnMs88JqavN4j0Z8AYbwch9CLM6Er9Tt'),
  ('6f5b5567-cf20-433d-8287-5e32a86246b3', 'hmccusker1', '1/31/2023', '11/8/2023', 'vM2+=V@`0m', 'yearland1@java.com', '570-898-3953', 'http://dummyimage.com/154x100.png/5fa2dd/ffffff', 'mlo51aLbf8FFAs6WSCZak9whIcbumrGWLgh0SMZPACSfVcX'),
  ('e72c0006-50a6-4717-8993-128613423d55', 'dtwidle2', '1/29/2023', '12/17/2023', 'qI7_\lYHJSqL"i', 'lgergolet2@rediff.com', '893-684-0512', 'http://dummyimage.com/180x100.png/dddddd/000000', null),
  ('0e4e1497-ffb2-491b-97fe-8301154532a1', 'ldemeza3', '6/20/2023', '12/6/2023', 'xX4`K*Nwt', 'ppettitt3@youtube.com', '634-576-2899', null, null),
  ('6efa23ec-3bd0-4b82-b631-962f416384a8', 'bhaller4', '1/25/2023', '2/11/2024', 'iW0`7V''~4A\(/E', 'tduffet4@networksolutions.com', '108-561-3660', 'http://dummyimage.com/244x100.png/ff4444/ffffff', null),
  ('cee7e196-937b-4985-8016-07cf77c8f35b', 'dewin5', '2/12/2023', '10/6/2023', 'mA2|@k1vk_LNDc', 'pormshaw5@sourceforge.net', '292-788-5533', 'http://dummyimage.com/219x100.png/ff4444/ffffff', null),
  ('b025f973-1eb4-446d-b4c1-7ce9c3fced9d', 'rmcfeat6', '2/11/2023', '12/22/2023', 'dL2(dojT_?+V', 'npaull6@dion.ne.jp', '570-219-4494', 'http://dummyimage.com/245x100.png/5fa2dd/ffffff', 'rOVmeMfJoFtnMWXINdodxz2MLET35UPcQUfp6m6ATQPvkEJ'),
  ('1a9288dd-e1b8-48fc-9d38-241d0738098f', 'iherreran7', '6/1/2023', '10/20/2023', 'sU0<kd@$0JQ(Vg5h', 'ntoe7@example.com', '364-192-3730', null, null),
  ('bf8a4973-2408-4c40-8483-39c225743570', 'lgaskall8', '7/1/2023', '8/6/2023', 'kR2?GN<LzlV|CY/P', 'jjendrassik8@w3.org', '779-304-2773', 'http://dummyimage.com/169x100.png/dddddd/000000', null),
  ('cf7ab4b4-6779-4463-b518-2f1a104816ef', 'jhowtopreserve9', '1/4/2023', '1/15/2024', 'qL8}tpJ={f|moR>a', 'xmosby9@creativecommons.org', '599-620-8768', 'http://dummyimage.com/200x100.png/5fa2dd/ffffff', 'uTehSWYXQahOu46rh4sbJagOmSAITg7oRTB0pPjymOfDKv0'),
  ('9c5ee840-c8b2-4d58-86c7-d87c5aac04f1', 'fharwooda', '4/26/2023', '2/28/2024', 'gZ7$lCIxYU,r', 'svarfalameeva@mapquest.com', '713-152-8844', 'http://dummyimage.com/173x100.png/ff4444/ffffff', 'aCN75hGFZPnTwi4JaBzVNyWoEHldWgDelE1Hgf5sRFK6beI'),
  ('15c36c9a-6d34-4cb8-8799-a7089b36fa09', 'dricciardib', '7/17/2023', '11/16/2023', 'yN9@&)*GV', 'eleebeterb@youtube.com', '622-508-9780', null, null),
  ('796017c2-66ed-4865-8aef-9ef915a14307', 'jcockhillc', '4/9/2023', '9/7/2023', 'tE8.?qG%PI{P', 'oleytonc@reuters.com', '882-611-1320', null, null),
  ('c81d3a27-6e3e-4ebf-89fb-f3fc9c3ab63d', 'ddenned', '6/27/2023', '11/13/2023', 'iJ8?.rTEY+aI', 'mmargerisond@boston.com', '626-941-4393', 'http://dummyimage.com/107x100.png/dddddd/000000', null),
  ('6cbadc1f-1932-404f-b498-2f60b46424b5', 'bparmentere', '4/4/2023', '10/19/2023', 'nC8#J<G4\=', 'mjacobsene@ucsd.edu', '661-967-4128', null, null),
  ('122d6c4c-7de8-47b1-a314-69ad99c161fe', 'eoakinfoldf', '5/30/2023', '9/12/2023', 'dL4$A6QFsg`!|0', 'cbreinleinf@istockphoto.com', '769-988-4439', 'http://dummyimage.com/139x100.png/ff4444/ffffff', null),
  ('4ed2412d-6084-4c35-9077-f0eb8d9dc374', 'tlegroveg', '1/18/2023', '2/27/2024', 'hE8.jDPQZ', 'mthistletong@google.com', '683-190-2386', 'http://dummyimage.com/162x100.png/cc0000/ffffff', 'eE8jPeKnGztr3nEOU7MmIhE2teCEL0BwLEOstkkzpObnA4y'),
  ('fdb29741-d9ba-4019-af9f-5d869290af2e', 'ejonkh', '3/12/2023', '12/24/2023', 'gF8<B}`n9g_|1?Fw', 'minderh@auda.org.au', '910-671-9932', null, null),
  ('00a05fed-3b54-41a1-8dad-0322727a78da', 'fwilseyi', '2/20/2023', '11/15/2023', 'rC0>''k+FD`uJ', 'sprinni@theatlantic.com', '371-771-0838', 'http://dummyimage.com/228x100.png/cc0000/ffffff', null),
  ('0461fbf9-ce83-43d6-ab81-1ed014b16c3a', 'gfeehanj', '2/27/2023', '10/1/2023', 'pG9$eiH@iGz', 'lsmolanj@squarespace.com', '611-504-0233', 'http://dummyimage.com/151x100.png/cc0000/ffffff', 'fkxxgnQKZ2OVeCR0O7aK5chEc0BkTu1yDldSKsYXQufo1aD');


INSERT INTO MusicianActivity (user_ID, track_ID, specialty_ID) VALUES
  ('a4385066-147b-4560-9dc9-afd258c89791', '65e3654dfc13ae0e3fcd36e5', '65e42642fc13ae3278cd3aca'),
  ('6efa23ec-3bd0-4b82-b631-962f416384a8', '65e3654dfc13ae0e3fcd36fb', '65e42642fc13ae3278cd3acd'),
  ('6f5b5567-cf20-433d-8287-5e32a86246b3', '65e3654dfc13ae0e3fcd3705', '65e42642fc13ae3278cd3acb'),
  ('e72c0006-50a6-4717-8993-128613423d55', '65e3654dfc13ae0e3fcd36ff', '65e42642fc13ae3278cd3acc'),
  ('0e4e1497-ffb2-491b-97fe-8301154532a1', '65e3654dfc13ae0e3fcd36ef', '65e42642fc13ae3278cd3acd'),
  ('cee7e196-937b-4985-8016-07cf77c8f35b', '65e3654dfc13ae0e3fcd36cb', '65e42642fc13ae3278cd3ad0'),
  ('b025f973-1eb4-446d-b4c1-7ce9c3fced9d', '65e3654dfc13ae0e3fcd36cd', '65e42642fc13ae3278cd3ace'),
  ('1a9288dd-e1b8-48fc-9d38-241d0738098f', '65e3654dfc13ae0e3fcd36f1', '65e42642fc13ae3278cd3ad2'),
  ('bf8a4973-2408-4c40-8483-39c225743570', '65e3654dfc13ae0e3fcd36db', '65e42642fc13ae3278cd3ad3'),
  ('cf7ab4b4-6779-4463-b518-2f1a104816ef', '65e3654dfc13ae0e3fcd3707', '65e42642fc13ae3278cd3ad2');


INSERT INTO ListenHistory (user_ID, track_ID, listen_time_stamp) VALUES
  ('1a9288dd-e1b8-48fc-9d38-241d0738098f', '65e3654dfc13ae0e3fcd3707', '2024-02-27 09:53:56'),
  ('bf8a4973-2408-4c40-8483-39c225743570', '65e3654dfc13ae0e3fcd370b', '2023-11-18 18:41:36'),
  ('e72c0006-50a6-4717-8993-128613423d55', '65e3654dfc13ae0e3fcd36c1', '2024-02-18 13:02:50'),
  ('00a05fed-3b54-41a1-8dad-0322727a78da', '65e3654dfc13ae0e3fcd36ff', '2023-10-04 19:42:58'),
  ('cee7e196-937b-4985-8016-07cf77c8f35b', '65e3654dfc13ae0e3fcd36fb', '2024-01-05 05:37:24'),
  ('6efa23ec-3bd0-4b82-b631-962f416384a8', '65e3654dfc13ae0e3fcd36c7', '2023-08-24 18:16:12'),
  ('00a05fed-3b54-41a1-8dad-0322727a78da', '65e3654dfc13ae0e3fcd36eb', '2023-11-16 06:19:03'),
  ('cf7ab4b4-6779-4463-b518-2f1a104816ef', '65e3654dfc13ae0e3fcd36d3', '2023-08-13 01:04:51'),
  ('1a9288dd-e1b8-48fc-9d38-241d0738098f', '65e3654dfc13ae0e3fcd36dd', '2023-08-14 06:55:02'),
  ('bf8a4973-2408-4c40-8483-39c225743570', '65e3654dfc13ae0e3fcd36f1', '2023-10-21 20:12:55');


INSERT INTO DownloadHistory (user_ID, track_ID, download_time_stamp) VALUES
  ('6f5b5567-cf20-433d-8287-5e32a86246b3', '65e3654dfc13ae0e3fcd36cf', '2023-11-29 20:35:27'),
  ('4ed2412d-6084-4c35-9077-f0eb8d9dc374', '65e3654dfc13ae0e3fcd36e7', '2024-01-12 04:19:59'),
  ('6efa23ec-3bd0-4b82-b631-962f416384a8', '65e3654dfc13ae0e3fcd3707', '2023-11-05 18:11:37'),
  ('1a9288dd-e1b8-48fc-9d38-241d0738098f', '65e3654dfc13ae0e3fcd36d5', '2023-09-20 10:14:22'),
  ('6cbadc1f-1932-404f-b498-2f60b46424b5', '65e3654dfc13ae0e3fcd36e5', '2024-02-02 11:52:31'),
  ('9c5ee840-c8b2-4d58-86c7-d87c5aac04f1', '65e3654dfc13ae0e3fcd36f1', '2024-01-20 03:39:16'),
  ('fdb29741-d9ba-4019-af9f-5d869290af2e', '65e3654dfc13ae0e3fcd36f7', '2023-09-24 02:41:06'),
  ('0e4e1497-ffb2-491b-97fe-8301154532a1', '65e3654dfc13ae0e3fcd36c7', '2023-10-25 02:20:08'),
  ('bf8a4973-2408-4c40-8483-39c225743570', '65e3654dfc13ae0e3fcd36d7', '2023-11-22 03:21:49'),
  ('00a05fed-3b54-41a1-8dad-0322727a78da', '65e3654dfc13ae0e3fcd36f3', '2023-12-27 21:30:35');


INSERT INTO LikeHistory (user_ID, track_ID, like_time_stamp) VALUES
  ('122d6c4c-7de8-47b1-a314-69ad99c161fe', '65e3654dfc13ae0e3fcd36dd', '2023-10-03 02:49:20'),
  ('1a9288dd-e1b8-48fc-9d38-241d0738098f', '65e3654dfc13ae0e3fcd36f9', '2023-12-27 06:53:47'),
  ('cf7ab4b4-6779-4463-b518-2f1a104816ef', '65e3654dfc13ae0e3fcd36ef', '2023-10-21 13:00:56'),
  ('6cbadc1f-1932-404f-b498-2f60b46424b5', '65e3654dfc13ae0e3fcd3707', '2023-09-30 16:37:38'),
  ('0e4e1497-ffb2-491b-97fe-8301154532a1', '65e3654dfc13ae0e3fcd36c7', '2023-12-01 16:50:13'),
  ('9c5ee840-c8b2-4d58-86c7-d87c5aac04f1', '65e3654dfc13ae0e3fcd36d1', '2023-10-21 10:10:12'),
  ('bf8a4973-2408-4c40-8483-39c225743570', '65e3654dfc13ae0e3fcd36cf', '2023-09-09 14:03:17'),
  ('fdb29741-d9ba-4019-af9f-5d869290af2e', '65e3654dfc13ae0e3fcd36d9', '2023-10-01 03:14:39'),
  ('a4385066-147b-4560-9dc9-afd258c89791', '65e3654dfc13ae0e3fcd36e5', '2023-08-07 19:07:11'),
  ('bf8a4973-2408-4c40-8483-39c225743570', '65e3654dfc13ae0e3fcd36db', '2023-08-16 11:54:20');


CREATE TABLE dbo.FollowingRelationship(
  follow_ID varchar(50) NOT NULL PRIMARY KEY,
  user_ID_follower varchar(50) NOT NULL REFERENCES User(user_ID),
  user_ID_followed varchar(50) NOT NULL REFERENCES User(user_ID),
  follow_time_stamp DATETIME NOT NULL,
  CONSTRAINT check_valid_follow_time
  CHECK (register_date < follow_time_stamp)
);

insert into FollowingRelationship (follow_ID, user_ID_follower, user_ID_followed, follow_time_stamp) values
 ('65e3ba95fc13ae6456cd367e', '122d6c4c-7de8-47b1-a314-69ad99c161fe', '1a9288dd-e1b8-48fc-9d38-241d0738098f', '2023-12-28 16:18:20'),
 ('65e3ba95fc13ae6456cd367f', '1a9288dd-e1b8-48fc-9d38-241d0738098f', '122d6c4c-7de8-47b1-a314-69ad99c161fe', '2023-11-22 16:09:52'),
 ('65e3ba95fc13ae6456cd3680', 'cf7ab4b4-6779-4463-b518-2f1a104816ef', '1a9288dd-e1b8-48fc-9d38-241d0738098f', '2023-09-28 21:41:42'),
 ('65e3ba95fc13ae6456cd3681', '6cbadc1f-1932-404f-b498-2f60b46424b5', '1a9288dd-e1b8-48fc-9d38-241d0738098f', '2023-09-13 16:52:06'),
 ('65e3ba95fc13ae6456cd3682', '0e4e1497-ffb2-491b-97fe-8301154532a1', '1a9288dd-e1b8-48fc-9d38-241d0738098f', '2023-12-28 23:45:54'),
 ('65e3ba95fc13ae6456cd3683', '9c5ee840-c8b2-4d58-86c7-d87c5aac04f1', '1a9288dd-e1b8-48fc-9d38-241d0738098f', '2023-10-03 11:12:32'),
 ('65e3ba95fc13ae6456cd3684', 'bf8a4973-2408-4c40-8483-39c225743570', '1a9288dd-e1b8-48fc-9d38-241d0738098f', '2023-08-14 03:01:55'),
 ('65e3ba95fc13ae6456cd3685', 'fdb29741-d9ba-4019-af9f-5d869290af2e', '1a9288dd-e1b8-48fc-9d38-241d0738098f', '2024-01-14 20:29:21'),
 ('65e3ba95fc13ae6456cd3686', 'a4385066-147b-4560-9dc9-afd258c89791', '1a9288dd-e1b8-48fc-9d38-241d0738098f', '2023-12-20 19:42:36'),
 ('65e3ba95fc13ae6456cd3687', '9c5ee840-c8b2-4d58-86c7-d87c5aac04f1', 'cf7ab4b4-6779-4463-b518-2f1a104816ef', '2023-08-25 12:24:08');


CREATE TABLE dbo.PurchaseHistory(
  invoice_ID varchar(50) NOT NULL PRIMARY KEY,
  user_ID varchar(50) NOT NULL REFERENCES User(user_ID),
  product_ID varchar(50) NOT NULL REFERENCES Product(product_ID),
  quantity INT NOT NULL,
  invoice_price AS quantity * (SELECT product_price FROM Product p WHERE p.product_ID = product_ID)
  purchase_time_stamp DATETIME NOT NULL,
  CONSTRAINT check_valid_purchase_time_album
  CHECK (album_release_date < purchase_time_stamp)
  CONSTRAINT check_valid_purchase_time_track
  CHECK (track_release_date < purchase_time_stamp)
)
	
insert into PurchaseHistory (invoice_ID, user_ID, product_ID, quantity, invoice_price, purchase_time_stamp) values
  ('65e3c00ffc13ae6456cd368d', '6f5b5567-cf20-433d-8287-5e32a86246b3', '65e3654dfc13ae0e3fcd36da', 35, '$7591.10', '2023-11-24 11:55:31'),
  ('65e3c00ffc13ae6456cd368e', 'e72c0006-50a6-4717-8993-128613423d55', '65e3654dfc13ae0e3fcd36dc', 44, '$1875.64', '2023-10-01 05:04:18'),
  ('65e3c00ffc13ae6456cd368f', '0e4e1497-ffb2-491b-97fe-8301154532a1', '65e3654dfc13ae0e3fcd36f2', 6, '$9343.53', '2023-08-06 00:51:51'),
  ('65e3c00ffc13ae6456cd3690', '6efa23ec-3bd0-4b82-b631-962f416384a8', '65e3654dfc13ae0e3fcd36e6', 50, '$5357.36', '2023-11-06 08:29:21'),
  ('65e3c00ffc13ae6456cd3691', 'cee7e196-937b-4985-8016-07cf77c8f35b', '65e3654dfc13ae0e3fcd36e4', 28, '$2560.33', '2023-12-12 21:20:42'),
  ('65e3c00ffc13ae6456cd3692', 'b025f973-1eb4-446d-b4c1-7ce9c3fced9d', '65e3654dfc13ae0e3fcd36ce', 49, '$8457.64', '2024-01-23 20:35:07'),
  ('65e3c00ffc13ae6456cd3693', '1a9288dd-e1b8-48fc-9d38-241d0738098f', '65e3654dfc13ae0e3fcd36d0', 76, '$5543.94', '2024-02-17 19:50:21'),
  ('65e3c00ffc13ae6456cd3694', 'bf8a4973-2408-4c40-8483-39c225743570', '65e3654dfc13ae0e3fcd36d2', 26, '$6264.03', '2023-08-25 02:49:00'),
  ('65e3c00ffc13ae6456cd3695', 'cf7ab4b4-6779-4463-b518-2f1a104816ef', '65e3654dfc13ae0e3fcd36d4', 22, '$3000.17', '2023-08-08 21:36:13'),
  ('65e3c00ffc13ae6456cd3696', 'c81d3a27-6e3e-4ebf-89fb-f3fc9c3ab63d', '65e3654dfc13ae0e3fcd370e', 92, '$4683.48', '2023-08-26 15:16:39');

	
CREATE TABLE dbo.MusicianSpeciality(
  specialty_ID varchar(50) NOT NULL PRIMARY KEY,
  specialty_desc varchar(1000),
);
	
insert into MusicianSpeciality (specialty_ID, specialty_desc) values
  ('65e42642fc13ae3278cd3aca', 'lead vocal'),
  ('65e42642fc13ae3278cd3acb', 'chorus vocal'),
  ('65e42642fc13ae3278cd3acc', 'song composer'),
  ('65e42642fc13ae3278cd3acd', 'lyrics writer'),
  ('65e42642fc13ae3278cd3ace', 'arrangement'),
  ('65e42642fc13ae3278cd3acf', 'guitar'),
  ('65e42642fc13ae3278cd3ad0', 'bass'),
  ('65e42642fc13ae3278cd3ad1', 'drum'),
  ('65e42642fc13ae3278cd3ad2', 'piano'),
  ('65e42642fc13ae3278cd3ad3', 'violin');

CREATE TABLE dbo.Label(
	label_ID INT NOT NULL PRIMARY KEY,
	label_name varchar(50) NOT NULL,
	label_desc varchar(1000)
);

-- Insert data into dbo.Label
INSERT INTO dbo.Label (label_ID, label_name) VALUES 
  ('65e36c1efc13ae0ea2cd3f16', 'Acoustic Arts'),
  ('65e36c1efc13ae0ea2cd3f17', 'Cadence Creations'),
  ('65e36c1efc13ae0ea2cd3f18', 'Harmonic Harmony'),
  ('65e36c1efc13ae0ea2cd3f19', 'Harmonize Harmony'),
  ('65e36c1efc13ae0ea2cd3f1a', 'Harmonize Records'),
  ('65e36c1efc13ae0ea2cd3f1b', 'Harmony Records'),
  ('65e36c1efc13ae0ea2cd3f1c', 'Melodic Muse'),
  ('65e36c1efc13ae0ea2cd3f1d', 'Melody Productions'),
  ('65e36c1efc13ae0ea2cd3f1e', 'Muse Music'),
  ('65e36c1efc13ae0ea2cd3f1f', 'NoteWorthy Records'),
  ('65e36c1efc13ae0ea2cd3f20', 'Pulse Music Group'),
  ('65e36c1efc13ae0ea2cd3f21', 'Rhythm Records'),
  ('65e36c1efc13ae0ea2cd3f22', 'Rhythmic Records'),
  ('65e36c1efc13ae0ea2cd3f23', 'Sonic Sounds'),
  ('65e36c1efc13ae0ea2cd3f24', 'Sonic Symphony'),
  ('65e36c1efc13ae0ea2cd3f25', 'Symphony Sounds'),
  ('65e36c1efc13ae0ea2cd3f26', 'Symphony Studios'),
  ('65e36c1efc13ae0ea2cd3f27', 'TuneTown Music'),
  ('65e36c1efc13ae0ea2cd3f28', 'Vibe Valley'),
  ('65e36c1efc13ae0ea2cd3f29', 'Vibe Vibes');

CREATE TABLE dbo.Product(
	product_ID varchar(50) NOT NULL PRIMARY KEY,
	product_price DECIMAL(10,2) NOT NULL,
	label_ID varchar(50) NOT NULL REFERENCES Label(label_ID)
);

-- Insert data into dbo.Product
INSERT INTO dbo.Product (product_ID, product_price, label_ID) VALUES 
  ('65e3654dfc13ae0e3fcd36da', 0.99, '65e36c1efc13ae0ea2cd3f16'),
  ('65e3654dfc13ae0e3fcd36dc', 0.99, '65e36c1efc13ae0ea2cd3f16'),
  ('65e3654dfc13ae0e3fcd36f2', 0.99, '65e36c1efc13ae0ea2cd3f16'),
  ('65e3654dfc13ae0e3fcd36e6', 0.99, '65e36c1efc13ae0ea2cd3f17'),
  ('65e3654dfc13ae0e3fcd36e4', 0.99, '65e36c1efc13ae0ea2cd3f17'),
  ('65e3654dfc13ae0e3fcd36ce', 0.99, '65e36c1efc13ae0ea2cd3f18'),
  ('65e3654dfc13ae0e3fcd36d0', 0.99, '65e36c1efc13ae0ea2cd3f18'),
  ('65e3654dfc13ae0e3fcd36d2', 0.99, '65e36c1efc13ae0ea2cd3f18'),
  ('65e3654dfc13ae0e3fcd36d4', 0.99, '65e36c1efc13ae0ea2cd3f18'),
  ('65e3654dfc13ae0e3fcd370e', 0.99, '65e36c1efc13ae0ea2cd3f18'),
  ('65e3654dfc13ae0e3fcd36ea', 0.99, '65e36c1efc13ae0ea2cd3f19'),
  ('65e3654dfc13ae0e3fcd36d6', 0.99, '65e36c1efc13ae0ea2cd3f1a'),
  ('65e3654dfc13ae0e3fcd36d8', 0.99, '65e36c1efc13ae0ea2cd3f1a'),
  ('65e3654dfc13ae0e3fcd36ec', 0.99, '65e36c1efc13ae0ea2cd3f1a'),
  ('65e3654dfc13ae0e3fcd36fe', 0.99, '65e36c1efc13ae0ea2cd3f1a'),
  ('65e3654dfc13ae0e3fcd36ca', 0.99, '65e36c1efc13ae0ea2cd3f1b'),
  ('65e3654dfc13ae0e3fcd36de', 0.99, '65e36c1efc13ae0ea2cd3f1b'),
  ('65e3654dfc13ae0e3fcd36c4', 0.99, '65e36c1efc13ae0ea2cd3f1b'),
  ('65e3654dfc13ae0e3fcd36c6', 0.99, '65e36c1efc13ae0ea2cd3f1b'),
  ('65e3654dfc13ae0e3fcd36c8', 0.99, '65e36c1efc13ae0ea2cd3f1b'),
  ('65e3654dfc13ae0e3fcd36cc', 0.99, '65e36c1efc13ae0ea2cd3f1c'),
  ('65e3654dfc13ae0e3fcd3706', 0.99, '65e36c1efc13ae0ea2cd3f1c'),
  ('65e3654dfc13ae0e3fcd36f6', 0.99, '65e36c1efc13ae0ea2cd3f1d'),
  ('65e3654dfc13ae0e3fcd36fc', 0.99, '65e36c1efc13ae0ea2cd3f1e'),
  ('65e3654dfc13ae0e3fcd36fa', 0.99, '65e36c1efc13ae0ea2cd3f1e'),
  ('65e3654dfc13ae0e3fcd36c0', 0.99, '65e36c1efc13ae0ea2cd3f1f'),
  ('65e3654dfc13ae0e3fcd36f8', 0.99, '65e36c1efc13ae0ea2cd3f1f'),
  ('65e3654dfc13ae0e3fcd3700', 0.99, '65e36c1efc13ae0ea2cd3f20'),
  ('65e3654dfc13ae0e3fcd36e2', 0.99, '65e36c1efc13ae0ea2cd3f20'),
  ('65e3654dfc13ae0e3fcd36e0', 0.99, '65e36c1efc13ae0ea2cd3f21'),
  ('65e3654dfc13ae0e3fcd36e8', 0.99, '65e36c1efc13ae0ea2cd3f22'),
  ('65e3654dfc13ae0e3fcd3702', 0.99, '65e36c1efc13ae0ea2cd3f23'),
  ('65e3654dfc13ae0e3fcd3704', 0.99, '65e36c1efc13ae0ea2cd3f23'),
  ('65e3654dfc13ae0e3fcd36ee', 0.99, '65e36c1efc13ae0ea2cd3f24'),
  ('65e3654dfc13ae0e3fcd370a', 0.99, '65e36c1efc13ae0ea2cd3f24'),
  ('65e3654dfc13ae0e3fcd370c', 0.99, '65e36c1efc13ae0ea2cd3f25'),
  ('65e3654dfc13ae0e3fcd36c2', 0.99, '65e36c1efc13ae0ea2cd3f26'),
  ('65e3654dfc13ae0e3fcd36f0', 0.99, '65e36c1efc13ae0ea2cd3f27'),
  ('65e3654dfc13ae0e3fcd3708', 0.99, '65e36c1efc13ae0ea2cd3f28'),
  ('65e3654dfc13ae0e3fcd36f4', 0.99, '65e36c1efc13ae0ea2cd3f29'),
  ('65e3686cfc13ae0f5ecd4252', 2.99, '65e36c1efc13ae0ea2cd3f16'),
  ('65e3686cfc13ae0f5ecd4245', 2.99, '65e36c1efc13ae0ea2cd3f16'),
  ('65e3686cfc13ae0f5ecd423f', 2.99, '65e36c1efc13ae0ea2cd3f17'),
  ('65e3686cfc13ae0f5ecd423e', 2.99, '65e36c1efc13ae0ea2cd3f17'),
  ('65e3686cfc13ae0f5ecd4239', 2.99, '65e36c1efc13ae0ea2cd3f18'),
  ('65e3686cfc13ae0f5ecd4251', 2.99, '65e36c1efc13ae0ea2cd3f18'),
  ('65e3686cfc13ae0f5ecd4241', 2.99, '65e36c1efc13ae0ea2cd3f19'),
  ('65e3686cfc13ae0f5ecd423a', 2.99, '65e36c1efc13ae0ea2cd3f1a'),
  ('65e3686cfc13ae0f5ecd4242', 2.99, '65e36c1efc13ae0ea2cd3f1a'),
  ('65e3686cfc13ae0f5ecd424a', 2.99, '65e36c1efc13ae0ea2cd3f1a'),
  ('65e3686cfc13ae0f5ecd4338', 2.99, '65e36c1efc13ae0ea2cd3f1b'),
  ('65e3686cfc13ae0f5ecd423b', 2.99, '65e36c1efc13ae0ea2cd3f1b'),
  ('65e3686cfc13ae0f5ecd4237', 2.99, '65e36c1efc13ae0ea2cd3f1b'),
  ('65e3686cfc13ae0f5ecd4238', 2.99, '65e36c1efc13ae0ea2cd3f1c'),
  ('65e3686cfc13ae0f5ecd424d', 2.99, '65e36c1efc13ae0ea2cd3f1c'),
  ('65e3686cfc13ae0f5ecd4247', 2.99, '65e36c1efc13ae0ea2cd3f1d'),
  ('65e3686cfc13ae0f5ecd4249', 2.99, '65e36c1efc13ae0ea2cd3f1e'),
  ('65e3686cfc13ae0f5ecd4248', 2.99, '65e36c1efc13ae0ea2cd3f1e'),
  ('65e3686cfc13ae0f5ecd4236', 2.99, '65e36c1efc13ae0ea2cd3f1f'),
  ('65e3686cfc13ae0f5ecd4347', 2.99, '65e36c1efc13ae0ea2cd3f1f'),
  ('65e3686cfc13ae0f5ecd424b', 2.99, '65e36c1efc13ae0ea2cd3f20'),
  ('65e3686cfc13ae0f5ecd423d', 2.99, '65e36c1efc13ae0ea2cd3f20'),
  ('65e3686cfc13ae0f5ecd423c', 2.99, '65e36c1efc13ae0ea2cd3f21'),
  ('65e3686cfc13ae0f5ecd4240', 2.99, '65e36c1efc13ae0ea2cd3f22'),
  ('65e3686cfc13ae0f5ecd424c', 2.99, '65e36c1efc13ae0ea2cd3f23'),
  ('65e3686cfc13ae0f5ecd4243', 2.99, '65e36c1efc13ae0ea2cd3f24'),
  ('65e3686cfc13ae0f5ecd424f', 2.99, '65e36c1efc13ae0ea2cd3f24'),
  ('65e3686cfc13ae0f5ecd4250', 2.99, '65e36c1efc13ae0ea2cd3f25'),
  ('65e3686cfc13ae0f5ecd4336', 2.99, '65e36c1efc13ae0ea2cd3f26'),
  ('65e3686cfc13ae0f5ecd4244', 2.99, '65e36c1efc13ae0ea2cd3f27'),
  ('65e3686cfc13ae0f5ecd424e', 2.99, '65e36c1efc13ae0ea2cd3f28'),
  ('65e3686cfc13ae0f5ecd4246', 2.99, '65e36c1efc13ae0ea2cd3f29');

CREATE TABLE dbo.Album(
	album_ID INT NOT NULL PRIMARY KEY,
	product_ID INT NOT NULL REFERENCES Product(product_ID),
	album_release_date DATE NOT NULL,
	album_desc varchar(1000)
);

-- Insert data into dbo.Album
INSERT INTO dbo.Album (album_ID, product_ID, alumb_name, album_release_date) VALUES 
  ('65e36722fc13ae0f07cd3a6b', '65e3686cfc13ae0f5ecd4252', 'Future Nostalgia', '1980-11-18'),
  ('65e367a3fc13ae0dd8cd3a76', '65e3686cfc13ae0f5ecd4245', 'Astronomia', '2001-02-25'),
  ('65e367a3fc13ae0dd8cd3a70', '65e3686cfc13ae0f5ecd423f', 'Beauty And A Beat', '2018-02-06'),
  ('65e367a3fc13ae0dd8cd3a6f', '65e3686cfc13ae0f5ecd423e', 'Being Good Is Boring', '1986-08-23'),
  ('65e36722fc13ae0f07cd3a69', '65e3686cfc13ae0f5ecd4239', 'Planet Her', '2010-06-16'),
  ('65e367a3fc13ae0dd8cd3a82', '65e3686cfc13ae0f5ecd4251', '1, 2, 3 (feat. Jason Derulo & De La Ghetto)', '2011-06-02'),
  ('65e367a3fc13ae0dd8cd3a72', '65e3686cfc13ae0f5ecd4241', 'Banana (feat. Shaggy) [DJ FLe - Minisiren Remix]', '2019-06-24'),
  ('65e36722fc13ae0f07cd3a6a', '65e3686cfc13ae0f5ecd423a', 'On My Way', '1982-11-27'),
  ('65e367a3fc13ae0dd8cd3a73', '65e3686cfc13ae0f5ecd4242', 'Bag Raiders (Deluxe)', '1998-02-27'),
  ('65e367a3fc13ae0dd8cd3a7b', '65e3686cfc13ae0f5ecd424a', 'AMG', '2020-09-19'),
  ('65e36722fc13ae0f07cd3a68', '65e3686cfc13ae0f5ecd4338', 'Say It Right', '2002-01-02'),
  ('65e36722fc13ae0f07cd3a6c', '65e3686cfc13ae0f5ecd423b', 'Forever', '1986-09-06'),
  ('65e36722fc13ae0f07cd3a67', '65e3686cfc13ae0f5ecd4237', 'Shoot For The Stars Aim For The Moon', '1988-04-28'),
  ('65e367a3fc13ae0dd8cd3a7e', '65e3686cfc13ae0f5ecd424d', 'Afraid To Feel', '2013-09-29'),
  ('65e367a3fc13ae0dd8cd3a78', '65e3686cfc13ae0f5ecd4247', 'As It Was', '1987-05-14'),
  ('65e367a3fc13ae0dd8cd3a7a', '65e3686cfc13ae0f5ecd4249', 'Apologize', '2011-06-14'),
  ('65e367a3fc13ae0dd8cd3a79', '65e3686cfc13ae0f5ecd4248', 'ARDIPITHECUS', '1980-05-09'),
  ('65e36722fc13ae0f07cd3a66', '65e3686cfc13ae0f5ecd4236', 'Without You', '1999-12-06'),
  ('65e367a3fc13ae0dd8cd3a7c', '65e3686cfc13ae0f5ecd424b', 'Ameno Amapiano Remix (You Wanna Bamba)', '1981-01-12'),
  ('65e367a3fc13ae0dd8cd3a6e', '65e3686cfc13ae0f5ecd423d', 'Best Friend (feat. Doja Cat) [Remix EP]', '1997-02-15'),
  ('65e367a3fc13ae0dd8cd3a6d', '65e3686cfc13ae0f5ecd423c', 'Forever', '1986-09-06'),
  ('65e367a3fc13ae0dd8cd3a71', '65e3686cfc13ae0f5ecd4240', 'Be Kind (with Halsey)', '2000-03-21'),
  ('65e367a3fc13ae0dd8cd3a7d', '65e3686cfc13ae0f5ecd424c', 'After Hours', '2000-05-27'),
  ('65e367a3fc13ae0dd8cd3a74', '65e3686cfc13ae0f5ecd4243', 'Bad Habits', '2008-07-30'),
  ('65e367a3fc13ae0dd8cd3a80', '65e3686cfc13ae0f5ecd424f', 'About Damn Time', '2001-05-05'),
  ('65e367a3fc13ae0dd8cd3a81', '65e3686cfc13ae0f5ecd4250', 'abcdefu', '1991-08-29'),
  ('65e367a3fc13ae0dd8cd3a75', '65e3686cfc13ae0f5ecd4244', 'Baby Girl', '2017-11-04'),
  ('65e367a3fc13ae0dd8cd3a7f', '65e3686cfc13ae0f5ecd424e', 'Aesthetic', '2022-06-24'),
  ('65e367a3fc13ae0dd8cd3a77', '65e3686cfc13ae0f5ecd4246', 'Astronaut In The Ocean', '1989-01-14');

CREATE TABLE dbo.Track(
	track_ID varchar(50) NOT NULL PRIMARY KEY,
	product_ID varchar(50) NOT NULL REFERENCES Product(product_ID),
	album_ID varchar(50) NOT NULL REFERENCES Album(album_ID),
	track_name varchar(50) NOT NULL,
	track_time TIME NOT NULL,
	track_release_date DATE NOT NULL,
	track_bpm INT NOT NULL
);

-- Insert data into dbo.Track
INSERT INTO dbo.Track (track_ID, product_ID, album_ID, track_name, track_time, track_release_date, track_bpm) VALUES 
  ('65e3654dfc13ae0e3fcd36d9', '65e3654dfc13ae0e3fcd36da', '65e36722fc13ae0f07cd3a6b', 'Levitating (feat. DaBaby)', '0:02:38', '1980-11-18', 103),
  ('65e3654dfc13ae0e3fcd36db', '65e3654dfc13ae0e3fcd36dc', '65e36722fc13ae0f07cd3a6b', 'Break My Heart', '0:03:41', '1980-11-18', 113),
  ('65e3654dfc13ae0e3fcd36f1', '65e3654dfc13ae0e3fcd36f2', '65e367a3fc13ae0dd8cd3a76', 'Astronomia', '0:03:18', '2001-02-25', 126),
  ('65e3654dfc13ae0e3fcd36e5', '65e3654dfc13ae0e3fcd36e6', '65e367a3fc13ae0dd8cd3a70', 'Beauty And A Beat', '0:02:18', '2018-02-06', 128),
  ('65e3654dfc13ae0e3fcd36e3', '65e3654dfc13ae0e3fcd36e4', '65e367a3fc13ae0dd8cd3a6f', 'Being Good Is Boring', '0:02:40', '1986-08-23', 112),
  ('65e3654dfc13ae0e3fcd36cd', '65e3654dfc13ae0e3fcd36ce', '65e36722fc13ae0f07cd3a69', 'Woman', '0:02:52', '2010-06-16', 108),
  ('65e3654dfc13ae0e3fcd36cf', '65e3654dfc13ae0e3fcd36d0', '65e36722fc13ae0f07cd3a69', 'Need to Know', '0:03:30', '2010-06-16', 130),
  ('65e3654dfc13ae0e3fcd36d1', '65e3654dfc13ae0e3fcd36d2', '65e36722fc13ae0f07cd3a69', 'Aint Shit', '0:02:54', '2010-06-16', 124),
  ('65e3654dfc13ae0e3fcd36d3', '65e3654dfc13ae0e3fcd36d4', '65e36722fc13ae0f07cd3a69', 'You Right', '0:03:06', '2010-06-16', 129),
  ('65e3654dfc13ae0e3fcd370d', '65e3654dfc13ae0e3fcd370e', '65e367a3fc13ae0dd8cd3a82', '1, 2, 3 (feat. Jason Derulo & De La Ghetto)', '0:03:21', '2011-06-02', 95),
  ('65e3654dfc13ae0e3fcd36e9', '65e3654dfc13ae0e3fcd36ea', '65e367a3fc13ae0dd8cd3a72', 'Banana (feat. Shaggy) - DJ FLe - Minisiren Remix', '0:03:30', '2019-06-24', 95),
  ('65e3654dfc13ae0e3fcd36d5', '65e3654dfc13ae0e3fcd36d6', '65e36722fc13ae0f07cd3a6a', 'When Hello Means Goodbye', '0:02:38', '1982-11-27', 166),
  ('65e3654dfc13ae0e3fcd36d7', '65e3654dfc13ae0e3fcd36d8', '65e36722fc13ae0f07cd3a6a', 'On My Way', '0:03:20', '1982-11-27', 96),
  ('65e3654dfc13ae0e3fcd36eb', '65e3654dfc13ae0e3fcd36ec', '65e367a3fc13ae0dd8cd3a73', 'Shooting Stars', '0:03:55', '1998-02-27', 125),
  ('65e3654dfc13ae0e3fcd36fd', '65e3654dfc13ae0e3fcd36fe', '65e367a3fc13ae0dd8cd3a7b', 'AMG', '0:02:15', '2020-09-19', 88),
  ('65e3654dfc13ae0e3fcd36c9', '65e3654dfc13ae0e3fcd36ca', '65e36722fc13ae0f07cd3a68', 'Say It Right', '0:02:09', '2002-01-02', 124),
  ('65e3654dfc13ae0e3fcd36dd', '65e3654dfc13ae0e3fcd36de', '65e36722fc13ae0f07cd3a6c', 'Forever', '0:03:01', '1986-09-06', 124),
  ('65e3654dfc13ae0e3fcd36c3', '65e3654dfc13ae0e3fcd36c4', '65e36722fc13ae0f07cd3a67', 'What You Know Bout Love', '0:02:40', '1988-04-28', 84),
  ('65e3654dfc13ae0e3fcd36c5', '65e3654dfc13ae0e3fcd36c6', '65e36722fc13ae0f07cd3a67', 'Mood Swings (feat. Lil Tjay)', '0:03:33', '1988-04-28', 180),
  ('65e3654dfc13ae0e3fcd36c7', '65e3654dfc13ae0e3fcd36c8', '65e36722fc13ae0f07cd3a67', 'For The Night (feat. Lil Baby & DaBaby)', '0:03:10', '1988-04-28', 126),
  ('65e3654dfc13ae0e3fcd36cb', '65e3654dfc13ae0e3fcd36cc', '65e36722fc13ae0f07cd3a68', 'Say It Right', '0:02:08', '2002-01-02', 126),
  ('65e3654dfc13ae0e3fcd3705', '65e3654dfc13ae0e3fcd3706', '65e367a3fc13ae0dd8cd3a7e', 'Afraid To Feel', '0:02:57', '2013-09-29', 128),
  ('65e3654dfc13ae0e3fcd36f5', '65e3654dfc13ae0e3fcd36f6', '65e367a3fc13ae0dd8cd3a78', 'As It Was', '0:02:47', '1987-05-14', 174),
  ('65e3654dfc13ae0e3fcd36fb', '65e3654dfc13ae0e3fcd36fc', '65e367a3fc13ae0dd8cd3a7a', 'Apologize', '0:02:09', '2011-06-14', 126),
  ('65e3654dfc13ae0e3fcd36f9', '65e3654dfc13ae0e3fcd36fa', '65e367a3fc13ae0dd8cd3a79', 'Wait a Minute!', '0:03:16', '1980-05-09', 101),
  ('65e3654dfc13ae0e3fcd36bf', '65e3654dfc13ae0e3fcd36c0', '65e36722fc13ae0f07cd3a66', 'Without You', '0:03:02', '1999-12-06', 125),
  ('65e3654dfc13ae0e3fcd36f7', '65e3654dfc13ae0e3fcd36f8', '65e367a3fc13ae0dd8cd3a78', 'As It Was', '0:02:04', '1987-05-14', 105),
  ('65e3654dfc13ae0e3fcd36ff', '65e3654dfc13ae0e3fcd3700', '65e367a3fc13ae0dd8cd3a7c', 'Ameno Amapiano Remix (You Wanna Bamba)', '0:03:47', '1981-01-12', 113),
  ('65e3654dfc13ae0e3fcd36e1', '65e3654dfc13ae0e3fcd36e2', '65e367a3fc13ae0dd8cd3a6e', 'Best Friend (feat. Doja Cat)', '0:02:35', '1997-02-15', 94),
  ('65e3654dfc13ae0e3fcd36df', '65e3654dfc13ae0e3fcd36e0', '65e367a3fc13ae0dd8cd3a6d', 'Forever', '0:02:47', '1986-09-06', 125),
  ('65e3654dfc13ae0e3fcd36e7', '65e3654dfc13ae0e3fcd36e8', '65e367a3fc13ae0dd8cd3a71', 'Be Kind (with Halsey)', '0:02:52', '2000-03-21', 94),
  ('65e3654dfc13ae0e3fcd3701', '65e3654dfc13ae0e3fcd3702', '65e367a3fc13ae0dd8cd3a7d', 'Blinding Lights', '0:03:20', '2000-05-27', 171),
  ('65e3654dfc13ae0e3fcd370b', '65e3654dfc13ae0e3fcd3704', '65e367a3fc13ae0dd8cd3a7d', 'In Your Eyes', '0:03:57', '2000-05-27', 100), -- track_ID is duplicate
  ('65e3654dfc13ae0e3fcd36ed', '65e3654dfc13ae0e3fcd36ee', '65e367a3fc13ae0dd8cd3a74', 'Bad Habits', '0:03:51', '2008-07-30', 126),
  ('65e3654dfc13ae0e3fcd3709', '65e3654dfc13ae0e3fcd370a', '65e367a3fc13ae0dd8cd3a80', 'About Damn Time', '0:03:11', '2001-05-05', 109),
  ('65e3654dfc13ae0e3fcd370b', '65e3654dfc13ae0e3fcd370c', '65e367a3fc13ae0dd8cd3a81', 'abcdefu', '0:02:48', '1991-08-29', 122), -- with this one.
  ('65e3654dfc13ae0e3fcd36c1', '65e3654dfc13ae0e3fcd36c2', '65e36722fc13ae0f07cd3a66', 'Without You', '0:02:12', '1999-12-06', 120),
  ('65e3654dfc13ae0e3fcd36ef', '65e3654dfc13ae0e3fcd36f0', '65e367a3fc13ae0dd8cd3a75', 'Baby Girl', '0:01:51', '2017-11-04', 121),
  ('65e3654dfc13ae0e3fcd3707', '65e3654dfc13ae0e3fcd3708', '65e367a3fc13ae0dd8cd3a7f', 'Aesthetic', '0:02:38', '2022-06-24', 170),
  ('65e3654dfc13ae0e3fcd36f3', '65e3654dfc13ae0e3fcd36f4', '65e367a3fc13ae0dd8cd3a77', 'Astronaut In The Ocean', '0:02:12', '1989-01-14', 150);

-- abcdefu track_ID should be 65e3654dfc13ae0e3fcd36bf

 --Adding the Playlist Inclusiveness, Playlist, Track Genre, and Genre Tables
 CREATE TABLE dbo.Playlist(
  playlist_ID varchar(50) NOT NULL PRIMARY KEY,
  user_ID varchar(50) NOT NULL,
  playlist_name varchar(50) NOT NULL, 
  playlist_desc varchar(1000),
  CONSTRAINT FKPlaylist FOREIGN KEY (user_ID)
    REFERENCES dbo.[User](user_ID)
 )
INSERT INTO dbo.Playlist (playlist_id, user_id, playlist_name, playlist_desc) VALUES
  ('20230304120000-e72c000650a647178993128613423d55', 'e72c0006-50a6-4717-8993-128613423d55', 'Music For My Friends', 'Songs that remind me of my special buds'),
  ('20230220120001-00a05fed3b5441a18dad0322727a78da', '00a05fed-3b54-41a1-8dad-0322727a78da', 'Sunny Day Summer Tunes', 'Lapping waves and sun drenched skin'),
  ('20230125120002-6efa23ec3bd04b82b631962f416384a8', '6efa23ec-3bd0-4b82-b631-962f416384a8', 'Sonic Journal- Winter of 23', NULL),
  ('20230717120003-15c36c9a6d344cb88799a7089b36fa09', '15c36c9a-6d34-4cb8-8799-a7089b36fa09', 'Kaleidoscope', 'This playlist is a reflection of my ever-changing tastes and eclectic musical journey. Just like a kaleidoscope, it\'s a vibrant mix of colors and patterns, with each song offering a different perspective and taking me on a new adventure.'),
  ('20230211120004-b025f9731eb4446db4c17ce9c3fced9d', 'b025f973-1eb4-446d-b4c1-7ce9c3fced9d', 'Evening Unwind', 'These tracks are my sanctuary, filled with gentle melodies and soothing harmonies that help me unwind, reflect, and find peace amidst the chaos'),
  ('20230118120005-4ed2412d60844c359077f0eb8d9dc374', '4ed2412d-6084-4c35-9077-f0eb8d9dc374', 'Groovy Vibes', 'Funky playlist filled with infectious rhythms and soulful beats- let these groovy vibes lift your spirits and move your feet.'),
  ('20230212120006-cee7e196937b4985801607cf77c8f35b', 'cee7e196-937b-4985-8016-07cf77c8f35b', 'Alone on Valentine''s Day', 'Being alone doesn''t mean being lonely, and self-love is just as important as any other kind'),
  ('20230426120007-9c5ee840c8b24d5886c7d87c5aac04f1', '9c5ee840-c8b2-4d58-86c7-d87c5aac04f1', 'Ultimate Roadtrip Playlist', 'This playlist is the soundtrack to my adventures, fueling every mile with excitement and anticipation. Whether I''m cruising down open highways or winding through scenic backroads, these songs are my faithful companions, making every journey unforgettable'),
  ('20230312120008-fdb29741d9ba4019af9f5d869290af2e', 'fdb29741-d9ba-4019-af9f-5d869290af2e', 'Baby, this is Keke Palmer', 'Harness the power of Keke''s confidence and glow with these booty popping anthems'),
  ('20230601120009-1a9288dde1b848fc9d38241d0738098f', '1a9288dd-e1b8-48fc-9d38-241d0738098f', 'Plantasia Reloaded', 'Close your eyes and imagine yourself surrounded by lush greenery, birds chirping, and the scent of flowers in the air. Escape the hustle and bustle of everyday life and reconnect with nature''s beauty.');

 CREATE TABLE dbo.PlaylistInclusiveness(
  playlist_ID varchar(50) NOT NULL,
  track_ID varchar(50) NOT NULL,
  CONSTRAINT FK1PlaylistInclusiveness FOREIGN KEY (playlist_ID)
    REFERENCES dbo.Playlist(playlist_ID),
  CONSTRAINT FK2PlaylistInclusiveness FOREIGN KEY (track_ID)
    REFERENCES dbo.Track(track_ID),
  CONSTRAINT PKPlaylistInclusiveness PRIMARY KEY CLUSTERED (playlist_ID, track_ID)
 ) 

INSERT INTO dbo.PlaylistInclusiveness (playlist_id, track_id) VALUES 
  ('20230304120000-e72c000650a647178993128613423d55', '65e3654dfc13ae0e3fcd36d9'),
  ('20230304120000-e72c000650a647178993128613423d55', '65e3654dfc13ae0e3fcd36db'),
  ('20230304120000-e72c000650a647178993128613423d55', '65e3654dfc13ae0e3fcd36f1'),
  ('20230304120000-e72c000650a647178993128613423d55', '65e3654dfc13ae0e3fcd36e5'),
  ('20230304120000-e72c000650a647178993128613423d55', '65e3654dfc13ae0e3fcd36e3'),

  ('20230220120001-00a05fed3b5441a18dad0322727a78da', '65e3654dfc13ae0e3fcd36cd'),
  ('20230220120001-00a05fed3b5441a18dad0322727a78da', '65e3654dfc13ae0e3fcd36cf'),
  ('20230220120001-00a05fed3b5441a18dad0322727a78da', '65e3654dfc13ae0e3fcd36d1'),
  ('20230220120001-00a05fed3b5441a18dad0322727a78da', '65e3654dfc13ae0e3fcd36d3'),
  ('20230220120001-00a05fed3b5441a18dad0322727a78da', '65e3654dfc13ae0e3fcd36d5'),

  ('20230125120002-6efa23ec3bd04b82b631962f416384a8', '65e3654dfc13ae0e3fcd36d7'),
  ('20230125120002-6efa23ec3bd04b82b631962f416384a8', '65e3654dfc13ae0e3fcd36eb'),
  ('20230125120002-6efa23ec3bd04b82b631962f416384a8', '65e3654dfc13ae0e3fcd36d9'),
  ('20230125120002-6efa23ec3bd04b82b631962f416384a8', '65e3654dfc13ae0e3fcd36db'),
  ('20230125120002-6efa23ec3bd04b82b631962f416384a8', '65e3654dfc13ae0e3fcd36f1'),

  ('20230717120003-15c36c9a6d344cb88799a7089b36fa09', '65e3654dfc13ae0e3fcd3701'),
  ('20230717120003-15c36c9a6d344cb88799a7089b36fa09', '65e3654dfc13ae0e3fcd3703'),
  ('20230717120003-15c36c9a6d344cb88799a7089b36fa09', '65e3654dfc13ae0e3fcd3705'),
  ('20230717120003-15c36c9a6d344cb88799a7089b36fa09', '65e3654dfc13ae0e3fcd3707'),
  ('20230717120003-15c36c9a6d344cb88799a7089b36fa09', '65e3654dfc13ae0e3fcd3709'),

  ('20230601120009-1a9288dde1b848fc9d38241d0738098f', '65e3654dfc13ae0e3fcd370b'),
  ('20230601120009-1a9288dde1b848fc9d38241d0738098f', '65e3654dfc13ae0e3fcd370d'),
  ('20230601120009-1a9288dde1b848fc9d38241d0738098f', '65e3654dfc13ae0e3fcd36c1'),
  ('20230601120009-1a9288dde1b848fc9d38241d0738098f', '65e3654dfc13ae0e3fcd36c3'),
  ('20230601120009-1a9288dde1b848fc9d38241d0738098f', '65e3654dfc13ae0e3fcd36c5'),

  ('20230118120005-4ed2412d60844c359077f0eb8d9dc374', '65e3654dfc13ae0e3fcd36c7'),
  ('20230118120005-4ed2412d60844c359077f0eb8d9dc374', '65e3654dfc13ae0e3fcd36cb'),
  ('20230118120005-4ed2412d60844c359077f0eb8d9dc374', '65e3654dfc13ae0e3fcd36cf'),
  ('20230118120005-4ed2412d60844c359077f0eb8d9dc374', '65e3654dfc13ae0e3fcd36d1'),
  ('20230118120005-4ed2412d60844c359077f0eb8d9dc374', '65e3654dfc13ae0e3fcd36d3');
 
CREATE TABLE dbo.Genre(
  genre_ID varchar(50) NOT NULL PRIMARY KEY,
  genre_desc varchar(50) NOT NULL
)

INSERT INTO dbo.Genre (genre_ID, genre_desc) VALUES
  ('GEN001', 'Pop'),
  ('GEN002', 'Rock'),
  ('GEN003', 'Hip Hop'),
  ('GEN004', 'Euro Pop'),
  ('GEN005', 'Blues'),
  ('GEN006', 'Electronic'),
  ('GEN007', 'R&B (Rhythm and Blues)'),
  ('GEN008', 'Rap'),
  ('GEN009', 'Trap'),
  ('GEN010', 'Dance Pop'),
  ('GEN011', 'House'),
  ('GEN012', 'Indie'),
  ('GEN013', 'Down Tempo'),
  ('GEN014', 'Disco'),
  ('GEN015', 'Funk'),
  ('GEN016', 'Soul'),
  ('GEN017', 'Afrobeats'),
  ('GEN018', 'Garage'),
  ('GEN019', 'Alternative'),
  ('GEN020', 'Latin');

CREATE TABLE dbo.TrackGenre(
  genre_ID varchar(50) NOT NULL,
  track_ID varchar(50) NOT NULL,
  CONSTRAINT FK1TrackGenre FOREIGN KEY (genre_ID)
    REFERENCES dbo.Genre(genre_ID),
  CONSTRAINT FK2TrackGenre FOREIGN KEY (track_ID)
    REFERENCES dbo.Track(track_ID),
  CONSTRAINT PKTrackGenre PRIMARY KEY CLUSTERED (genre_ID, track_ID)
)

INSERT INTO dbo.TrackGenre (genre_id, track_id) VALUES
  ('GEN001', '65e3654dfc13ae0e3fcd36d9'),
  ('GEN006', '65e3654dfc13ae0e3fcd36db'),
  ('GEN008', '65e3654dfc13ae0e3fcd36f1'),
  ('GEN019', '65e3654dfc13ae0e3fcd36e5'),
  ('GEN012', '65e3654dfc13ae0e3fcd36e3'),
  ('GEN005', '65e3654dfc13ae0e3fcd36cd'),
  ('GEN018', '65e3654dfc13ae0e3fcd36cf'),
  ('GEN004', '65e3654dfc13ae0e3fcd36d1'),
  ('GEN002', '65e3654dfc13ae0e3fcd36d3'),
  ('GEN014', '65e3654dfc13ae0e3fcd370d'),
  ('GEN017', '65e3654dfc13ae0e3fcd36e9'),
  ('GEN009', '65e3654dfc13ae0e3fcd36d5'),
  ('GEN013', '65e3654dfc13ae0e3fcd36d7'),
  ('GEN020', '65e3654dfc13ae0e3fcd36eb'),
  ('GEN010', '65e3654dfc13ae0e3fcd36fd'),
  ('GEN016', '65e3654dfc13ae0e3fcd36c9'),
  ('GEN015', '65e3654dfc13ae0e3fcd36dd'),
  ('GEN003', '65e3654dfc13ae0e3fcd36c3'),
  ('GEN001', '65e3654dfc13ae0e3fcd36c5'),
  ('GEN007', '65e3654dfc13ae0e3fcd36c7'),
  ('GEN003', '65e3654dfc13ae0e3fcd36cb'),
  ('GEN013', '65e3654dfc13ae0e3fcd3705'),
  ('GEN019', '65e3654dfc13ae0e3fcd36f5'),
  ('GEN018', '65e3654dfc13ae0e3fcd36fb'),
  ('GEN006', '65e3654dfc13ae0e3fcd36f9'),
  ('GEN008', '65e3654dfc13ae0e3fcd36bf'),
  ('GEN004', '65e3654dfc13ae0e3fcd36f7'),
  ('GEN019', '65e3654dfc13ae0e3fcd36ff'),
  ('GEN020', '65e3654dfc13ae0e3fcd36e1'),
  ('GEN015', '65e3654dfc13ae0e3fcd36df'),
  ('GEN016', '65e3654dfc13ae0e3fcd36e7'),
  ('GEN005', '65e3654dfc13ae0e3fcd3701'),
  ('GEN002', '65e3654dfc13ae0e3fcd3703'),
  ('GEN017', '65e3654dfc13ae0e3fcd36ed'),
  ('GEN010', '65e3654dfc13ae0e3fcd3709'),
  ('GEN011', '65e3654dfc13ae0e3fcd370b'),
  ('GEN014', '65e3654dfc13ae0e3fcd36c1'),
  ('GEN007', '65e3654dfc13ae0e3fcd36ef'),
  ('GEN012', '65e3654dfc13ae0e3fcd3707'),
  ('GEN001', '65e3654dfc13ae0e3fcd36f3');

-- Views
-- Find out how many purchases are made with each label
CREATE VIEW Purchase_Made_with_Each_Labels AS
SELECT l.label_id, l.label_name, SUM(ph.invoice_price) AS 'total'
FROM dbo.Label l INNER JOIN dbo.PurchaseHistory ph
ON l.product_ID = ph.product_ID
GROUP BY l.label_ID
ORDER BY SUM(ph.invoice_price)

-- Find out how many tracks belong to each genre
CREATE VIEW Num_of_Track_in_Each_Genre AS
SELECT g.genre_desc AS Genre, count(t.track_ID) AS Num_of_Track
FROM TrackGenre t
GROUP BY genre_ID
RIGHT JOIN Genre g ON t.genre_ID = g.genre_ID

-- Find out the Top 10 tracks liked by users
CREATE VIEW Top_10_Liked_Tracks AS
SELECT track_ID, COUNT(user_ID) AS total_likes
FROM LikeHistory
GROUP BY track_ID
ORDER BY total_likes DESC
LIMIT 10;

-- Find out the Top 10 tracks listened to by users
CREATE VIEW Top_10_Listened_Tracks AS
SELECT track_ID, COUNT(user_ID) AS total_listen
FROM ListenHistory
GROUP BY track_ID
ORDER BY total_listen DESC
LIMIT 10;


TEST:

-- Title: LIS 543 WI24 Team 3 Final Project
-- Author: Aaliyah Davis, Giselle Shannon, Yawen Guo, and Xinya Tang
-- Schema: dbo
--CREATE DATABASE Music_Streaming_Service;

USE Music_Streaming_Service;


CREATE TABLE dbo.[User](
  user_ID varchar(50) NOT NULL PRIMARY KEY,
  user_name varchar(50) NOT NULL,
  register_date DATE NOT NULL, -- 01/01/2023 - 07/31/2023
  last_login_date DATE NOT NULL, -- 08/01/2023 - today
  login_password varchar(50) NOT NULL,
  email_address varchar(50) NOT NULL,
  phone_number varchar(50) NOT NULL,
  profile_photo varchar(1000),
  profile_desc varchar(1000),
);

insert into dbo.[User] (user_ID, user_name, register_date, last_login_date, login_password, email_address, phone_number, profile_photo, profile_desc) values
  ('a4385066-147b-4560-9dc9-afd258c89791', 'drenac0', '3/4/2023', '10/28/2023', 'zG4</VI3K(4O{0=', 'vastman0@theglobeandmail.com', '809-893-0248', 'http://dummyimage.com/139x100.png/ff4444/ffffff', 'WCowtXzonxe4FW4gnMs88JqavN4j0Z8AYbwch9CLM6Er9Tt'),
  ('6f5b5567-cf20-433d-8287-5e32a86246b3', 'hmccusker1', '1/31/2023', '11/8/2023', 'vM2+=V@`0m', 'yearland1@java.com', '570-898-3953', 'http://dummyimage.com/154x100.png/5fa2dd/ffffff', 'mlo51aLbf8FFAs6WSCZak9whIcbumrGWLgh0SMZPACSfVcX'),
  ('e72c0006-50a6-4717-8993-128613423d55', 'dtwidle2', '1/29/2023', '12/17/2023', 'qI7_\lYHJSqL"i', 'lgergolet2@rediff.com', '893-684-0512', 'http://dummyimage.com/180x100.png/dddddd/000000', null),
  ('0e4e1497-ffb2-491b-97fe-8301154532a1', 'ldemeza3', '6/20/2023', '12/6/2023', 'xX4`K*Nwt', 'ppettitt3@youtube.com', '634-576-2899', null, null),
  ('6efa23ec-3bd0-4b82-b631-962f416384a8', 'bhaller4', '1/25/2023', '2/11/2024', 'iW0`7V''~4A\(/E', 'tduffet4@networksolutions.com', '108-561-3660', 'http://dummyimage.com/244x100.png/ff4444/ffffff', null),
  ('cee7e196-937b-4985-8016-07cf77c8f35b', 'dewin5', '2/12/2023', '10/6/2023', 'mA2|@k1vk_LNDc', 'pormshaw5@sourceforge.net', '292-788-5533', 'http://dummyimage.com/219x100.png/ff4444/ffffff', null),
  ('b025f973-1eb4-446d-b4c1-7ce9c3fced9d', 'rmcfeat6', '2/11/2023', '12/22/2023', 'dL2(dojT_?+V', 'npaull6@dion.ne.jp', '570-219-4494', 'http://dummyimage.com/245x100.png/5fa2dd/ffffff', 'rOVmeMfJoFtnMWXINdodxz2MLET35UPcQUfp6m6ATQPvkEJ'),
  ('1a9288dd-e1b8-48fc-9d38-241d0738098f', 'iherreran7', '6/1/2023', '10/20/2023', 'sU0<kd@$0JQ(Vg5h', 'ntoe7@example.com', '364-192-3730', null, null),
  ('bf8a4973-2408-4c40-8483-39c225743570', 'lgaskall8', '7/1/2023', '8/6/2023', 'kR2?GN<LzlV|CY/P', 'jjendrassik8@w3.org', '779-304-2773', 'http://dummyimage.com/169x100.png/dddddd/000000', null),
  ('cf7ab4b4-6779-4463-b518-2f1a104816ef', 'jhowtopreserve9', '1/4/2023', '1/15/2024', 'qL8}tpJ={f|moR>a', 'xmosby9@creativecommons.org', '599-620-8768', 'http://dummyimage.com/200x100.png/5fa2dd/ffffff', 'uTehSWYXQahOu46rh4sbJagOmSAITg7oRTB0pPjymOfDKv0'),
  ('9c5ee840-c8b2-4d58-86c7-d87c5aac04f1', 'fharwooda', '4/26/2023', '2/28/2024', 'gZ7$lCIxYU,r', 'svarfalameeva@mapquest.com', '713-152-8844', 'http://dummyimage.com/173x100.png/ff4444/ffffff', 'aCN75hGFZPnTwi4JaBzVNyWoEHldWgDelE1Hgf5sRFK6beI'),
  ('15c36c9a-6d34-4cb8-8799-a7089b36fa09', 'dricciardib', '7/17/2023', '11/16/2023', 'yN9@&)*GV', 'eleebeterb@youtube.com', '622-508-9780', null, null),
  ('796017c2-66ed-4865-8aef-9ef915a14307', 'jcockhillc', '4/9/2023', '9/7/2023', 'tE8.?qG%PI{P', 'oleytonc@reuters.com', '882-611-1320', null, null),
  ('c81d3a27-6e3e-4ebf-89fb-f3fc9c3ab63d', 'ddenned', '6/27/2023', '11/13/2023', 'iJ8?.rTEY+aI', 'mmargerisond@boston.com', '626-941-4393', 'http://dummyimage.com/107x100.png/dddddd/000000', null),
  ('6cbadc1f-1932-404f-b498-2f60b46424b5', 'bparmentere', '4/4/2023', '10/19/2023', 'nC8#J<G4\=', 'mjacobsene@ucsd.edu', '661-967-4128', null, null),
  ('122d6c4c-7de8-47b1-a314-69ad99c161fe', 'eoakinfoldf', '5/30/2023', '9/12/2023', 'dL4$A6QFsg`!|0', 'cbreinleinf@istockphoto.com', '769-988-4439', 'http://dummyimage.com/139x100.png/ff4444/ffffff', null),
  ('4ed2412d-6084-4c35-9077-f0eb8d9dc374', 'tlegroveg', '1/18/2023', '2/27/2024', 'hE8.jDPQZ', 'mthistletong@google.com', '683-190-2386', 'http://dummyimage.com/162x100.png/cc0000/ffffff', 'eE8jPeKnGztr3nEOU7MmIhE2teCEL0BwLEOstkkzpObnA4y'),
  ('fdb29741-d9ba-4019-af9f-5d869290af2e', 'ejonkh', '3/12/2023', '12/24/2023', 'gF8<B}`n9g_|1?Fw', 'minderh@auda.org.au', '910-671-9932', null, null),
  ('00a05fed-3b54-41a1-8dad-0322727a78da', 'fwilseyi', '2/20/2023', '11/15/2023', 'rC0>''k+FD`uJ', 'sprinni@theatlantic.com', '371-771-0838', 'http://dummyimage.com/228x100.png/cc0000/ffffff', null),
  ('0461fbf9-ce83-43d6-ab81-1ed014b16c3a', 'gfeehanj', '2/27/2023', '10/1/2023', 'pG9$eiH@iGz', 'lsmolanj@squarespace.com', '611-504-0233', 'http://dummyimage.com/151x100.png/cc0000/ffffff', 'fkxxgnQKZ2OVeCR0O7aK5chEc0BkTu1yDldSKsYXQufo1aD');


CREATE TABLE dbo.[MusicianSpeciality](
  specialty_ID varchar(50) NOT NULL PRIMARY KEY,
  specialty_desc varchar(1000),
);
	
insert into dbo.[MusicianSpeciality] (specialty_ID, specialty_desc) values
  ('65e42642fc13ae3278cd3aca', 'lead vocal'),
  ('65e42642fc13ae3278cd3acb', 'chorus vocal'),
  ('65e42642fc13ae3278cd3acc', 'song composer'),
  ('65e42642fc13ae3278cd3acd', 'lyrics writer'),
  ('65e42642fc13ae3278cd3ace', 'arrangement'),
  ('65e42642fc13ae3278cd3acf', 'guitar'),
  ('65e42642fc13ae3278cd3ad0', 'bass'),
  ('65e42642fc13ae3278cd3ad1', 'drum'),
  ('65e42642fc13ae3278cd3ad2', 'piano'),
  ('65e42642fc13ae3278cd3ad3', 'violin');

	

CREATE TABLE dbo.[Label](
  label_ID varchar(50) NOT NULL PRIMARY KEY,
  label_name varchar(50) NOT NULL
);

-- Insert data into dbo.Label
INSERT INTO dbo.[Label] (label_ID, label_name) VALUES 
  ('65e36c1efc13ae0ea2cd3f16', 'Acoustic Arts'),
  ('65e36c1efc13ae0ea2cd3f17', 'Cadence Creations'),
  ('65e36c1efc13ae0ea2cd3f18', 'Harmonic Harmony'),
  ('65e36c1efc13ae0ea2cd3f19', 'Harmonize Harmony'),
  ('65e36c1efc13ae0ea2cd3f1a', 'Harmonize Records'),
  ('65e36c1efc13ae0ea2cd3f1b', 'Harmony Records'),
  ('65e36c1efc13ae0ea2cd3f1c', 'Melodic Muse'),
  ('65e36c1efc13ae0ea2cd3f1d', 'Melody Productions'),
  ('65e36c1efc13ae0ea2cd3f1e', 'Muse Music'),
  ('65e36c1efc13ae0ea2cd3f1f', 'NoteWorthy Records'),
  ('65e36c1efc13ae0ea2cd3f20', 'Pulse Music Group'),
  ('65e36c1efc13ae0ea2cd3f21', 'Rhythm Records'),
  ('65e36c1efc13ae0ea2cd3f22', 'Rhythmic Records'),
  ('65e36c1efc13ae0ea2cd3f23', 'Sonic Sounds'),
  ('65e36c1efc13ae0ea2cd3f24', 'Sonic Symphony'),
  ('65e36c1efc13ae0ea2cd3f25', 'Symphony Sounds'),
  ('65e36c1efc13ae0ea2cd3f26', 'Symphony Studios'),
  ('65e36c1efc13ae0ea2cd3f27', 'TuneTown Music'),
  ('65e36c1efc13ae0ea2cd3f28', 'Vibe Valley'),
  ('65e36c1efc13ae0ea2cd3f29', 'Vibe Vibes');

CREATE TABLE dbo.[Product](
	product_ID varchar(50) NOT NULL PRIMARY KEY,
	product_price DECIMAL(10,2) NOT NULL,
	label_ID varchar(50) NOT NULL REFERENCES Label(label_ID)
);

-- Insert data into dbo.Product
INSERT INTO dbo.[Product] (product_ID, product_price, label_ID) VALUES 
  ('65e3654dfc13ae0e3fcd36da', 0.99, '65e36c1efc13ae0ea2cd3f16'),
  ('65e3654dfc13ae0e3fcd36dc', 0.99, '65e36c1efc13ae0ea2cd3f16'),
  ('65e3654dfc13ae0e3fcd36f2', 0.99, '65e36c1efc13ae0ea2cd3f16'),
  ('65e3654dfc13ae0e3fcd36e6', 0.99, '65e36c1efc13ae0ea2cd3f17'),
  ('65e3654dfc13ae0e3fcd36e4', 0.99, '65e36c1efc13ae0ea2cd3f17'),
  ('65e3654dfc13ae0e3fcd36ce', 0.99, '65e36c1efc13ae0ea2cd3f18'),
  ('65e3654dfc13ae0e3fcd36d0', 0.99, '65e36c1efc13ae0ea2cd3f18'),
  ('65e3654dfc13ae0e3fcd36d2', 0.99, '65e36c1efc13ae0ea2cd3f18'),
  ('65e3654dfc13ae0e3fcd36d4', 0.99, '65e36c1efc13ae0ea2cd3f18'),
  ('65e3654dfc13ae0e3fcd370e', 0.99, '65e36c1efc13ae0ea2cd3f18'),
  ('65e3654dfc13ae0e3fcd36ea', 0.99, '65e36c1efc13ae0ea2cd3f19'),
  ('65e3654dfc13ae0e3fcd36d6', 0.99, '65e36c1efc13ae0ea2cd3f1a'),
  ('65e3654dfc13ae0e3fcd36d8', 0.99, '65e36c1efc13ae0ea2cd3f1a'),
  ('65e3654dfc13ae0e3fcd36ec', 0.99, '65e36c1efc13ae0ea2cd3f1a'),
  ('65e3654dfc13ae0e3fcd36fe', 0.99, '65e36c1efc13ae0ea2cd3f1a'),
  ('65e3654dfc13ae0e3fcd36ca', 0.99, '65e36c1efc13ae0ea2cd3f1b'),
  ('65e3654dfc13ae0e3fcd36de', 0.99, '65e36c1efc13ae0ea2cd3f1b'),
  ('65e3654dfc13ae0e3fcd36c4', 0.99, '65e36c1efc13ae0ea2cd3f1b'),
  ('65e3654dfc13ae0e3fcd36c6', 0.99, '65e36c1efc13ae0ea2cd3f1b'),
  ('65e3654dfc13ae0e3fcd36c8', 0.99, '65e36c1efc13ae0ea2cd3f1b'),
  ('65e3654dfc13ae0e3fcd36cc', 0.99, '65e36c1efc13ae0ea2cd3f1c'),
  ('65e3654dfc13ae0e3fcd3706', 0.99, '65e36c1efc13ae0ea2cd3f1c'),
  ('65e3654dfc13ae0e3fcd36f6', 0.99, '65e36c1efc13ae0ea2cd3f1d'),
  ('65e3654dfc13ae0e3fcd36fc', 0.99, '65e36c1efc13ae0ea2cd3f1e'),
  ('65e3654dfc13ae0e3fcd36fa', 0.99, '65e36c1efc13ae0ea2cd3f1e'),
  ('65e3654dfc13ae0e3fcd36c0', 0.99, '65e36c1efc13ae0ea2cd3f1f'),
  ('65e3654dfc13ae0e3fcd36f8', 0.99, '65e36c1efc13ae0ea2cd3f1f'),
  ('65e3654dfc13ae0e3fcd3700', 0.99, '65e36c1efc13ae0ea2cd3f20'),
  ('65e3654dfc13ae0e3fcd36e2', 0.99, '65e36c1efc13ae0ea2cd3f20'),
  ('65e3654dfc13ae0e3fcd36e0', 0.99, '65e36c1efc13ae0ea2cd3f21'),
  ('65e3654dfc13ae0e3fcd36e8', 0.99, '65e36c1efc13ae0ea2cd3f22'),
  ('65e3654dfc13ae0e3fcd3702', 0.99, '65e36c1efc13ae0ea2cd3f23'),
  ('65e3654dfc13ae0e3fcd3704', 0.99, '65e36c1efc13ae0ea2cd3f23'),
  ('65e3654dfc13ae0e3fcd36ee', 0.99, '65e36c1efc13ae0ea2cd3f24'),
  ('65e3654dfc13ae0e3fcd370a', 0.99, '65e36c1efc13ae0ea2cd3f24'),
  ('65e3654dfc13ae0e3fcd370c', 0.99, '65e36c1efc13ae0ea2cd3f25'),
  ('65e3654dfc13ae0e3fcd36c2', 0.99, '65e36c1efc13ae0ea2cd3f26'),
  ('65e3654dfc13ae0e3fcd36f0', 0.99, '65e36c1efc13ae0ea2cd3f27'),
  ('65e3654dfc13ae0e3fcd3708', 0.99, '65e36c1efc13ae0ea2cd3f28'),
  ('65e3654dfc13ae0e3fcd36f4', 0.99, '65e36c1efc13ae0ea2cd3f29'),
  ('65e3686cfc13ae0f5ecd4252', 2.99, '65e36c1efc13ae0ea2cd3f16'),
  ('65e3686cfc13ae0f5ecd4245', 2.99, '65e36c1efc13ae0ea2cd3f16'),
  ('65e3686cfc13ae0f5ecd423f', 2.99, '65e36c1efc13ae0ea2cd3f17'),
  ('65e3686cfc13ae0f5ecd423e', 2.99, '65e36c1efc13ae0ea2cd3f17'),
  ('65e3686cfc13ae0f5ecd4239', 2.99, '65e36c1efc13ae0ea2cd3f18'),
  ('65e3686cfc13ae0f5ecd4251', 2.99, '65e36c1efc13ae0ea2cd3f18'),
  ('65e3686cfc13ae0f5ecd4241', 2.99, '65e36c1efc13ae0ea2cd3f19'),
  ('65e3686cfc13ae0f5ecd423a', 2.99, '65e36c1efc13ae0ea2cd3f1a'),
  ('65e3686cfc13ae0f5ecd4242', 2.99, '65e36c1efc13ae0ea2cd3f1a'),
  ('65e3686cfc13ae0f5ecd424a', 2.99, '65e36c1efc13ae0ea2cd3f1a'),
  ('65e3686cfc13ae0f5ecd4338', 2.99, '65e36c1efc13ae0ea2cd3f1b'),
  ('65e3686cfc13ae0f5ecd423b', 2.99, '65e36c1efc13ae0ea2cd3f1b'),
  ('65e3686cfc13ae0f5ecd4237', 2.99, '65e36c1efc13ae0ea2cd3f1b'),
  ('65e3686cfc13ae0f5ecd4238', 2.99, '65e36c1efc13ae0ea2cd3f1c'),
  ('65e3686cfc13ae0f5ecd424d', 2.99, '65e36c1efc13ae0ea2cd3f1c'),
  ('65e3686cfc13ae0f5ecd4247', 2.99, '65e36c1efc13ae0ea2cd3f1d'),
  ('65e3686cfc13ae0f5ecd4249', 2.99, '65e36c1efc13ae0ea2cd3f1e'),
  ('65e3686cfc13ae0f5ecd4248', 2.99, '65e36c1efc13ae0ea2cd3f1e'),
  ('65e3686cfc13ae0f5ecd4236', 2.99, '65e36c1efc13ae0ea2cd3f1f'),
  ('65e3686cfc13ae0f5ecd4347', 2.99, '65e36c1efc13ae0ea2cd3f1f'),
  ('65e3686cfc13ae0f5ecd424b', 2.99, '65e36c1efc13ae0ea2cd3f20'),
  ('65e3686cfc13ae0f5ecd423d', 2.99, '65e36c1efc13ae0ea2cd3f20'),
  ('65e3686cfc13ae0f5ecd423c', 2.99, '65e36c1efc13ae0ea2cd3f21'),
  ('65e3686cfc13ae0f5ecd4240', 2.99, '65e36c1efc13ae0ea2cd3f22'),
  ('65e3686cfc13ae0f5ecd424c', 2.99, '65e36c1efc13ae0ea2cd3f23'),
  ('65e3686cfc13ae0f5ecd4243', 2.99, '65e36c1efc13ae0ea2cd3f24'),
  ('65e3686cfc13ae0f5ecd424f', 2.99, '65e36c1efc13ae0ea2cd3f24'),
  ('65e3686cfc13ae0f5ecd4250', 2.99, '65e36c1efc13ae0ea2cd3f25'),
  ('65e3686cfc13ae0f5ecd4336', 2.99, '65e36c1efc13ae0ea2cd3f26'),
  ('65e3686cfc13ae0f5ecd4244', 2.99, '65e36c1efc13ae0ea2cd3f27'),
  ('65e3686cfc13ae0f5ecd424e', 2.99, '65e36c1efc13ae0ea2cd3f28'),
  ('65e3686cfc13ae0f5ecd4246', 2.99, '65e36c1efc13ae0ea2cd3f29');


CREATE TABLE dbo.[Album](
	album_ID varchar(50) NOT NULL PRIMARY KEY,
	product_ID varchar(50) NOT NULL REFERENCES Product(product_ID),
	album_release_date DATE NOT NULL
);

ALTER TABLE dbo.[Album]
ADD album_name varchar(50);

-- Insert data into dbo.Album
INSERT INTO dbo.[Album] (album_ID, product_ID, album_name, album_release_date) VALUES 
  ('65e36722fc13ae0f07cd3a6b', '65e3686cfc13ae0f5ecd4252', 'Future Nostalgia', '1980-11-18'),
  ('65e367a3fc13ae0dd8cd3a76', '65e3686cfc13ae0f5ecd4245', 'Astronomia', '2001-02-25'),
  ('65e367a3fc13ae0dd8cd3a70', '65e3686cfc13ae0f5ecd423f', 'Beauty And A Beat', '2018-02-06'),
  ('65e367a3fc13ae0dd8cd3a6f', '65e3686cfc13ae0f5ecd423e', 'Being Good Is Boring', '1986-08-23'),
  ('65e36722fc13ae0f07cd3a69', '65e3686cfc13ae0f5ecd4239', 'Planet Her', '2010-06-16'),
  ('65e367a3fc13ae0dd8cd3a82', '65e3686cfc13ae0f5ecd4251', '1, 2, 3 (feat. Jason Derulo & De La Ghetto)', '2011-06-02'),
  ('65e367a3fc13ae0dd8cd3a72', '65e3686cfc13ae0f5ecd4241', 'Banana (feat. Shaggy) [DJ FLe - Minisiren Remix]', '2019-06-24'),
  ('65e36722fc13ae0f07cd3a6a', '65e3686cfc13ae0f5ecd423a', 'On My Way', '1982-11-27'),
  ('65e367a3fc13ae0dd8cd3a73', '65e3686cfc13ae0f5ecd4242', 'Bag Raiders (Deluxe)', '1998-02-27'),
  ('65e367a3fc13ae0dd8cd3a7b', '65e3686cfc13ae0f5ecd424a', 'AMG', '2020-09-19'),
  ('65e36722fc13ae0f07cd3a68', '65e3686cfc13ae0f5ecd4338', 'Say It Right', '2002-01-02'),
  ('65e36722fc13ae0f07cd3a6c', '65e3686cfc13ae0f5ecd423b', 'Forever', '1986-09-06'),
  ('65e36722fc13ae0f07cd3a67', '65e3686cfc13ae0f5ecd4237', 'Shoot For The Stars Aim For The Moon', '1988-04-28'),
  ('65e367a3fc13ae0dd8cd3a7e', '65e3686cfc13ae0f5ecd424d', 'Afraid To Feel', '2013-09-29'),
  ('65e367a3fc13ae0dd8cd3a78', '65e3686cfc13ae0f5ecd4247', 'As It Was', '1987-05-14'),
  ('65e367a3fc13ae0dd8cd3a7a', '65e3686cfc13ae0f5ecd4249', 'Apologize', '2011-06-14'),
  ('65e367a3fc13ae0dd8cd3a79', '65e3686cfc13ae0f5ecd4248', 'ARDIPITHECUS', '1980-05-09'),
  ('65e36722fc13ae0f07cd3a66', '65e3686cfc13ae0f5ecd4236', 'Without You', '1999-12-06'),
  ('65e367a3fc13ae0dd8cd3a7c', '65e3686cfc13ae0f5ecd424b', 'Ameno Amapiano Remix (You Wanna Bamba)', '1981-01-12'),
  ('65e367a3fc13ae0dd8cd3a6e', '65e3686cfc13ae0f5ecd423d', 'Best Friend (feat. Doja Cat) [Remix EP]', '1997-02-15'),
  ('65e367a3fc13ae0dd8cd3a6d', '65e3686cfc13ae0f5ecd423c', 'Forever', '1986-09-06'),
  ('65e367a3fc13ae0dd8cd3a71', '65e3686cfc13ae0f5ecd4240', 'Be Kind (with Halsey)', '2000-03-21'),
  ('65e367a3fc13ae0dd8cd3a7d', '65e3686cfc13ae0f5ecd424c', 'After Hours', '2000-05-27'),
  ('65e367a3fc13ae0dd8cd3a74', '65e3686cfc13ae0f5ecd4243', 'Bad Habits', '2008-07-30'),
  ('65e367a3fc13ae0dd8cd3a80', '65e3686cfc13ae0f5ecd424f', 'About Damn Time', '2001-05-05'),
  ('65e367a3fc13ae0dd8cd3a81', '65e3686cfc13ae0f5ecd4250', 'abcdefu', '1991-08-29'),
  ('65e367a3fc13ae0dd8cd3a75', '65e3686cfc13ae0f5ecd4244', 'Baby Girl', '2017-11-04'),
  ('65e367a3fc13ae0dd8cd3a7f', '65e3686cfc13ae0f5ecd424e', 'Aesthetic', '2022-06-24'),
  ('65e367a3fc13ae0dd8cd3a77', '65e3686cfc13ae0f5ecd4246', 'Astronaut In The Ocean', '1989-01-14');

CREATE TABLE dbo.[Track](
	track_ID varchar(50) NOT NULL PRIMARY KEY,
	product_ID varchar(50) NOT NULL REFERENCES Product(product_ID),
	album_ID varchar(50) NOT NULL REFERENCES Album(album_ID),
	track_name varchar(50) NOT NULL,
	track_time TIME NOT NULL,
	track_release_date DATE NOT NULL,
	track_bpm INT NOT NULL
);

-- Insert data into dbo.Track
INSERT INTO dbo.[Track] (track_ID, product_ID, album_ID, track_name, track_time, track_release_date, track_bpm) VALUES 
  ('65e3654dfc13ae0e3fcd36d9', '65e3654dfc13ae0e3fcd36da', '65e36722fc13ae0f07cd3a6b', 'Levitating (feat. DaBaby)', '0:02:38', '1980-11-18', 103),
  ('65e3654dfc13ae0e3fcd36db', '65e3654dfc13ae0e3fcd36dc', '65e36722fc13ae0f07cd3a6b', 'Break My Heart', '0:03:41', '1980-11-18', 113),
  ('65e3654dfc13ae0e3fcd36f1', '65e3654dfc13ae0e3fcd36f2', '65e367a3fc13ae0dd8cd3a76', 'Astronomia', '0:03:18', '2001-02-25', 126),
  ('65e3654dfc13ae0e3fcd36e5', '65e3654dfc13ae0e3fcd36e6', '65e367a3fc13ae0dd8cd3a70', 'Beauty And A Beat', '0:02:18', '2018-02-06', 128),
  ('65e3654dfc13ae0e3fcd36e3', '65e3654dfc13ae0e3fcd36e4', '65e367a3fc13ae0dd8cd3a6f', 'Being Good Is Boring', '0:02:40', '1986-08-23', 112),
  ('65e3654dfc13ae0e3fcd36cd', '65e3654dfc13ae0e3fcd36ce', '65e36722fc13ae0f07cd3a69', 'Woman', '0:02:52', '2010-06-16', 108),
  ('65e3654dfc13ae0e3fcd36cf', '65e3654dfc13ae0e3fcd36d0', '65e36722fc13ae0f07cd3a69', 'Need to Know', '0:03:30', '2010-06-16', 130),
  ('65e3654dfc13ae0e3fcd36d1', '65e3654dfc13ae0e3fcd36d2', '65e36722fc13ae0f07cd3a69', 'Aint Shit', '0:02:54', '2010-06-16', 124),
  ('65e3654dfc13ae0e3fcd36d3', '65e3654dfc13ae0e3fcd36d4', '65e36722fc13ae0f07cd3a69', 'You Right', '0:03:06', '2010-06-16', 129),
  ('65e3654dfc13ae0e3fcd370d', '65e3654dfc13ae0e3fcd370e', '65e367a3fc13ae0dd8cd3a82', '1, 2, 3 (feat. Jason Derulo & De La Ghetto)', '0:03:21', '2011-06-02', 95),
  ('65e3654dfc13ae0e3fcd36e9', '65e3654dfc13ae0e3fcd36ea', '65e367a3fc13ae0dd8cd3a72', 'Banana (feat. Shaggy) - DJ FLe - Minisiren Remix', '0:03:30', '2019-06-24', 95),
  ('65e3654dfc13ae0e3fcd36d5', '65e3654dfc13ae0e3fcd36d6', '65e36722fc13ae0f07cd3a6a', 'When Hello Means Goodbye', '0:02:38', '1982-11-27', 166),
  ('65e3654dfc13ae0e3fcd36d7', '65e3654dfc13ae0e3fcd36d8', '65e36722fc13ae0f07cd3a6a', 'On My Way', '0:03:20', '1982-11-27', 96),
  ('65e3654dfc13ae0e3fcd36eb', '65e3654dfc13ae0e3fcd36ec', '65e367a3fc13ae0dd8cd3a73', 'Shooting Stars', '0:03:55', '1998-02-27', 125),
  ('65e3654dfc13ae0e3fcd36fd', '65e3654dfc13ae0e3fcd36fe', '65e367a3fc13ae0dd8cd3a7b', 'AMG', '0:02:15', '2020-09-19', 88),
  ('65e3654dfc13ae0e3fcd36c9', '65e3654dfc13ae0e3fcd36ca', '65e36722fc13ae0f07cd3a68', 'Say It Right', '0:02:09', '2002-01-02', 124),
  ('65e3654dfc13ae0e3fcd36dd', '65e3654dfc13ae0e3fcd36de', '65e36722fc13ae0f07cd3a6c', 'Forever', '0:03:01', '1986-09-06', 124),
  ('65e3654dfc13ae0e3fcd36c3', '65e3654dfc13ae0e3fcd36c4', '65e36722fc13ae0f07cd3a67', 'What You Know Bout Love', '0:02:40', '1988-04-28', 84),
  ('65e3654dfc13ae0e3fcd36c5', '65e3654dfc13ae0e3fcd36c6', '65e36722fc13ae0f07cd3a67', 'Mood Swings (feat. Lil Tjay)', '0:03:33', '1988-04-28', 180),
  ('65e3654dfc13ae0e3fcd36c7', '65e3654dfc13ae0e3fcd36c8', '65e36722fc13ae0f07cd3a67', 'For The Night (feat. Lil Baby & DaBaby)', '0:03:10', '1988-04-28', 126),
  ('65e3654dfc13ae0e3fcd36cb', '65e3654dfc13ae0e3fcd36cc', '65e36722fc13ae0f07cd3a68', 'Say It Right', '0:02:08', '2002-01-02', 126),
  ('65e3654dfc13ae0e3fcd3705', '65e3654dfc13ae0e3fcd3706', '65e367a3fc13ae0dd8cd3a7e', 'Afraid To Feel', '0:02:57', '2013-09-29', 128),
  ('65e3654dfc13ae0e3fcd36f5', '65e3654dfc13ae0e3fcd36f6', '65e367a3fc13ae0dd8cd3a78', 'As It Was', '0:02:47', '1987-05-14', 174),
  ('65e3654dfc13ae0e3fcd36fb', '65e3654dfc13ae0e3fcd36fc', '65e367a3fc13ae0dd8cd3a7a', 'Apologize', '0:02:09', '2011-06-14', 126),
  ('65e3654dfc13ae0e3fcd36f9', '65e3654dfc13ae0e3fcd36fa', '65e367a3fc13ae0dd8cd3a79', 'Wait a Minute!', '0:03:16', '1980-05-09', 101),
  ('65e3654dfc13ae0e3fcd36bf', '65e3654dfc13ae0e3fcd36c0', '65e36722fc13ae0f07cd3a66', 'Without You', '0:03:02', '1999-12-06', 125),
  ('65e3654dfc13ae0e3fcd36f7', '65e3654dfc13ae0e3fcd36f8', '65e367a3fc13ae0dd8cd3a78', 'As It Was', '0:02:04', '1987-05-14', 105),
  ('65e3654dfc13ae0e3fcd36ff', '65e3654dfc13ae0e3fcd3700', '65e367a3fc13ae0dd8cd3a7c', 'Ameno Amapiano Remix (You Wanna Bamba)', '0:03:47', '1981-01-12', 113),
  ('65e3654dfc13ae0e3fcd36e1', '65e3654dfc13ae0e3fcd36e2', '65e367a3fc13ae0dd8cd3a6e', 'Best Friend (feat. Doja Cat)', '0:02:35', '1997-02-15', 94),
  ('65e3654dfc13ae0e3fcd36df', '65e3654dfc13ae0e3fcd36e0', '65e367a3fc13ae0dd8cd3a6d', 'Forever', '0:02:47', '1986-09-06', 125),
  ('65e3654dfc13ae0e3fcd36e7', '65e3654dfc13ae0e3fcd36e8', '65e367a3fc13ae0dd8cd3a71', 'Be Kind (with Halsey)', '0:02:52', '2000-03-21', 94),
  ('65e3654dfc13ae0e3fcd3701', '65e3654dfc13ae0e3fcd3702', '65e367a3fc13ae0dd8cd3a7d', 'Blinding Lights', '0:03:20', '2000-05-27', 171),
  ('65e3654dfc13ae0e3fcd370b', '65e3654dfc13ae0e3fcd3704', '65e367a3fc13ae0dd8cd3a7d', 'In Your Eyes', '0:03:57', '2000-05-27', 100), -- track_ID is duplicate
  ('65e3654dfc13ae0e3fcd36ed', '65e3654dfc13ae0e3fcd36ee', '65e367a3fc13ae0dd8cd3a74', 'Bad Habits', '0:03:51', '2008-07-30', 126),
  ('65e3654dfc13ae0e3fcd3709', '65e3654dfc13ae0e3fcd370a', '65e367a3fc13ae0dd8cd3a80', 'About Damn Time', '0:03:11', '2001-05-05', 109),
  ('65e3654dfc13ae0e3fcd36c1', '65e3654dfc13ae0e3fcd36c2', '65e36722fc13ae0f07cd3a66', 'Without You', '0:02:12', '1999-12-06', 120),
  ('65e3654dfc13ae0e3fcd36ef', '65e3654dfc13ae0e3fcd36f0', '65e367a3fc13ae0dd8cd3a75', 'Baby Girl', '0:01:51', '2017-11-04', 121),
  ('65e3654dfc13ae0e3fcd3707', '65e3654dfc13ae0e3fcd3708', '65e367a3fc13ae0dd8cd3a7f', 'Aesthetic', '0:02:38', '2022-06-24', 170),
  ('65e3654dfc13ae0e3fcd36f3', '65e3654dfc13ae0e3fcd36f4', '65e367a3fc13ae0dd8cd3a77', 'Astronaut In The Ocean', '0:02:12', '1989-01-14', 150);
--4 sets of tracks with the same name: Without You,Forever, Say it Right and As it Was
--will update at bottom of code

 --Adding the Playlist Inclusiveness, Playlist, Track Genre, and Genre Tables
CREATE TABLE dbo.[Playlist](
  playlist_ID varchar(50) NOT NULL PRIMARY KEY,
  user_ID varchar(50) NOT NULL,
  playlist_name varchar(50) NOT NULL, 
  playlist_desc varchar(1000),
  CONSTRAINT FKPlaylist FOREIGN KEY (user_ID)
    REFERENCES dbo.[User](user_ID)
 );

INSERT INTO dbo.[Playlist] (playlist_id, user_id, playlist_name, playlist_desc) VALUES
  ('20230304120000-e72c000650a647178993128613423d55', 'e72c0006-50a6-4717-8993-128613423d55', 'Music For My Friends', 'Songs that remind me of my special buds'),
  ('20230220120001-00a05fed3b5441a18dad0322727a78da', '00a05fed-3b54-41a1-8dad-0322727a78da', 'Sunny Day Summer Tunes', 'Lapping waves and sun drenched skin'),
  ('20230125120002-6efa23ec3bd04b82b631962f416384a8', '6efa23ec-3bd0-4b82-b631-962f416384a8', 'Sonic Journal- Winter of 23', NULL),
  ('20230717120003-15c36c9a6d344cb88799a7089b36fa09', '15c36c9a-6d34-4cb8-8799-a7089b36fa09', 'Kaleidoscope', 'This playlist is a reflection of my ever-changing tastes and eclectic musical journey. Just like a kaleidoscope, its a vibrant mix of colors and patterns, with each song offering a different perspective and taking me on a new adventure.'),
  ('20230211120004-b025f9731eb4446db4c17ce9c3fced9d', 'b025f973-1eb4-446d-b4c1-7ce9c3fced9d', 'Evening Unwind', 'These tracks are my sanctuary, filled with gentle melodies and soothing harmonies that help me unwind, reflect, and find peace amidst the chaos'),
  ('20230118120005-4ed2412d60844c359077f0eb8d9dc374', '4ed2412d-6084-4c35-9077-f0eb8d9dc374', 'Groovy Vibes', 'Funky playlist filled with infectious rhythms and soulful beats- let these groovy vibes lift your spirits and move your feet.'),
  ('20230212120006-cee7e196937b4985801607cf77c8f35b', 'cee7e196-937b-4985-8016-07cf77c8f35b', 'Alone on Valentine''s Day', 'Being alone doesn''t mean being lonely, and self-love is just as important as any other kind'),
  ('20230426120007-9c5ee840c8b24d5886c7d87c5aac04f1', '9c5ee840-c8b2-4d58-86c7-d87c5aac04f1', 'Ultimate Roadtrip Playlist', 'This playlist is the soundtrack to my adventures, fueling every mile with excitement and anticipation. Whether I''m cruising down open highways or winding through scenic backroads, these songs are my faithful companions, making every journey unforgettable'),
  ('20230312120008-fdb29741d9ba4019af9f5d869290af2e', 'fdb29741-d9ba-4019-af9f-5d869290af2e', 'Baby, this is Keke Palmer', 'Harness the power of Keke''s confidence and glow with these booty popping anthems'),
  ('20230601120009-1a9288dde1b848fc9d38241d0738098f', '1a9288dd-e1b8-48fc-9d38-241d0738098f', 'Plantasia Reloaded', 'Close your eyes and imagine yourself surrounded by lush greenery, birds chirping, and the scent of flowers in the air. Escape the hustle and bustle of everyday life and reconnect with nature''s beauty.');

CREATE TABLE dbo.[PlaylistInclusiveness](
  playlist_ID varchar(50) NOT NULL,
  track_ID varchar(50) NOT NULL,
  CONSTRAINT FK1PlaylistInclusiveness FOREIGN KEY (playlist_ID)
    REFERENCES dbo.Playlist(playlist_ID),
  CONSTRAINT FK2PlaylistInclusiveness FOREIGN KEY (track_ID)
    REFERENCES dbo.Track(track_ID),
  CONSTRAINT PKPlaylistInclusiveness PRIMARY KEY CLUSTERED (playlist_ID, track_ID)
 ); 

INSERT INTO dbo.PlaylistInclusiveness (playlist_id, track_id) VALUES 
-- Playlist: 20230304120000-e72c000650a647178993128613423d55
  ('20230304120000-e72c000650a647178993128613423d55', '65e3654dfc13ae0e3fcd36d9'),
  ('20230304120000-e72c000650a647178993128613423d55', '65e3654dfc13ae0e3fcd36db'),
  ('20230304120000-e72c000650a647178993128613423d55', '65e3654dfc13ae0e3fcd36f1'),
('20230304120000-e72c000650a647178993128613423d55', '65e3654dfc13ae0e3fcd36e5'),
('20230304120000-e72c000650a647178993128613423d55', '65e3654dfc13ae0e3fcd36e3'),

-- Playlist: 20230220120001-00a05fed3b5441a18dad0322727a78da
  ('20230220120001-00a05fed3b5441a18dad0322727a78da', '65e3654dfc13ae0e3fcd36cd'),
  ('20230220120001-00a05fed3b5441a18dad0322727a78da', '65e3654dfc13ae0e3fcd36cf'),
  ('20230220120001-00a05fed3b5441a18dad0322727a78da', '65e3654dfc13ae0e3fcd36d1'),
  ('20230220120001-00a05fed3b5441a18dad0322727a78da', '65e3654dfc13ae0e3fcd36d3'),
  ('20230220120001-00a05fed3b5441a18dad0322727a78da', '65e3654dfc13ae0e3fcd36d5'),

-- Playlist: 20230125120002-6efa23ec3bd04b82b631962f416384a8
  ('20230125120002-6efa23ec3bd04b82b631962f416384a8', '65e3654dfc13ae0e3fcd36d7'),
  ('20230125120002-6efa23ec3bd04b82b631962f416384a8', '65e3654dfc13ae0e3fcd36eb'),
  ('20230125120002-6efa23ec3bd04b82b631962f416384a8', '65e3654dfc13ae0e3fcd36d9'),
  ('20230125120002-6efa23ec3bd04b82b631962f416384a8', '65e3654dfc13ae0e3fcd36db'),
  ('20230125120002-6efa23ec3bd04b82b631962f416384a8', '65e3654dfc13ae0e3fcd36f1'),

-- Playlist: 20230717120003-15c36c9a6d344cb88799a7089b36fa09
  ('20230717120003-15c36c9a6d344cb88799a7089b36fa09', '65e3654dfc13ae0e3fcd3701'),
  ('20230717120003-15c36c9a6d344cb88799a7089b36fa09', '65e3654dfc13ae0e3fcd3705'),
  ('20230717120003-15c36c9a6d344cb88799a7089b36fa09', '65e3654dfc13ae0e3fcd3707'),
  ('20230717120003-15c36c9a6d344cb88799a7089b36fa09', '65e3654dfc13ae0e3fcd3709'),

-- Playlist: 20230211120004-b025f9731eb4446db4c17ce9c3fced9d
  ('20230211120004-b025f9731eb4446db4c17ce9c3fced9d', '65e3654dfc13ae0e3fcd36df'),
  ('20230211120004-b025f9731eb4446db4c17ce9c3fced9d', '65e3654dfc13ae0e3fcd36e1'),
  ('20230211120004-b025f9731eb4446db4c17ce9c3fced9d', '65e3654dfc13ae0e3fcd36e3'),
  ('20230211120004-b025f9731eb4446db4c17ce9c3fced9d', '65e3654dfc13ae0e3fcd36e5'),
  ('20230211120004-b025f9731eb4446db4c17ce9c3fced9d', '65e3654dfc13ae0e3fcd36e7'),

-- Playlist: 20230118120005-4ed2412d60844c359077f0eb8d9dc374
  ('20230118120005-4ed2412d60844c359077f0eb8d9dc374', '65e3654dfc13ae0e3fcd36c7'),
  ('20230118120005-4ed2412d60844c359077f0eb8d9dc374', '65e3654dfc13ae0e3fcd36cb'),
  ('20230118120005-4ed2412d60844c359077f0eb8d9dc374', '65e3654dfc13ae0e3fcd36cf'),
  ('20230118120005-4ed2412d60844c359077f0eb8d9dc374', '65e3654dfc13ae0e3fcd36d1'),
  ('20230118120005-4ed2412d60844c359077f0eb8d9dc374', '65e3654dfc13ae0e3fcd36d3'),

-- Playlist: 20230212120006-cee7e196937b4985801607cf77c8f35b
  ('20230212120006-cee7e196937b4985801607cf77c8f35b', '65e3654dfc13ae0e3fcd36d5'),
  ('20230212120006-cee7e196937b4985801607cf77c8f35b', '65e3654dfc13ae0e3fcd36d7'),
  ('20230212120006-cee7e196937b4985801607cf77c8f35b', '65e3654dfc13ae0e3fcd36d9'),
  ('20230212120006-cee7e196937b4985801607cf77c8f35b', '65e3654dfc13ae0e3fcd36db'),
  ('20230212120006-cee7e196937b4985801607cf77c8f35b', '65e3654dfc13ae0e3fcd36dd'),

-- Playlist: 20230426120007-9c5ee840c8b24d5886c7d87c5aac04f1
  ('20230426120007-9c5ee840c8b24d5886c7d87c5aac04f1', '65e3654dfc13ae0e3fcd36e9'),
  ('20230426120007-9c5ee840c8b24d5886c7d87c5aac04f1', '65e3654dfc13ae0e3fcd36eb'),
  ('20230426120007-9c5ee840c8b24d5886c7d87c5aac04f1', '65e3654dfc13ae0e3fcd36ed'),
  ('20230426120007-9c5ee840c8b24d5886c7d87c5aac04f1', '65e3654dfc13ae0e3fcd36ef'),
  ('20230426120007-9c5ee840c8b24d5886c7d87c5aac04f1', '65e3654dfc13ae0e3fcd36f1'),

-- Playlist: 20230312120008-fdb29741d9ba4019af9f5d869290af2e
  ('20230312120008-fdb29741d9ba4019af9f5d869290af2e', '65e3654dfc13ae0e3fcd36f3'),
  ('20230312120008-fdb29741d9ba4019af9f5d869290af2e', '65e3654dfc13ae0e3fcd36f5'),
  ('20230312120008-fdb29741d9ba4019af9f5d869290af2e', '65e3654dfc13ae0e3fcd36f7'),
  ('20230312120008-fdb29741d9ba4019af9f5d869290af2e', '65e3654dfc13ae0e3fcd36f9'),
  ('20230312120008-fdb29741d9ba4019af9f5d869290af2e', '65e3654dfc13ae0e3fcd36fb'),

-- Playlist: 20230601120009-1a9288dde1b848fc9d38241d0738098f
  ('20230601120009-1a9288dde1b848fc9d38241d0738098f', '65e3654dfc13ae0e3fcd370b'),
  ('20230601120009-1a9288dde1b848fc9d38241d0738098f', '65e3654dfc13ae0e3fcd370d'),
  ('20230601120009-1a9288dde1b848fc9d38241d0738098f', '65e3654dfc13ae0e3fcd36c1'),
  ('20230601120009-1a9288dde1b848fc9d38241d0738098f', '65e3654dfc13ae0e3fcd36c3'),
  ('20230601120009-1a9288dde1b848fc9d38241d0738098f', '65e3654dfc13ae0e3fcd36c5');

CREATE TABLE dbo.[Genre](
  genre_ID varchar(50) NOT NULL PRIMARY KEY,
  genre_desc varchar(50) NOT NULL
);

INSERT INTO dbo.Genre (genre_ID, genre_desc) VALUES
  ('GEN001', 'Pop'),
  ('GEN002', 'Rock'),
  ('GEN003', 'Hip Hop'),
  ('GEN004', 'Euro Pop'),
  ('GEN005', 'Blues'),
  ('GEN006', 'Electronic'),
  ('GEN007', 'R&B (Rhythm and Blues)'),
  ('GEN008', 'Rap'),
  ('GEN009', 'Trap'),
  ('GEN010', 'Dance Pop'),
  ('GEN011', 'House'),
  ('GEN012', 'Indie'),
  ('GEN013', 'Down Tempo'),
  ('GEN014', 'Disco'),
  ('GEN015', 'Funk'),
  ('GEN016', 'Soul'),
  ('GEN017', 'Afrobeats'),
  ('GEN018', 'Garage'),
  ('GEN019', 'Alternative'),
  ('GEN020', 'Latin');

CREATE TABLE dbo.[TrackGenre](
  genre_ID varchar(50) NOT NULL,
  track_ID varchar(50) NOT NULL,
  CONSTRAINT FK1TrackGenre FOREIGN KEY (genre_ID)
    REFERENCES dbo.Genre(genre_ID),
  CONSTRAINT FK2TrackGenre FOREIGN KEY (track_ID)
    REFERENCES dbo.Track(track_ID),
  CONSTRAINT PKTrackGenre PRIMARY KEY CLUSTERED (genre_ID, track_ID)
);

INSERT INTO dbo.TrackGenre (genre_id, track_id) VALUES
  ('GEN001', '65e3654dfc13ae0e3fcd36d9'),
  ('GEN006', '65e3654dfc13ae0e3fcd36db'),
  ('GEN008', '65e3654dfc13ae0e3fcd36f1'),
  ('GEN019', '65e3654dfc13ae0e3fcd36e5'),
  ('GEN012', '65e3654dfc13ae0e3fcd36e3'),
  ('GEN005', '65e3654dfc13ae0e3fcd36cd'),
  ('GEN018', '65e3654dfc13ae0e3fcd36cf'),
  ('GEN004', '65e3654dfc13ae0e3fcd36d1'),
  ('GEN002', '65e3654dfc13ae0e3fcd36d3'),
  ('GEN014', '65e3654dfc13ae0e3fcd370d'),
  ('GEN017', '65e3654dfc13ae0e3fcd36e9'),
  ('GEN009', '65e3654dfc13ae0e3fcd36d5'),
  ('GEN013', '65e3654dfc13ae0e3fcd36d7'),
  ('GEN020', '65e3654dfc13ae0e3fcd36eb'),
  ('GEN010', '65e3654dfc13ae0e3fcd36fd'),
  ('GEN016', '65e3654dfc13ae0e3fcd36c9'),
  ('GEN015', '65e3654dfc13ae0e3fcd36dd'),
  ('GEN003', '65e3654dfc13ae0e3fcd36c3'),
  ('GEN001', '65e3654dfc13ae0e3fcd36c5'),
  ('GEN007', '65e3654dfc13ae0e3fcd36c7'),
  ('GEN003', '65e3654dfc13ae0e3fcd36cb'),
  ('GEN013', '65e3654dfc13ae0e3fcd3705'),
  ('GEN019', '65e3654dfc13ae0e3fcd36f5'),
  ('GEN018', '65e3654dfc13ae0e3fcd36fb'),
  ('GEN006', '65e3654dfc13ae0e3fcd36f9'),
  ('GEN008', '65e3654dfc13ae0e3fcd36bf'),
  ('GEN004', '65e3654dfc13ae0e3fcd36f7'),
  ('GEN019', '65e3654dfc13ae0e3fcd36ff'),
  ('GEN020', '65e3654dfc13ae0e3fcd36e1'),
  ('GEN015', '65e3654dfc13ae0e3fcd36df'),
  ('GEN016', '65e3654dfc13ae0e3fcd36e7'),
  ('GEN005', '65e3654dfc13ae0e3fcd3701');

 
CREATE TABLE dbo.[MusicianActivity](
  user_ID varchar(50) NOT NULL REFERENCES dbo.[User](user_ID),
  track_ID varchar(50) NOT NULL REFERENCES Track(track_ID),
  specialty_ID varchar(50) NOT NULL REFERENCES MusicianSpeciality(specialty_ID),
  PRIMARY KEY (user_ID, track_ID, specialty_ID)
);

CREATE TABLE dbo.ListenHistory(
  user_ID varchar(50) NOT NULL REFERENCES dbo.[User](user_ID),
  track_ID varchar(50) NOT NULL REFERENCES dbo.[Track](track_ID),
  listen_time_stamp DATETIME NOT NULL,
  PRIMARY KEY (user_ID, track_ID, listen_time_stamp)
);

CREATE TABLE dbo.DownloadHistory(
  user_ID varchar(50) NOT NULL REFERENCES dbo.[User](user_ID),
  track_ID varchar(50) NOT NULL REFERENCES dbo.[Track](track_ID),
  download_time_stamp DATETIME NOT NULL,
  PRIMARY KEY (user_ID, track_ID, download_time_stamp)
);

CREATE TABLE dbo.LikeHistory(
  user_ID varchar(50) NOT NULL REFERENCES dbo.[User](user_ID),
  track_ID varchar(50) NOT NULL REFERENCES dbo.[Track](track_ID),
  like_time_stamp DATETIME NOT NULL,
  PRIMARY KEY (user_ID, track_ID, like_time_stamp),
);


INSERT INTO dbo.[MusicianActivity] (user_ID, track_ID, specialty_ID) VALUES
  ('a4385066-147b-4560-9dc9-afd258c89791', '65e3654dfc13ae0e3fcd36e5', '65e42642fc13ae3278cd3aca'),
  ('6efa23ec-3bd0-4b82-b631-962f416384a8', '65e3654dfc13ae0e3fcd36fb', '65e42642fc13ae3278cd3acd'),
  ('6f5b5567-cf20-433d-8287-5e32a86246b3', '65e3654dfc13ae0e3fcd3705', '65e42642fc13ae3278cd3acb'),
  ('e72c0006-50a6-4717-8993-128613423d55', '65e3654dfc13ae0e3fcd36ff', '65e42642fc13ae3278cd3acc'),
  ('0e4e1497-ffb2-491b-97fe-8301154532a1', '65e3654dfc13ae0e3fcd36ef', '65e42642fc13ae3278cd3acd'),
  ('cee7e196-937b-4985-8016-07cf77c8f35b', '65e3654dfc13ae0e3fcd36cb', '65e42642fc13ae3278cd3ad0'),
  ('b025f973-1eb4-446d-b4c1-7ce9c3fced9d', '65e3654dfc13ae0e3fcd36cd', '65e42642fc13ae3278cd3ace'),
  ('1a9288dd-e1b8-48fc-9d38-241d0738098f', '65e3654dfc13ae0e3fcd36f1', '65e42642fc13ae3278cd3ad2'),
  ('bf8a4973-2408-4c40-8483-39c225743570', '65e3654dfc13ae0e3fcd36db', '65e42642fc13ae3278cd3ad3'),
  ('cf7ab4b4-6779-4463-b518-2f1a104816ef', '65e3654dfc13ae0e3fcd3707', '65e42642fc13ae3278cd3ad2');


INSERT INTO ListenHistory (user_ID, track_ID, listen_time_stamp) VALUES
  ('1a9288dd-e1b8-48fc-9d38-241d0738098f', '65e3654dfc13ae0e3fcd3707', '2024-02-27 09:53:56'),
  ('bf8a4973-2408-4c40-8483-39c225743570', '65e3654dfc13ae0e3fcd370b', '2023-11-18 18:41:36'),
  ('e72c0006-50a6-4717-8993-128613423d55', '65e3654dfc13ae0e3fcd36c1', '2024-02-18 13:02:50'),
  ('00a05fed-3b54-41a1-8dad-0322727a78da', '65e3654dfc13ae0e3fcd36ff', '2023-10-04 19:42:58'),
  ('cee7e196-937b-4985-8016-07cf77c8f35b', '65e3654dfc13ae0e3fcd36fb', '2024-01-05 05:37:24'),
  ('6efa23ec-3bd0-4b82-b631-962f416384a8', '65e3654dfc13ae0e3fcd36c7', '2023-08-24 18:16:12'),
  ('00a05fed-3b54-41a1-8dad-0322727a78da', '65e3654dfc13ae0e3fcd36eb', '2023-11-16 06:19:03'),
  ('cf7ab4b4-6779-4463-b518-2f1a104816ef', '65e3654dfc13ae0e3fcd36d3', '2023-08-13 01:04:51'),
  ('1a9288dd-e1b8-48fc-9d38-241d0738098f', '65e3654dfc13ae0e3fcd36dd', '2023-08-14 06:55:02'),
  ('bf8a4973-2408-4c40-8483-39c225743570', '65e3654dfc13ae0e3fcd36f1', '2023-10-21 20:12:55');


INSERT INTO DownloadHistory (user_ID, track_ID, download_time_stamp) VALUES
  ('6f5b5567-cf20-433d-8287-5e32a86246b3', '65e3654dfc13ae0e3fcd36cf', '2023-11-29 20:35:27'),
  ('4ed2412d-6084-4c35-9077-f0eb8d9dc374', '65e3654dfc13ae0e3fcd36e7', '2024-01-12 04:19:59'),
  ('6efa23ec-3bd0-4b82-b631-962f416384a8', '65e3654dfc13ae0e3fcd3707', '2023-11-05 18:11:37'),
  ('1a9288dd-e1b8-48fc-9d38-241d0738098f', '65e3654dfc13ae0e3fcd36d5', '2023-09-20 10:14:22'),
  ('6cbadc1f-1932-404f-b498-2f60b46424b5', '65e3654dfc13ae0e3fcd36e5', '2024-02-02 11:52:31'),
  ('9c5ee840-c8b2-4d58-86c7-d87c5aac04f1', '65e3654dfc13ae0e3fcd36f1', '2024-01-20 03:39:16'),
  ('fdb29741-d9ba-4019-af9f-5d869290af2e', '65e3654dfc13ae0e3fcd36f7', '2023-09-24 02:41:06'),
  ('0e4e1497-ffb2-491b-97fe-8301154532a1', '65e3654dfc13ae0e3fcd36c7', '2023-10-25 02:20:08'),
  ('bf8a4973-2408-4c40-8483-39c225743570', '65e3654dfc13ae0e3fcd36d7', '2023-11-22 03:21:49'),
  ('00a05fed-3b54-41a1-8dad-0322727a78da', '65e3654dfc13ae0e3fcd36f3', '2023-12-27 21:30:35');


INSERT INTO LikeHistory (user_ID, track_ID, like_time_stamp) VALUES
  ('122d6c4c-7de8-47b1-a314-69ad99c161fe', '65e3654dfc13ae0e3fcd36dd', '2023-10-03 02:49:20'),
  ('1a9288dd-e1b8-48fc-9d38-241d0738098f', '65e3654dfc13ae0e3fcd36f9', '2023-12-27 06:53:47'),
  ('cf7ab4b4-6779-4463-b518-2f1a104816ef', '65e3654dfc13ae0e3fcd36ef', '2023-10-21 13:00:56'),
  ('6cbadc1f-1932-404f-b498-2f60b46424b5', '65e3654dfc13ae0e3fcd3707', '2023-09-30 16:37:38'),
  ('0e4e1497-ffb2-491b-97fe-8301154532a1', '65e3654dfc13ae0e3fcd36c7', '2023-12-01 16:50:13'),
  ('9c5ee840-c8b2-4d58-86c7-d87c5aac04f1', '65e3654dfc13ae0e3fcd36d1', '2023-10-21 10:10:12'),
  ('bf8a4973-2408-4c40-8483-39c225743570', '65e3654dfc13ae0e3fcd36cf', '2023-09-09 14:03:17'),
  ('fdb29741-d9ba-4019-af9f-5d869290af2e', '65e3654dfc13ae0e3fcd36d9', '2023-10-01 03:14:39'),
  ('a4385066-147b-4560-9dc9-afd258c89791', '65e3654dfc13ae0e3fcd36e5', '2023-08-07 19:07:11'),
  ('bf8a4973-2408-4c40-8483-39c225743570', '65e3654dfc13ae0e3fcd36db', '2023-08-16 11:54:20');


CREATE TABLE dbo.[FollowingRelationship](
  follow_ID varchar(50) NOT NULL PRIMARY KEY,
  user_ID_follower varchar(50) NOT NULL REFERENCES dbo.[User](user_ID),
  user_ID_followed varchar(50) NOT NULL REFERENCES dbo.[User](user_ID),
  follow_time_stamp DATETIME NOT NULL
);

insert into FollowingRelationship (follow_ID, user_ID_follower, user_ID_followed, follow_time_stamp) values
 ('65e3ba95fc13ae6456cd367e', '122d6c4c-7de8-47b1-a314-69ad99c161fe', '1a9288dd-e1b8-48fc-9d38-241d0738098f', '2023-12-28 16:18:20'),
 ('65e3ba95fc13ae6456cd367f', '1a9288dd-e1b8-48fc-9d38-241d0738098f', '122d6c4c-7de8-47b1-a314-69ad99c161fe', '2023-11-22 16:09:52'),
 ('65e3ba95fc13ae6456cd3680', 'cf7ab4b4-6779-4463-b518-2f1a104816ef', '1a9288dd-e1b8-48fc-9d38-241d0738098f', '2023-09-28 21:41:42'),
 ('65e3ba95fc13ae6456cd3681', '6cbadc1f-1932-404f-b498-2f60b46424b5', '1a9288dd-e1b8-48fc-9d38-241d0738098f', '2023-09-13 16:52:06'),
 ('65e3ba95fc13ae6456cd3682', '0e4e1497-ffb2-491b-97fe-8301154532a1', '1a9288dd-e1b8-48fc-9d38-241d0738098f', '2023-12-28 23:45:54'),
 ('65e3ba95fc13ae6456cd3683', '9c5ee840-c8b2-4d58-86c7-d87c5aac04f1', '1a9288dd-e1b8-48fc-9d38-241d0738098f', '2023-10-03 11:12:32'),
 ('65e3ba95fc13ae6456cd3684', 'bf8a4973-2408-4c40-8483-39c225743570', '1a9288dd-e1b8-48fc-9d38-241d0738098f', '2023-08-14 03:01:55'),
 ('65e3ba95fc13ae6456cd3685', 'fdb29741-d9ba-4019-af9f-5d869290af2e', '1a9288dd-e1b8-48fc-9d38-241d0738098f', '2024-01-14 20:29:21'),
 ('65e3ba95fc13ae6456cd3686', 'a4385066-147b-4560-9dc9-afd258c89791', '1a9288dd-e1b8-48fc-9d38-241d0738098f', '2023-12-20 19:42:36'),
 ('65e3ba95fc13ae6456cd3687', '9c5ee840-c8b2-4d58-86c7-d87c5aac04f1', 'cf7ab4b4-6779-4463-b518-2f1a104816ef', '2023-08-25 12:24:08');


CREATE FUNCTION dbo.CalculateInvoicePrice(@product_ID varchar(50), @quantity INT)
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @price DECIMAL(18, 2)
    SELECT @price = product_price FROM dbo.[Product] WHERE product_ID = @product_ID
    RETURN @price * @quantity
END;

CREATE TABLE dbo.PurchaseHistory(
  invoice_ID varchar(50) NOT NULL PRIMARY KEY,
  user_ID varchar(50) NOT NULL REFERENCES dbo.[User](user_ID),
  product_ID varchar(50) NOT NULL REFERENCES dbo.[Product](product_ID),
  quantity INT NOT NULL,
  invoice_price AS (dbo.CalculateInvoicePrice(product_ID, quantity)),
  purchase_time_stamp DATETIME NOT NULL
);
	
insert into PurchaseHistory (invoice_ID, user_ID, product_ID, quantity, purchase_time_stamp) values
  ('65e3c00ffc13ae6456cd368d', '6f5b5567-cf20-433d-8287-5e32a86246b3', '65e3654dfc13ae0e3fcd36da', 35, '2023-11-24 11:55:31'),
  ('65e3c00ffc13ae6456cd368e', 'e72c0006-50a6-4717-8993-128613423d55', '65e3654dfc13ae0e3fcd36dc', 44, '2023-10-01 05:04:18'),
  ('65e3c00ffc13ae6456cd368f', '0e4e1497-ffb2-491b-97fe-8301154532a1', '65e3654dfc13ae0e3fcd36f2', 6, '2023-08-06 00:51:51'),
  ('65e3c00ffc13ae6456cd3690', '6efa23ec-3bd0-4b82-b631-962f416384a8', '65e3654dfc13ae0e3fcd36e6', 50, '2023-11-06 08:29:21'),
  ('65e3c00ffc13ae6456cd3691', 'cee7e196-937b-4985-8016-07cf77c8f35b', '65e3654dfc13ae0e3fcd36e4', 28, '2023-12-12 21:20:42'),
  ('65e3c00ffc13ae6456cd3692', 'b025f973-1eb4-446d-b4c1-7ce9c3fced9d', '65e3654dfc13ae0e3fcd36ce', 49, '2024-01-23 20:35:07'),
  ('65e3c00ffc13ae6456cd3693', '1a9288dd-e1b8-48fc-9d38-241d0738098f', '65e3654dfc13ae0e3fcd36d0', 76, '2024-02-17 19:50:21'),
  ('65e3c00ffc13ae6456cd3694', 'bf8a4973-2408-4c40-8483-39c225743570', '65e3654dfc13ae0e3fcd36d2', 26, '2023-08-25 02:49:00'),
  ('65e3c00ffc13ae6456cd3695', 'cf7ab4b4-6779-4463-b518-2f1a104816ef', '65e3654dfc13ae0e3fcd36d4', 22, '2023-08-08 21:36:13'),
  ('65e3c00ffc13ae6456cd3696', 'c81d3a27-6e3e-4ebf-89fb-f3fc9c3ab63d', '65e3654dfc13ae0e3fcd370e', 92, '2023-08-26 15:16:39');

-- Views
-- Find out how many purchases are made with each label
 CREATE VIEW Purchase_Made_with_Each_Labels AS
SELECT l.label_ID, l.label_name, SUM(ph.invoice_price) AS Total
FROM dbo.Label l
LEFT JOIN dbo.Product pd
ON l.label_ID = pd.label_ID
LEFT JOIN dbo.PurchaseHistory ph
ON pd.product_ID = ph.product_ID
GROUP BY l.label_ID, l.label_name


-- Find out how many tracks belong to each genre
CREATE VIEW Num_of_Track_in_Each_Genre AS
SELECT g.genre_desc AS Genre, count(t.track_ID) AS Num_of_Track
FROM TrackGenre t
RIGHT JOIN Genre g ON t.genre_ID = g.genre_ID
GROUP BY g.genre_desc


-- Find out the Top 10 tracks liked by users
CREATE VIEW Top_10_Liked_Tracks AS
SELECT TOP 10 track_ID, COUNT(user_ID) AS total_likes
FROM dbo.[LikeHistory]
GROUP BY track_ID
ORDER BY total_likes DESC;


-- Find out the Top 10 tracks listened to by users
CREATE VIEW Top_10_Listened_Tracks AS
SELECT TOP 10 track_ID, COUNT(user_ID) AS total_listen
FROM dbo.[ListenHistory]
GROUP BY track_ID
ORDER BY total_listen DESC;

SELECT * FROM Purchase_Made_with_Each_Labels;
SELECT * FROM Num_of_Track_in_Each_Genre;
SELECT * FROM Top_10_Liked_Tracks;
SELECT * FROM Top_10_Listened_Tracks;


