-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema la_verde
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema la_verde
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `la_verde` DEFAULT CHARACTER SET utf8mb3 ;
USE `la_verde` ;

-- -----------------------------------------------------
-- Table `la_verde`.`CATEGORIA_PRO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`CATEGORIA_PRO` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `la_verde`.`CONTINENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`CONTINENTE` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `continente` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `la_verde`.`PAIS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`PAIS` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pais` VARCHAR(255) NOT NULL,
  `continente_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `continente_id` (`continente_id` ASC) VISIBLE,
  CONSTRAINT `PAIS_ibfk_1`
    FOREIGN KEY (`continente_id`)
    REFERENCES `la_verde`.`CONTINENTE` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `la_verde`.`CIUDAD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`CIUDAD` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ciudad` VARCHAR(255) NOT NULL,
  `pais_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `pais_id` (`pais_id` ASC) VISIBLE,
  CONSTRAINT `CIUDAD_ibfk_1`
    FOREIGN KEY (`pais_id`)
    REFERENCES `la_verde`.`PAIS` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `la_verde`.`USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`USUARIO` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT,
  `primer_nombre` VARCHAR(255) NOT NULL,
  `segundo_nombre` VARCHAR(255) NULL DEFAULT NULL,
  `primer_apellido` VARCHAR(255) NOT NULL,
  `segundo_apellido` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`usuario_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `la_verde`.`DIRECCION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`DIRECCION` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `calle` INT NULL DEFAULT NULL,
  `carrera` INT NULL DEFAULT NULL,
  `transversal` INT NULL DEFAULT NULL,
  `diagonal` INT NULL DEFAULT NULL,
  `numero` INT NULL DEFAULT NULL,
  `ciudad_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `ciudad_id` (`ciudad_id` ASC) VISIBLE,
  CONSTRAINT `DIRECCION_ibfk_1`
    FOREIGN KEY (`ciudad_id`)
    REFERENCES `la_verde`.`CIUDAD` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `la_verde`.`CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`CLIENTE` (
  `cc_cliente` INT NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `estado` VARCHAR(15) NOT NULL,
  `genero` VARCHAR(45) NOT NULL,
  `fecha_nacimiento` DATETIME NOT NULL,
  `fecha_afiliacion` DATETIME NOT NULL,
  `tipo_pago` VARCHAR(45) NOT NULL,
  `usuario_id` INT NOT NULL,
  `direccion_id` INT NOT NULL,
  PRIMARY KEY (`cc_cliente`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE,
  INDEX `usuario_id` (`usuario_id` ASC) VISIBLE,
  INDEX `direccion_id` (`direccion_id` ASC) VISIBLE,
  UNIQUE INDEX `cc_cliente_UNIQUE` (`cc_cliente` ASC) VISIBLE,
  CONSTRAINT `CLIENTE_ibfk_1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `la_verde`.`USUARIO` (`usuario_id`),
  CONSTRAINT `CLIENTE_ibfk_2`
    FOREIGN KEY (`direccion_id`)
    REFERENCES `la_verde`.`DIRECCION` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `la_verde`.`CARGO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`CARGO` (
  `cargo_id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`cargo_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_verde`.`EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`EMPLEADO` (
  `cc_empleado` INT UNSIGNED NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `estado` VARCHAR(15) NOT NULL,
  `fecha_contrato` DATETIME NOT NULL,
  `fecha_nacimiento` DATETIME NOT NULL,
  `genero` VARCHAR(45) NOT NULL,
  `cargo_id` INT NOT NULL,
  `direccion_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`cc_empleado`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE,
  INDEX `usuario_id` (`usuario_id` ASC) VISIBLE,
  INDEX `direccion_id` (`direccion_id` ASC) VISIBLE,
  UNIQUE INDEX `cc_empleado_UNIQUE` (`cc_empleado` ASC) VISIBLE,
  INDEX `fk_EMPLEADO_CARGO1_idx` (`cargo_id` ASC) VISIBLE,
  CONSTRAINT `EMPLEADO_ibfk_1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `la_verde`.`USUARIO` (`usuario_id`),
  CONSTRAINT `EMPLEADO_ibfk_2`
    FOREIGN KEY (`direccion_id`)
    REFERENCES `la_verde`.`DIRECCION` (`id`),
  CONSTRAINT `fk_EMPLEADO_CARGO1`
    FOREIGN KEY (`cargo_id`)
    REFERENCES `la_verde`.`CARGO` (`cargo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `la_verde`.`PRODUCTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`PRODUCTO` (
  `producto_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `descripcion` VARCHAR(255) NOT NULL,
  `cantidad` INT NOT NULL,
  `fecha_vencimiento` DATETIME NOT NULL,
  `categoria_id` INT NOT NULL,
  `precio` INT NOT NULL,
  PRIMARY KEY (`producto_id`),
  INDEX `fk_PRODUCTO_CATEGORIA1_idx` (`categoria_id` ASC) VISIBLE,
  CONSTRAINT `fk_PRODUCTO_CATEGORIA1`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `la_verde`.`CATEGORIA_PRO` (`id_categoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `la_verde`.`PROVEEDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`PROVEEDOR` (
  `nit` INT NOT NULL,
  `empresa` VARCHAR(255) NOT NULL,
  `fecha_asociacion` DATETIME NOT NULL,
  `telefono` VARCHAR(15) NULL DEFAULT NULL,
  `email` VARCHAR(255) NOT NULL,
  `razon_social` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(15) NOT NULL,
  `direccion_id` INT NOT NULL,
  UNIQUE INDEX `nit` (`nit` ASC) VISIBLE,
  UNIQUE INDEX `email` (`email` ASC) VISIBLE,
  INDEX `direccion_id` (`direccion_id` ASC) VISIBLE,
  PRIMARY KEY (`nit`),
  CONSTRAINT `PROVEEDOR_ibfk_1`
    FOREIGN KEY (`direccion_id`)
    REFERENCES `la_verde`.`DIRECCION` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `la_verde`.`VENTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`VENTA` (
  `venta_id` INT NOT NULL AUTO_INCREMENT,
  `detalle` VARCHAR(255) NOT NULL,
  `subtotal` INT NOT NULL,
  `cc_cliente` INT NOT NULL,
  `cc_empleado` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`venta_id`),
  INDEX `cliente_id` (`cc_cliente` ASC) VISIBLE,
  INDEX `fk_VENTA_EMPLEADO1_idx` (`cc_empleado` ASC) VISIBLE,
  CONSTRAINT `VENTA_ibfk_2`
    FOREIGN KEY (`cc_cliente`)
    REFERENCES `la_verde`.`CLIENTE` (`cc_cliente`),
  CONSTRAINT `fk_VENTA_EMPLEADO1`
    FOREIGN KEY (`cc_empleado`)
    REFERENCES `la_verde`.`EMPLEADO` (`cc_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `la_verde`.`VENTA_PRODUCTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`VENTA_PRODUCTO` (
  `venta_id` INT NOT NULL,
  `producto_id` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`venta_id`, `producto_id`),
  INDEX `producto_id` (`producto_id` ASC) VISIBLE,
  CONSTRAINT `VENTA_PRODUCTO_ibfk_1`
    FOREIGN KEY (`venta_id`)
    REFERENCES `la_verde`.`VENTA` (`venta_id`),
  CONSTRAINT `VENTA_PRODUCTO_ibfk_2`
    FOREIGN KEY (`producto_id`)
    REFERENCES `la_verde`.`PRODUCTO` (`producto_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `la_verde`.`CATEGORIA_INS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`CATEGORIA_INS` (
  `categoria_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`categoria_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_verde`.`INSUMOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`INSUMOS` (
  `idINSUMOS` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(500) NOT NULL,
  `fecha_adq` DATETIME NOT NULL,
  `fecha_exp` DATETIME NULL,
  `estado` VARCHAR(45) NOT NULL,
  `cantidad` INT NOT NULL,
  `ubicacion` VARCHAR(45) NULL,
  `categoria_id` INT NOT NULL,
  PRIMARY KEY (`idINSUMOS`),
  INDEX `fk_INSUMOS_CATEGORIA_INS1_idx` (`categoria_id` ASC) VISIBLE,
  CONSTRAINT `fk_INSUMOS_CATEGORIA_INS1`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `la_verde`.`CATEGORIA_INS` (`categoria_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_verde`.`MAQUINARIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`MAQUINARIA` (
  `maquinaria_id` INT NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NULL,
  `numero_serie` VARCHAR(45) NOT NULL,
  `insumos_id` INT NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`maquinaria_id`, `insumos_id`),
  INDEX `fk_MAQUINARIA_INSUMOS1_idx` (`insumos_id` ASC) VISIBLE,
  CONSTRAINT `fk_MAQUINARIA_INSUMOS1`
    FOREIGN KEY (`insumos_id`)
    REFERENCES `la_verde`.`INSUMOS` (`idINSUMOS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_verde`.`TIPO_PRODUCCION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`TIPO_PRODUCCION` (
  `tipo_pro_id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tipo_pro_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_verde`.`TIPO_CULTIVO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`TIPO_CULTIVO` (
  `tipo_cultivo_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tipo_cultivo_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_verde`.`SEMILLAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`SEMILLAS` (
  `semillas_id` INT NOT NULL AUTO_INCREMENT,
  `variedad` VARCHAR(45) NOT NULL,
  `calidad` VARCHAR(45) NOT NULL,
  `ciclo_vida` VARCHAR(45) NOT NULL,
  `fecha_exp` DATETIME NOT NULL,
  `insumos_id` INT NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`semillas_id`, `insumos_id`),
  INDEX `fk_SEMILLAS_INSUMOS1_idx` (`insumos_id` ASC) VISIBLE,
  CONSTRAINT `fk_SEMILLAS_INSUMOS1`
    FOREIGN KEY (`insumos_id`)
    REFERENCES `la_verde`.`INSUMOS` (`idINSUMOS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_verde`.`CULTIVOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`CULTIVOS` (
  `cultivo_id` INT NOT NULL,
  `fecha_siembra` DATETIME NOT NULL,
  `fecha_cose_estimada` DATETIME NOT NULL,
  `fecha_cosecha` DATETIME NOT NULL,
  `area` INT NOT NULL,
  `observaciones` VARCHAR(45) NOT NULL,
  `tipo_cultivo_id` INT NOT NULL,
  `tipo_pro_id` INT NOT NULL,
  `semillas_id` INT NOT NULL,
  PRIMARY KEY (`cultivo_id`),
  INDEX `fk_CULTIVOS_TIPO_CULTIVO1_idx` (`tipo_cultivo_id` ASC) VISIBLE,
  INDEX `fk_CULTIVOS_TIPO_PRODUCCION1_idx` (`tipo_pro_id` ASC) VISIBLE,
  INDEX `fk_CULTIVOS_SEMILLAS1_idx` (`semillas_id` ASC) VISIBLE,
  CONSTRAINT `fk_CULTIVOS_TIPO_CULTIVO1`
    FOREIGN KEY (`tipo_cultivo_id`)
    REFERENCES `la_verde`.`TIPO_CULTIVO` (`tipo_cultivo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CULTIVOS_TIPO_PRODUCCION1`
    FOREIGN KEY (`tipo_pro_id`)
    REFERENCES `la_verde`.`TIPO_PRODUCCION` (`tipo_pro_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CULTIVOS_SEMILLAS1`
    FOREIGN KEY (`semillas_id`)
    REFERENCES `la_verde`.`SEMILLAS` (`semillas_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_verde`.`INFORME`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`INFORME` (
  `informe_id` INT NOT NULL AUTO_INCREMENT,
  `evento` VARCHAR(500) NOT NULL,
  `descripcion` VARCHAR(500) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`informe_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_verde`.`HORARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`HORARIO` (
  `horario_id` INT NOT NULL AUTO_INCREMENT,
  `fecha_entrada` DATETIME NULL,
  `fecha_salida` DATETIME NULL,
  PRIMARY KEY (`horario_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_verde`.`HORARIO_EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`HORARIO_EMPLEADO` (
  `horario_id` INT NOT NULL AUTO_INCREMENT,
  `cc_empleado` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`horario_id`, `cc_empleado`),
  INDEX `fk_HORARIO_EMPLEADO_has_EMPLEADO_EMPLEADO1_idx` (`cc_empleado` ASC) VISIBLE,
  INDEX `fk_HORARIO_EMPLEADO_has_EMPLEADO_HORARIO_EMPLEADO1_idx` (`horario_id` ASC) VISIBLE,
  CONSTRAINT `fk_HORARIO_EMPLEADO_has_EMPLEADO_HORARIO_EMPLEADO1`
    FOREIGN KEY (`horario_id`)
    REFERENCES `la_verde`.`HORARIO` (`horario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_HORARIO_EMPLEADO_has_EMPLEADO_EMPLEADO1`
    FOREIGN KEY (`cc_empleado`)
    REFERENCES `la_verde`.`EMPLEADO` (`cc_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_verde`.`HISTORIAL_EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`HISTORIAL_EMPLEADO` (
  `historial_id` INT NOT NULL AUTO_INCREMENT,
  `evento` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `fecha` DATETIME NOT NULL,
  `cc_empleado` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`historial_id`, `cc_empleado`),
  INDEX `fk_HISTORIAL_EMPLEADO_EMPLEADO1_idx` (`cc_empleado` ASC) VISIBLE,
  CONSTRAINT `fk_HISTORIAL_EMPLEADO_EMPLEADO1`
    FOREIGN KEY (`cc_empleado`)
    REFERENCES `la_verde`.`EMPLEADO` (`cc_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_verde`.`SALARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`SALARIO` (
  `salario_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `monto` INT NOT NULL,
  `fecha_pago` VARCHAR(45) NOT NULL,
  `bono` INT NULL,
  `descuento` INT NULL,
  `cc_empleado` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`salario_id`),
  INDEX `fk_SALARIO_EMPLEADO1_idx` (`cc_empleado` ASC) VISIBLE,
  UNIQUE INDEX `EMPLEADO_cc_empleado_UNIQUE` (`cc_empleado` ASC) VISIBLE,
  UNIQUE INDEX `salario_id_UNIQUE` (`salario_id` ASC) VISIBLE,
  CONSTRAINT `fk_SALARIO_EMPLEADO1`
    FOREIGN KEY (`cc_empleado`)
    REFERENCES `la_verde`.`EMPLEADO` (`cc_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_verde`.`INFORME_EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`INFORME_EMPLEADO` (
  `informe_id` INT NOT NULL,
  `cc_empleado` INT UNSIGNED NOT NULL,
  `fecha` DATETIME NOT NULL,
  PRIMARY KEY (`informe_id`, `cc_empleado`),
  INDEX `fk_INFORME_has_EMPLEADO_EMPLEADO1_idx` (`cc_empleado` ASC) VISIBLE,
  INDEX `fk_INFORME_has_EMPLEADO_INFORME1_idx` (`informe_id` ASC) VISIBLE,
  CONSTRAINT `fk_INFORME_has_EMPLEADO_INFORME1`
    FOREIGN KEY (`informe_id`)
    REFERENCES `la_verde`.`INFORME` (`informe_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_INFORME_has_EMPLEADO_EMPLEADO1`
    FOREIGN KEY (`cc_empleado`)
    REFERENCES `la_verde`.`EMPLEADO` (`cc_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_verde`.`VISITAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`VISITAS` (
  `visita_ID` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NULL,
  `comentarios` VARCHAR(45) NULL,
  `cc_cliente` INT NOT NULL,
  PRIMARY KEY (`visita_ID`),
  INDEX `fk_VISITAS_CLIENTE1_idx` (`cc_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_VISITAS_CLIENTE1`
    FOREIGN KEY (`cc_cliente`)
    REFERENCES `la_verde`.`CLIENTE` (`cc_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_verde`.`DEVOLUCIONES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`DEVOLUCIONES` (
  `devolucion_id` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  `venta_id` INT NOT NULL,
  PRIMARY KEY (`devolucion_id`),
  INDEX `fk_DEVOLUCIONES_VENTA1_idx` (`venta_id` ASC) VISIBLE,
  CONSTRAINT `fk_DEVOLUCIONES_VENTA1`
    FOREIGN KEY (`venta_id`)
    REFERENCES `la_verde`.`VENTA` (`venta_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_verde`.`COMPRA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`COMPRA` (
  `compra_id` INT NOT NULL AUTO_INCREMENT,
  `detalle` VARCHAR(500) NULL,
  `cc_empleado` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`compra_id`),
  INDEX `fk_COMPRA_EMPLEADO1_idx` (`cc_empleado` ASC) VISIBLE,
  CONSTRAINT `fk_COMPRA_EMPLEADO1`
    FOREIGN KEY (`cc_empleado`)
    REFERENCES `la_verde`.`EMPLEADO` (`cc_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_verde`.`INFORME_PRO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`INFORME_PRO` (
  `nit` INT NOT NULL,
  `informe_id` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  PRIMARY KEY (`nit`, `informe_id`),
  INDEX `fk_PROVEEDOR_has_INFORME_INFORME1_idx` (`informe_id` ASC) VISIBLE,
  INDEX `fk_PROVEEDOR_has_INFORME_PROVEEDOR1_idx` (`nit` ASC) VISIBLE,
  CONSTRAINT `fk_PROVEEDOR_has_INFORME_PROVEEDOR1`
    FOREIGN KEY (`nit`)
    REFERENCES `la_verde`.`PROVEEDOR` (`nit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PROVEEDOR_has_INFORME_INFORME1`
    FOREIGN KEY (`informe_id`)
    REFERENCES `la_verde`.`INFORME` (`informe_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `la_verde`.`HERBICIDAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`HERBICIDAS` (
  `herbicidas_id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  `composicion` VARCHAR(45) NOT NULL,
  `modo_uso` VARCHAR(45) NOT NULL,
  `restricciones` VARCHAR(45) NOT NULL,
  `insumos_id` INT NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`herbicidas_id`, `insumos_id`),
  INDEX `fk_HERBICIDAS_INSUMOS1_idx` (`insumos_id` ASC) VISIBLE,
  CONSTRAINT `fk_HERBICIDAS_INSUMOS1`
    FOREIGN KEY (`insumos_id`)
    REFERENCES `la_verde`.`INSUMOS` (`idINSUMOS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_verde`.`HERRAMIENTAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`HERRAMIENTAS` (
  `herramienta_id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  `material` VARCHAR(45) NOT NULL,
  `vida_util` VARCHAR(45) NOT NULL,
  `ubicacion` VARCHAR(45) NULL,
  `insumos_id` INT NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`herramienta_id`, `insumos_id`),
  INDEX `fk_HERRAMIENTAS_INSUMOS1_idx` (`insumos_id` ASC) VISIBLE,
  CONSTRAINT `fk_HERRAMIENTAS_INSUMOS1`
    FOREIGN KEY (`insumos_id`)
    REFERENCES `la_verde`.`INSUMOS` (`idINSUMOS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_verde`.`FERTILIZANTES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`FERTILIZANTES` (
  `fertilizante_id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(500) NOT NULL,
  `composicion` VARCHAR(500) NOT NULL,
  `modo_aplicar` VARCHAR(500) NOT NULL,
  `fecha_exp` DATETIME NOT NULL,
  `insumos_id` INT NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`fertilizante_id`, `insumos_id`),
  INDEX `fk_FERTILIZANTES_INSUMOS1_idx` (`insumos_id` ASC) VISIBLE,
  CONSTRAINT `fk_FERTILIZANTES_INSUMOS1`
    FOREIGN KEY (`insumos_id`)
    REFERENCES `la_verde`.`INSUMOS` (`idINSUMOS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_verde`.`HERBICIDAS_CULT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`HERBICIDAS_CULT` (
  `herbicidas_id` INT NOT NULL,
  `cultivo_id` INT NOT NULL,
  `fecha_uso` DATETIME NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`herbicidas_id`, `cultivo_id`),
  INDEX `fk_HERBICIDAS_has_CULTIVOS_CULTIVOS1_idx` (`cultivo_id` ASC) VISIBLE,
  INDEX `fk_HERBICIDAS_has_CULTIVOS_HERBICIDAS1_idx` (`herbicidas_id` ASC) VISIBLE,
  CONSTRAINT `fk_HERBICIDAS_has_CULTIVOS_HERBICIDAS1`
    FOREIGN KEY (`herbicidas_id`)
    REFERENCES `la_verde`.`HERBICIDAS` (`herbicidas_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_HERBICIDAS_has_CULTIVOS_CULTIVOS1`
    FOREIGN KEY (`cultivo_id`)
    REFERENCES `la_verde`.`CULTIVOS` (`cultivo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_verde`.`FERTILIZANTES_CULT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`FERTILIZANTES_CULT` (
  `fertilizante_id` INT NOT NULL,
  `cultivo_id` INT NOT NULL,
  `fecha_uso` DATETIME NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`fertilizante_id`, `cultivo_id`),
  INDEX `fk_FERTILIZANTES_has_CULTIVOS_CULTIVOS1_idx` (`cultivo_id` ASC) VISIBLE,
  INDEX `fk_FERTILIZANTES_has_CULTIVOS_FERTILIZANTES1_idx` (`fertilizante_id` ASC) VISIBLE,
  CONSTRAINT `fk_FERTILIZANTES_has_CULTIVOS_FERTILIZANTES1`
    FOREIGN KEY (`fertilizante_id`)
    REFERENCES `la_verde`.`FERTILIZANTES` (`fertilizante_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FERTILIZANTES_has_CULTIVOS_CULTIVOS1`
    FOREIGN KEY (`cultivo_id`)
    REFERENCES `la_verde`.`CULTIVOS` (`cultivo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_verde`.`MAQUINARIA_CULT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`MAQUINARIA_CULT` (
  `maquinaria_id` INT NOT NULL,
  `cultivo_id` INT NOT NULL,
  `fecha_uso` DATETIME NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`maquinaria_id`, `cultivo_id`),
  INDEX `fk_MAQUINARIA_has_CULTIVOS_CULTIVOS1_idx` (`cultivo_id` ASC) VISIBLE,
  INDEX `fk_MAQUINARIA_has_CULTIVOS_MAQUINARIA1_idx` (`maquinaria_id` ASC) VISIBLE,
  CONSTRAINT `fk_MAQUINARIA_has_CULTIVOS_MAQUINARIA1`
    FOREIGN KEY (`maquinaria_id`)
    REFERENCES `la_verde`.`MAQUINARIA` (`maquinaria_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MAQUINARIA_has_CULTIVOS_CULTIVOS1`
    FOREIGN KEY (`cultivo_id`)
    REFERENCES `la_verde`.`CULTIVOS` (`cultivo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_verde`.`HERRAMIENTAS_CULT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`HERRAMIENTAS_CULT` (
  `herramienta_id` INT NOT NULL,
  `cultivo_id` INT NOT NULL,
  `fecha_uso` DATETIME NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`herramienta_id`, `cultivo_id`),
  INDEX `fk_HERRAMIENTAS_has_CULTIVOS_CULTIVOS1_idx` (`cultivo_id` ASC) VISIBLE,
  INDEX `fk_HERRAMIENTAS_has_CULTIVOS_HERRAMIENTAS1_idx` (`herramienta_id` ASC) VISIBLE,
  CONSTRAINT `fk_HERRAMIENTAS_has_CULTIVOS_HERRAMIENTAS1`
    FOREIGN KEY (`herramienta_id`)
    REFERENCES `la_verde`.`HERRAMIENTAS` (`herramienta_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_HERRAMIENTAS_has_CULTIVOS_CULTIVOS1`
    FOREIGN KEY (`cultivo_id`)
    REFERENCES `la_verde`.`CULTIVOS` (`cultivo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_verde`.`EMPLEADO_CULTI`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`EMPLEADO_CULTI` (
  `cc_empleado` INT UNSIGNED NOT NULL,
  `cultivo_id` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  PRIMARY KEY (`cc_empleado`, `cultivo_id`),
  INDEX `fk_EMPLEADO_has_CULTIVOS_CULTIVOS1_idx` (`cultivo_id` ASC) VISIBLE,
  INDEX `fk_EMPLEADO_has_CULTIVOS_EMPLEADO1_idx` (`cc_empleado` ASC) VISIBLE,
  CONSTRAINT `fk_EMPLEADO_has_CULTIVOS_EMPLEADO1`
    FOREIGN KEY (`cc_empleado`)
    REFERENCES `la_verde`.`EMPLEADO` (`cc_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLEADO_has_CULTIVOS_CULTIVOS1`
    FOREIGN KEY (`cultivo_id`)
    REFERENCES `la_verde`.`CULTIVOS` (`cultivo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `la_verde`.`PROVEEDOR_COMPRA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`PROVEEDOR_COMPRA` (
  `proveedor_nit` INT NOT NULL,
  `compra_id` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  `cantidad` INT NOT NULL,
  `precio_uni` INT NOT NULL,
  `subtotal` INT NOT NULL,
  PRIMARY KEY (`proveedor_nit`, `compra_id`),
  INDEX `fk_PROVEEDOR_has_COMPRA_COMPRA1_idx` (`compra_id` ASC) VISIBLE,
  INDEX `fk_PROVEEDOR_has_COMPRA_PROVEEDOR1_idx` (`proveedor_nit` ASC) VISIBLE,
  CONSTRAINT `fk_PROVEEDOR_has_COMPRA_PROVEEDOR1`
    FOREIGN KEY (`proveedor_nit`)
    REFERENCES `la_verde`.`PROVEEDOR` (`nit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PROVEEDOR_has_COMPRA_COMPRA1`
    FOREIGN KEY (`compra_id`)
    REFERENCES `la_verde`.`COMPRA` (`compra_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `la_verde`.`PROVEEDOR_COMPRA_INSUMOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_verde`.`PROVEEDOR_COMPRA_INSUMOS` (
  `proveedor_nit` INT NOT NULL,
  `compra_id` INT NOT NULL,
  `insumos_id` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  `observaciones` VARCHAR(45) NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`proveedor_nit`, `compra_id`, `insumos_id`),
  INDEX `fk_PROVEEDOR_COMPRA_has_INSUMOS_INSUMOS1_idx` (`insumos_id` ASC) VISIBLE,
  INDEX `fk_PROVEEDOR_COMPRA_has_INSUMOS_PROVEEDOR_COMPRA1_idx` (`proveedor_nit` ASC, `compra_id` ASC) VISIBLE,
  CONSTRAINT `fk_PROVEEDOR_COMPRA_has_INSUMOS_PROVEEDOR_COMPRA1`
    FOREIGN KEY (`proveedor_nit` , `compra_id`)
    REFERENCES `la_verde`.`PROVEEDOR_COMPRA` (`proveedor_nit` , `compra_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PROVEEDOR_COMPRA_has_INSUMOS_INSUMOS1`
    FOREIGN KEY (`insumos_id`)
    REFERENCES `la_verde`.`INSUMOS` (`idINSUMOS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
