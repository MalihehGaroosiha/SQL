-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: electronicsdb
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `productcategories`
--

DROP TABLE IF EXISTS `productcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productcategories` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcategories`
--

LOCK TABLES `productcategories` WRITE;
/*!40000 ALTER TABLE `productcategories` DISABLE KEYS */;
INSERT INTO `productcategories` VALUES (31,'Smartphones'),(32,'Laptops'),(33,'Tablets'),(34,'Headphones'),(35,'Smart Watches'),(36,'Gaming Consoles'),(37,'Cameras'),(38,'Printers'),(39,'Monitors'),(40,'Speakers'),(41,'Keyboards'),(42,'Mice'),(43,'Webcams'),(44,'External Hard Drives'),(45,'USB Flash Drives'),(46,'Wireless Routers'),(47,'Smart Home Devices'),(48,'VR Headsets'),(49,'E-readers'),(50,'Fitness Trackers');
/*!40000 ALTER TABLE `productcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(255) DEFAULT NULL,
  `Specifications` text,
  `CategoryID` int NOT NULL,
  `SupplierID` int DEFAULT NULL,
  PRIMARY KEY (`ProductID`,`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (41,'Alpha Smartphone','64GB Storage, Black Color, 6.1-inch OLED Display, A14 Bionic Chip, Dual-camera system',31,50),(42,'Beta Smartphone','128GB Storage, White Color, Face ID, A14 Bionic Chip, Water and Dust Resistant',31,50),(43,'Gamma Laptop','15-inch Retina display, 256GB SSD, 16GB RAM, 10th-generation Intel Core i7 processor, Touch Bar and Touch ID',32,50),(44,'Delta Laptop','13-inch Retina display, 512GB SSD, 16GB RAM, 8-core CPU, 8-core GPU, 20 hours battery life',32,40),(45,'Epsilon Tablet','10-inch Full HD Display, 64GB Internal Storage, Octa-core Processor, Long-lasting Battery',33,40),(46,'Zeta Tablet','8-inch HD Display, 32GB Internal Storage, Quad-core Processor, Lightweight Design',33,40),(47,'Eta Headphone','Wireless Connectivity, Noise Cancellation, Over-ear Design, 20 Hours Playtime, Built-in Microphone',34,35),(48,'Theta Headphone','Wired Connectivity, In-Ear Design, Tangle-free Cable, Integrated Microphone, Deep Bass',34,35),(49,'Iota Smart Watch','GPS Enabled, Heart Rate Monitor, OLED Retina Display, Water Resistant, Notifications',35,35),(50,'Kappa Smart Watch','Fitness Tracking, Waterproof up to 50m, Sleep Monitoring, High and Low Heart Rate Notifications, Bluetooth',35,45),(51,'Lambda Console','1TB Storage, 2 Wireless Controllers, 4K Gaming, HDR Technology, Blu-ray Player',36,45),(52,'Mu Console','500GB Storage, VR Ready, 8-Core x86-64 AMD Jaguar CPU, GDDR5 8GB Memory, Blu-ray and DVD Player',36,45),(53,'Nu Camera','DSLR Camera, 24MP Full-Frame CMOS Sensor, 4K Video Recording, Built-in Wi-Fi, 3.2 inches Touchscreen LCD',37,33),(54,'Xi Camera','Mirrorless Camera, 20MP Sensor, Compact Build, Interchangeable Lens, 4K Video Recording',37,33),(55,'Omicron Printer','Inkjet Printer, Wireless Printing, Color Printer, Mobile Printing, Print, Scan, Copy Functions',38,33),(56,'Pi Printer','Laser Printer, Multifunction with Fax, High-speed Printing, Ethernet Networking, Duplex Printing',38,33),(57,'Rho Monitor','27-inch 4K UHD Monitor, IPS Display, 5ms Response Time, HDMI & DisplayPort, Adjustable Stand',39,50),(58,'Sigma Monitor','24-inch Full HD 1080p Monitor, LED Display, 1ms Response Time, HDMI & VGA Ports, Slim Design',39,33),(59,'Tau Speaker','Bluetooth Connectivity, Waterproof Design, Portable Speaker, 360° Sound, Built-in Microphone',40,33),(60,'Upsilon Speaker','Bookshelf Speaker, Wired Connectivity, Wooden Enclosure, 60W RMS Power, 5.25\" Woofer',40,33);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeinventory`
--

DROP TABLE IF EXISTS `storeinventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storeinventory` (
  `InventoryID` int NOT NULL AUTO_INCREMENT,
  `StoreID` int NOT NULL,
  `ProductID` int NOT NULL,
  `QuantityInStock` int DEFAULT NULL,
  PRIMARY KEY (`InventoryID`,`StoreID`,`ProductID`),
  KEY `fk_storeinventory_stores_idx` (`StoreID`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeinventory`
--

LOCK TABLES `storeinventory` WRITE;
/*!40000 ALTER TABLE `storeinventory` DISABLE KEYS */;
INSERT INTO `storeinventory` VALUES (71,31,41,20),(72,31,42,15),(73,32,43,30),(74,32,44,25),(75,33,45,40),(76,33,46,35),(77,34,47,50),(78,34,48,45),(79,35,49,60),(80,35,50,55),(81,36,51,70),(82,36,52,65),(83,37,53,80),(84,37,54,75),(85,38,55,90),(86,38,56,85),(87,39,57,100),(88,39,58,95),(89,40,59,110),(90,40,60,105);
/*!40000 ALTER TABLE `storeinventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stores` (
  `StoreID` int NOT NULL AUTO_INCREMENT,
  `StoreName` varchar(255) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`StoreID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (31,'Tech Haven','Toronto'),(32,'Gadget Galaxy','Montreal'),(33,'Electron Emporium','Vancouver'),(34,'Device Domain','Calgary'),(35,'Innovate Infinity','Edmonton'),(36,'Digital Den','Ottawa'),(37,'Future Finds','Quebec City'),(38,'Tech Treasures','Winnipeg'),(39,'Gizmo Grove','Halifax'),(40,'Silicon Spot','Saskatoon'),(41,'Circuit City','Victoria'),(42,'Byte Boutique','Regina'),(43,'Widget World','St. John\'s'),(44,'Gadgetry Grounds','Charlottetown'),(45,'Electron Ecosystem','Fredericton'),(46,'Tech Terrain','Yellowknife'),(47,'Digital Domain','Whitehorse'),(48,'Circuit Cove','Iqaluit'),(49,'Gizmo Garden','Nunavut'),(50,'Tech Territory','Yukon');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `SupplierID` int NOT NULL AUTO_INCREMENT,
  `SupplierName` varchar(255) DEFAULT NULL,
  `ContactInfo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (31,'TechSource Canada','Toronto, ON'),(32,'GadgetGuru Inc.','Montreal, QC'),(33,'ElectroSupply Co.','Vancouver, BC'),(34,'Innovate Solutions','Calgary, AB'),(35,'Digital Dynamics','Edmonton, AB'),(36,'FutureTech Ltd.','Ottawa, ON'),(37,'Circuit Central','Quebec City, QC'),(38,'Silicon Supplies','Winnipeg, MB'),(39,'Gizmo Gears','Halifax, NS'),(40,'Byte Builders','Saskatoon, SK'),(41,'Circuitry Concepts','Victoria, BC'),(42,'Tech Titans','Regina, SK'),(43,'Widget Wholesalers','St. John\'s, NL'),(44,'Gadget Goods','Charlottetown, PE'),(45,'Electron Enterprises','Fredericton, NB'),(46,'Tech Traders','Yellowknife, NT'),(47,'Digital Dealers','Whitehorse, YT'),(48,'Circuit City','Iqaluit, NU'),(49,'Gizmo Giants','Nunavut'),(50,'Tech Treasures','Yukon');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-15  2:01:55
