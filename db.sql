-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: movie_site
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actor` (
  `actor_id` int NOT NULL AUTO_INCREMENT,
  `actor_name` varchar(45) NOT NULL,
  `years_of_experience` int NOT NULL,
  PRIMARY KEY (`actor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES (1,'Haluk Bilginer',45),(2,'Kristen Stewart',28),(3,'Henry Cavill',22),(4,'Robert Pattinson',24),(5,'Cillian Murphy',26),(6,'Leonardo DiCaprio',22),(7,'Brad Pitt',25),(8,'Margot Robbie',15),(9,'Vera Farmiga',25),(10,'Patrick Wilson',25),(11,'Dwayne Johnson',25),(12,'Keir Dullea',50),(13,'Gary Lockwood',50),(14,'Melisa Sözen',16),(15,'Ben Affleck',22),(16,'Tobin Bell',55);
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `movieid` int NOT NULL,
  `username` varchar(20) NOT NULL,
  `content` varchar(45) NOT NULL,
  PRIMARY KEY (`movieid`,`username`),
  KEY `username_idx` (`username`),
  CONSTRAINT `commentmovieid` FOREIGN KEY (`movieid`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `commentusername` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (29,'admin','admin'),(29,'user1','cok guzel bir film'),(29,'user9','bu film çok guzeldı'),(30,'user1','yeni filmicıkacak mi');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directed_by`
--

DROP TABLE IF EXISTS `directed_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directed_by` (
  `movie_id` int NOT NULL,
  `movie_director_id` int NOT NULL,
  PRIMARY KEY (`movie_id`,`movie_director_id`),
  KEY `movie_director_id_idx` (`movie_director_id`),
  CONSTRAINT `movie_director_id` FOREIGN KEY (`movie_director_id`) REFERENCES `director` (`director_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directed_by`
--

LOCK TABLES `directed_by` WRITE;
/*!40000 ALTER TABLE `directed_by` DISABLE KEYS */;
INSERT INTO `directed_by` VALUES (35,2),(30,3),(36,4),(29,5),(33,6),(33,7),(38,7),(34,8),(37,9);
/*!40000 ALTER TABLE `directed_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `director` (
  `director_id` int NOT NULL AUTO_INCREMENT,
  `director_name` varchar(45) NOT NULL,
  `nationality` varchar(20) NOT NULL,
  PRIMARY KEY (`director_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'Quentin Tarantino','Amerika'),(2,'Stanley Kubrick','Amerika'),(3,'Catherine Hardwicke','Amerika'),(4,'Nuri Bilge Ceylan','Türkiye'),(5,'Christopher Nolan','İngiltere'),(6,'Michael Chaves','Amerika'),(7,'James Wan','Avustralya'),(8,'Jake Kasdan','Amerika'),(9,'Zack Snyder','Amerika');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `summary` varchar(2000) NOT NULL,
  `img` varchar(300) NOT NULL,
  `genre` varchar(45) DEFAULT NULL,
  `duration` int NOT NULL,
  `year` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (29,'Oppenheimer','American physicist J. Robert Oppenheimer headed the Manhattan Project to develop atomic bombs for the United States, and Edward Teller was among the first scientists recruited for the project. Leo Szilard and Enrico Fermi built the first nuclear reactor.','1692555591499large_386651id1_OPR_Final_27x40_1Sht_RGB.jpg','drama',190,2023),(30,'Alacakaranlık','Seri, Forks, Washington\'da yaşayan babasının yanına taşınan, genç bir kız olan Isabella \"Bella\" Swan ile Edward Cullen adlı 109 yaşındaki vampirin aşkını anlatır.','1692556723299Newmoon.jpg','romance',130,2009),(33,'Korku Seansı','Rhode Island\'da bir çiftlik evine taşınan aile, hayaletler görmeye başlayınca paranormal olayları araştıran tanınmış bir çiftten yardım ister.','169256189780121026346_20130812140044703.jpg','horror',120,2013),(34,'Jumanji','Jumanji maceralarından sağ olarak kurtulmayı başaran dört genç, üniversitenin tatile girmesiyle birlikte evlerine geri döner. Hayatlarına yeni bir yön vermeye çalışan gençler, arkadaşlarını kurtarabilmek için kendilerini yeniden Jumanji dünyasının içinde bulur.','1692562086781Jumanji_Welcome_to_the_Jungle.jpg','adventure',150,2017),(35,'2001: A Space Odyssey','İnsanlığın doğuşundan başlayarak yapay zekanın yükselişine kadar geçen kocaman bir zaman aralığını siyah bir monolitin peşine düşerek anlatan, süresine insanlığa dair onlarca soru sığdıran ve eşsiz bir sinema hazzı sunan bir film 2001.','1692562375576evrimaga.jpeg','scifi',150,1968),(36,'Kış Uykusu','Aydın emekli bir oyuncudur. Aktörlüğü bıraktıktan sonra Orta Anadolu\'da kendi halinde küçük bir otelde çalışarak günlerini geçirir. Hayatında ise iki kadın vardır: Kendisine her anlamda uzak ve soğuk olan genç karısı Nihal ve boşanmış olan kız kardeşi Necla.','1692562535436003302.jpg','drama',196,2014),(37,'Batman ve Superman: Adaletin Şafağı','Dünya gerçekte ne tür bir kahramana ihitiyaç duyduğuna karar vermek için çabalarken, kontrolsüz hareketleri süren Süper Kahraman\'ın insanlığın yanında mı karşısında mı olacağı merak edilirken Gotham Şehrinin koruyucusu Batman\'e karşı giriştiği mücadele yeni bir savaşa davetiye çıkaracaktır.','1692562812775batmanvsuperman-adaletin-safagi.jpg','adventure',150,2016),(38,'Testere','İmkan dışı seçimlerde bulunması gereken kurbanlar, ellerinden gelen mücadeleyi verirlerken farkında olmadan yaşamak uğrunda neleri feda edebileceklerine de şahit olmaktadırlar. Bu katilin son kurbanları Adam ve Dr.Lawrence Gordon\'dur. Bu adamlar birbirlerini hiç tanımazlar ama gözlerini açtıklarında aynı odadadırlar.','1692563049458Vintage-Poster-testere.jpg','horror',103,2014);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performed_by`
--

DROP TABLE IF EXISTS `performed_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performed_by` (
  `movieid` int NOT NULL,
  `movie_actor_id` int NOT NULL,
  PRIMARY KEY (`movieid`,`movie_actor_id`),
  KEY `movie_actor_id_idx` (`movie_actor_id`),
  CONSTRAINT `movie_actor_id` FOREIGN KEY (`movie_actor_id`) REFERENCES `actor` (`actor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movie_id_for_actors` FOREIGN KEY (`movieid`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performed_by`
--

LOCK TABLES `performed_by` WRITE;
/*!40000 ALTER TABLE `performed_by` DISABLE KEYS */;
INSERT INTO `performed_by` VALUES (36,1),(30,2),(37,3),(30,4),(29,5),(33,9),(33,10),(34,11),(35,12),(35,13),(36,14),(37,15),(38,16);
/*!40000 ALTER TABLE `performed_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rates`
--

DROP TABLE IF EXISTS `rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rates` (
  `username` varchar(20) NOT NULL,
  `movieid` int NOT NULL,
  `score` int NOT NULL,
  PRIMARY KEY (`username`,`movieid`),
  KEY `movieid_idx` (`movieid`),
  CONSTRAINT `ratemovieid` FOREIGN KEY (`movieid`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rateusername` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rates`
--

LOCK TABLES `rates` WRITE;
/*!40000 ALTER TABLE `rates` DISABLE KEYS */;
INSERT INTO `rates` VALUES ('admin',29,2),('admin',30,3),('user1',29,6),('user1',30,8),('user9',29,8);
/*!40000 ALTER TABLE `rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `email` varchar(45) NOT NULL,
  `age` int NOT NULL,
  `password` varchar(350) NOT NULL,
  `role` varchar(10) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','admin',10,'$2a$10$kw200PvydmEJFE3rdZUyG.Yv3lONyNXnXewxQfpC2E/CtaMQfJXri','admin'),('user1','user1@gmail.com',15,'$2a$10$sm974lPcnUUkvhZena9MO.XtJOGzYwF9M6Jx26zQBxkdZW7ETJAdS','user'),('user2','user2@gmail.com',16,'$2a$10$MY2XYgNiIExsp6Bpf/tqKeHJNjz7FPhtjPyQTUIJKlKTbCGts2X0S','user'),('user3','user3@gmail.com',20,'$2a$10$pGipWkAmtBykmDSz0.Gfh.ycKvMLxg75/fVsNyYk8vHsm.TtdOROW','user'),('user4','user4@gmail.com',22,'$2a$10$2D7JkQ.ByGHjIb5aVtELnuKyF06ZhVpNYQBp2rIcTYhSdvt7lK1jy','user'),('user5','user5@gmail.com',34,'$2a$10$2rPDH4H.KSV.1Xeu1DO6ougBHjj4QcajB9OeKLuuHm8M6Tio/hzj2','user'),('user6','user6@gmail.com',45,'$2a$10$.3KipMjKJi/zcrPQ3B6i0ub/Sd9oOD6OS/uG7gndMdzMRwkNryLf6','user'),('user7','user7@gmail.com',54,'$2a$10$1gOyAN7wZ3rkXugi9uMpi.cj87MkTUEYgjG6561pp64QUp8Oto1Xe','user'),('user9','user9',15,'$2a$10$VafsyfAtUJqR4Zgk87ViKO.9PBlWfit3tbqRNVcgh.tm6OiMZ7XhG','user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-21 20:43:52
