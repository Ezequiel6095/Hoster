/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 5.0.13-rc-nt : Database - hoster
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hoster` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `hoster`;

/*Table structure for table `detallereserva` */

DROP TABLE IF EXISTS `detallereserva`;

CREATE TABLE `detallereserva` (
  `idHabitacion` int(10) unsigned NOT NULL,
  `idReserva` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`idHabitacion`,`idReserva`),
  KEY `DetalleReserva_FKIndex1` (`idHabitacion`),
  KEY `DetalleReserva_FKIndex2` (`idReserva`),
  CONSTRAINT `detallereserva_ibfk_1` FOREIGN KEY (`idHabitacion`) REFERENCES `habitacion` (`idHabitacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `detallereserva_ibfk_2` FOREIGN KEY (`idReserva`) REFERENCES `reserva` (`idReserva`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detallereserva` */

/*Table structure for table `habitacion` */

DROP TABLE IF EXISTS `habitacion`;

CREATE TABLE `habitacion` (
  `idHabitacion` int(10) unsigned NOT NULL,
  `idTipoHabitacion` int(10) unsigned NOT NULL,
  `Estado` varchar(10) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  PRIMARY KEY  (`idHabitacion`),
  KEY `habitacion_FKIndex1` (`idTipoHabitacion`),
  CONSTRAINT `habitacion_ibfk_1` FOREIGN KEY (`idTipoHabitacion`) REFERENCES `tipohabitacion` (`idTipoHabitacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `habitacion` */

/*Table structure for table `reserva` */

DROP TABLE IF EXISTS `reserva`;

CREATE TABLE `reserva` (
  `idReserva` int(10) unsigned NOT NULL,
  `idUsuario` int(10) unsigned NOT NULL,
  `Usuario_idUsuario` int(10) unsigned NOT NULL,
  `Huesped_idHuesped` int(10) unsigned NOT NULL,
  `Entrada` date NOT NULL,
  `Salida` date NOT NULL,
  `Estado` varchar(10) NOT NULL,
  `PrecioTotal` double NOT NULL,
  PRIMARY KEY  (`idReserva`),
  KEY `reserva_FKIndex1` (`idUsuario`),
  CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `reserva` */

/*Table structure for table `tipohabitacion` */

DROP TABLE IF EXISTS `tipohabitacion`;

CREATE TABLE `tipohabitacion` (
  `idTipoHabitacion` int(10) unsigned NOT NULL auto_increment,
  `Ubicacion` varchar(15) default NULL,
  `Tipo_Habitacion` varchar(20) default NULL,
  `Capacidad` int(10) unsigned default NULL,
  PRIMARY KEY  (`idTipoHabitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipohabitacion` */

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `idUsuario` int(10) unsigned NOT NULL auto_increment,
  `nick` varchar(20) NOT NULL default '',
  `pass` varchar(30) NOT NULL default '',
  `nivel` int(2) NOT NULL,
  `estado` varchar(10) NOT NULL default '',
  `nombre` varchar(50) NOT NULL default '',
  `direccion` varchar(100) default NULL,
  `mail` varchar(20) default NULL,
  `telefono` int(10) unsigned default NULL,
  PRIMARY KEY  (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usuario` */

insert  into `usuario`(`idUsuario`,`nick`,`pass`,`nivel`,`estado`,`nombre`,`direccion`,`mail`,`telefono`) values 
(1,'Erze','admin',1,'Activo','Ezequiel Diaz','Asuncion','mail@gmail.com',991809173),
(5,'Huesped','123',0,'Activo','Huesped',NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
