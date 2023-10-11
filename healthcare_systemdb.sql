CREATE DATABASE  IF NOT EXISTS `healthcare_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `healthcare_system`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: healthcare_system
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.20-MariaDB

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
-- Table structure for table `allergies`
--

DROP TABLE IF EXISTS `allergies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allergies` (
  `AllergyID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` int(11) DEFAULT NULL,
  `Allergen_Name` varchar(255) DEFAULT NULL,
  `Allergy_Type` varchar(50) DEFAULT NULL,
  `Severity` varchar(20) DEFAULT NULL,
  `Notes` text DEFAULT NULL,
  PRIMARY KEY (`AllergyID`),
  KEY `PatientID` (`PatientID`),
  CONSTRAINT `allergies_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`Patient_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergies`
--

LOCK TABLES `allergies` WRITE;
/*!40000 ALTER TABLE `allergies` DISABLE KEYS */;
/*!40000 ALTER TABLE `allergies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `AppointmentID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` int(11) DEFAULT NULL,
  `DoctorID` int(11) DEFAULT NULL,
  `Appointment_Date_Time` datetime DEFAULT NULL,
  `Reason_for_Appointment` text DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`AppointmentID`),
  KEY `PatientID` (`PatientID`),
  KEY `DoctorID` (`DoctorID`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`Patient_ID`),
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing_and_payments`
--

DROP TABLE IF EXISTS `billing_and_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_and_payments` (
  `BillingID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` int(11) DEFAULT NULL,
  `DoctorID` int(11) DEFAULT NULL,
  `AppointmentID` int(11) DEFAULT NULL,
  `Billing_Date` date DEFAULT NULL,
  `Total_Amount` decimal(10,2) DEFAULT NULL,
  `Payment_Status` varchar(20) DEFAULT NULL,
  `Payment_Date` date DEFAULT NULL,
  PRIMARY KEY (`BillingID`),
  KEY `PatientID` (`PatientID`),
  KEY `DoctorID` (`DoctorID`),
  KEY `AppointmentID` (`AppointmentID`),
  CONSTRAINT `billing_and_payments_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`Patient_ID`),
  CONSTRAINT `billing_and_payments_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`),
  CONSTRAINT `billing_and_payments_ibfk_3` FOREIGN KEY (`AppointmentID`) REFERENCES `appointments` (`AppointmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_and_payments`
--

LOCK TABLES `billing_and_payments` WRITE;
/*!40000 ALTER TABLE `billing_and_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing_and_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `DepartmentID` int(11) NOT NULL AUTO_INCREMENT,
  `Department_Name` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  PRIMARY KEY (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `DoctorID` int(11) NOT NULL AUTO_INCREMENT,
  `DoctorName` varchar(255) DEFAULT NULL,
  `Specialization` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors_availability`
--

DROP TABLE IF EXISTS `doctors_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors_availability` (
  `AvailabilityID` int(11) NOT NULL AUTO_INCREMENT,
  `DoctorID` int(11) DEFAULT NULL,
  `DayOfWeek` varchar(10) DEFAULT NULL,
  `Start_Time` time DEFAULT NULL,
  `End_Time` time DEFAULT NULL,
  `Maximum_Appointment` int(11) DEFAULT NULL,
  `Current_Appointment` int(11) DEFAULT NULL,
  PRIMARY KEY (`AvailabilityID`),
  KEY `DoctorID` (`DoctorID`),
  CONSTRAINT `doctors_availability_ibfk_1` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors_availability`
--

LOCK TABLES `doctors_availability` WRITE;
/*!40000 ALTER TABLE `doctors_availability` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctors_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratory_tests`
--

DROP TABLE IF EXISTS `laboratory_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laboratory_tests` (
  `TestID` int(11) NOT NULL AUTO_INCREMENT,
  `Test_Name` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`TestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratory_tests`
--

LOCK TABLES `laboratory_tests` WRITE;
/*!40000 ALTER TABLE `laboratory_tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `laboratory_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_records`
--

DROP TABLE IF EXISTS `medical_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_records` (
  `RecordID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` int(11) DEFAULT NULL,
  `DoctorID` int(11) DEFAULT NULL,
  `Date_of_Visit` date DEFAULT NULL,
  `Diagnosis` text DEFAULT NULL,
  `Treatment` text DEFAULT NULL,
  `Prescription_ID` int(11) DEFAULT NULL,
  `Visit_Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`RecordID`),
  KEY `PatientID` (`PatientID`),
  KEY `DoctorID` (`DoctorID`),
  KEY `Prescription_ID` (`Prescription_ID`),
  CONSTRAINT `medical_records_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`Patient_ID`),
  CONSTRAINT `medical_records_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`),
  CONSTRAINT `medical_records_ibfk_3` FOREIGN KEY (`Prescription_ID`) REFERENCES `prescriptions` (`PrescriptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_records`
--

LOCK TABLES `medical_records` WRITE;
/*!40000 ALTER TABLE `medical_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `medical_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medications`
--

DROP TABLE IF EXISTS `medications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medications` (
  `MedicationID` int(11) NOT NULL AUTO_INCREMENT,
  `PrescriptionID` int(11) DEFAULT NULL,
  `Medication_Name` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Dosage` varchar(50) DEFAULT NULL,
  `Frequency` varchar(50) DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  PRIMARY KEY (`MedicationID`),
  KEY `PrescriptionID` (`PrescriptionID`),
  CONSTRAINT `medications_ibfk_1` FOREIGN KEY (`PrescriptionID`) REFERENCES `prescriptions` (`PrescriptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medications`
--

LOCK TABLES `medications` WRITE;
/*!40000 ALTER TABLE `medications` DISABLE KEYS */;
/*!40000 ALTER TABLE `medications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurses`
--

DROP TABLE IF EXISTS `nurses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurses` (
  `NurseID` int(11) NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(255) DEFAULT NULL,
  `Last_Name` varchar(255) DEFAULT NULL,
  `Contact_Information` varchar(255) DEFAULT NULL,
  `DepartmentID` int(11) DEFAULT NULL,
  PRIMARY KEY (`NurseID`),
  KEY `DepartmentID` (`DepartmentID`),
  CONSTRAINT `nurses_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurses`
--

LOCK TABLES `nurses` WRITE;
/*!40000 ALTER TABLE `nurses` DISABLE KEYS */;
/*!40000 ALTER TABLE `nurses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_lab_tests`
--

DROP TABLE IF EXISTS `patient_lab_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_lab_tests` (
  `Patient_TestID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` int(11) DEFAULT NULL,
  `DoctorID` int(11) DEFAULT NULL,
  `Test_Name` varchar(255) DEFAULT NULL,
  `Date_Ordered` date DEFAULT NULL,
  `Date_Completed` date DEFAULT NULL,
  `Test_Result` text DEFAULT NULL,
  `Lab_Technician` varchar(255) DEFAULT NULL,
  `Notes` text DEFAULT NULL,
  `PrescriptionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Patient_TestID`),
  KEY `PatientID` (`PatientID`),
  KEY `DoctorID` (`DoctorID`),
  KEY `PrescriptionID` (`PrescriptionID`),
  CONSTRAINT `patient_lab_tests_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`Patient_ID`),
  CONSTRAINT `patient_lab_tests_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`),
  CONSTRAINT `patient_lab_tests_ibfk_3` FOREIGN KEY (`PrescriptionID`) REFERENCES `prescriptions` (`PrescriptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_lab_tests`
--

LOCK TABLES `patient_lab_tests` WRITE;
/*!40000 ALTER TABLE `patient_lab_tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_lab_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `Patient_ID` int(11) NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(255) DEFAULT NULL,
  `Last_Name` varchar(255) DEFAULT NULL,
  `Phone_Number` varchar(15) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Date_of_Birth` date DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Health_Card_ID` varchar(20) DEFAULT NULL,
  `Have_Allergies` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Patient_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptions` (
  `PrescriptionID` int(11) NOT NULL AUTO_INCREMENT,
  `Notes` text DEFAULT NULL,
  `Prescription_Date` date DEFAULT NULL,
  PRIMARY KEY (`PrescriptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions`
--

LOCK TABLES `prescriptions` WRITE;
/*!40000 ALTER TABLE `prescriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'healthcare_system'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-10 22:56:07
