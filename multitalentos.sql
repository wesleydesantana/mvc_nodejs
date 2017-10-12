# Host: localhost  (Version 5.5.5-10.1.21-MariaDB)
# Date: 2017-10-12 20:09:03
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "challenges"
#

DROP TABLE IF EXISTS `challenges`;
CREATE TABLE `challenges` (
  `id_challenge` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id_challenge`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "challenges"
#

INSERT INTO `challenges` VALUES (1,'HACKANOEL','DESAFIOS DE FINAL DE ANO','2017-12-12','2017-12-13'),(2,'HACKANOEL','DESAFIOS DE FINAL DE ANO','2017-12-12','2017-12-13'),(3,'HACKANOEL','DESAFIOS DE FINAL DE ANO','2017-12-12','2017-12-13');

#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `permission` varchar(20) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "users"
#

INSERT INTO `users` VALUES (1,'Wesley','wesleydeveloper97@gmail.com','We@123','user.jpg','1'),(2,'João','joa@gmail.com','admin123','avatar.jpg','1'),(3,'Carlos','carlos@gmail.com','admin123','avatar.jpg','1'),(4,'Ana','ana@gmail.com','admin123','avatar.jpg','1'),(5,'Msria','maria@gmail.com','admin123','avatar.jpg','1'),(6,'Joana','joana@gmail.com','admin123','avatar.jpg','1'),(7,'Rafael','rafael@gmail.com','admin123','avatar.jpg','1');

#
# Structure for table "participants"
#

DROP TABLE IF EXISTS `participants`;
CREATE TABLE `participants` (
  `id_participant` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `type_account` int(11) NOT NULL,
  PRIMARY KEY (`id_participant`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `participants_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "participants"
#


#
# Structure for table "signature"
#

DROP TABLE IF EXISTS `signature`;
CREATE TABLE `signature` (
  `id_signatiure` int(11) NOT NULL AUTO_INCREMENT,
  `id_participant` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id_signatiure`),
  KEY `id_participant` (`id_participant`),
  CONSTRAINT `signature_ibfk_1` FOREIGN KEY (`id_participant`) REFERENCES `participants` (`id_participant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "signature"
#


#
# Structure for table "challenges_users"
#

DROP TABLE IF EXISTS `challenges_users`;
CREATE TABLE `challenges_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_challenge` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_challenge` (`id_challenge`),
  CONSTRAINT `challenges_users_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `challenges_users_ibfk_2` FOREIGN KEY (`id_challenge`) REFERENCES `challenges` (`id_challenge`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "challenges_users"
#

INSERT INTO `challenges_users` VALUES (1,1,1),(2,1,1);
