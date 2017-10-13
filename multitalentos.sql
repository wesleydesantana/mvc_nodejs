# Host: localhost  (Version 5.5.5-10.1.21-MariaDB)
# Date: 2017-10-12 23:40:44
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

INSERT INTO `challenges` VALUES (8,'qwe','qweqwe','0000-00-00','0000-00-00');

#
# Structure for table "courses"
#

DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `id_courses` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id_courses`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "courses"
#

INSERT INTO `courses` VALUES (1,'asad','sadasd');

#
# Structure for table "labs"
#

DROP TABLE IF EXISTS `labs`;
CREATE TABLE `labs` (
  `id_lab` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id_lab`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "labs"
#

INSERT INTO `labs` VALUES (1,'asdasd','asdasd'),(2,'asdsasa','asdasdas'),(3,'asdsa','asdasd');

#
# Structure for table "projects"
#

DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id_project` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id_project`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "projects"
#

INSERT INTO `projects` VALUES (1,'asdsasa','sadsad'),(2,'sadsad','sadasdasd'),(3,'asdsad','asdasdasd');

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


#
# Structure for table "certificate"
#

DROP TABLE IF EXISTS `certificate`;
CREATE TABLE `certificate` (
  `id_certificate` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_challenge` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_certificate`),
  KEY `id_user` (`id_user`),
  KEY `id_challenge` (`id_challenge`),
  CONSTRAINT `certificate_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `certificate_ibfk_2` FOREIGN KEY (`id_challenge`) REFERENCES `challenges` (`id_challenge`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "certificate"
#

#
# Structure for table "certificate_buy"
#

DROP TABLE IF EXISTS `certificate_buy`;
CREATE TABLE `certificate_buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_participant` int(11) NOT NULL,
  `id_challenge` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_participant` (`id_participant`),
  KEY `id_challenge` (`id_challenge`),
  CONSTRAINT `certificate_buy_ibfk_1` FOREIGN KEY (`id_participant`) REFERENCES `participants` (`id_participant`),
  CONSTRAINT `certificate_buy_ibfk_2` FOREIGN KEY (`id_challenge`) REFERENCES `challenges` (`id_challenge`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "certificate_buy"
#
