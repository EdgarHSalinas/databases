CREATE DATABASE chat;

USE chat;

DROP TABLE IF EXISTS messages;

-- CREATE TABLE messages (
--   /* Describe your table here.*/
-- );

/* Create other tables and define schemas for them here! */




/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/



		
CREATE TABLE messages (
  id INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  message MEDIUMTEXT(150) NULL DEFAULT NULL,
  id_users INTEGER(10) NULL DEFAULT NULL,
  id_room INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Table 'users'
-- 
-- ---

DROP TABLE IF EXISTS users;
		
CREATE TABLE users (
  id INTEGER(10) NULL AUTO_INCREMENT DEFAULT NULL,
  username VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Table 'room'
-- 
-- ---

DROP TABLE IF EXISTS room;
		
CREATE TABLE room (
  id INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  roomname VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Table 'room/user'
-- 
-- ---

DROP TABLE IF EXISTS room/user;
		
CREATE TABLE room/user (
  id INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  id_room INTEGER NULL DEFAULT NULL,
  id_users INTEGER(10) NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE messages ADD FOREIGN KEY (id_users) REFERENCES users (id);
ALTER TABLE messages ADD FOREIGN KEY (id_room) REFERENCES room (id);
ALTER TABLE room/user ADD FOREIGN KEY (id_room) REFERENCES room (id);
ALTER TABLE room/user ADD FOREIGN KEY (id_users) REFERENCES users (id);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE messages ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE users ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE room ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE room/user ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO messages (id,message,id_users,id_room) VALUES
-- ('','','','');
-- INSERT INTO users (id,username) VALUES
-- ('','');
-- INSERT INTO room (id,roomname) VALUES
-- ('','');
-- INSERT INTO room/user (id,id_room,id_users) VALUES
-- ('','','');