-- DROP DATABASE IF EXISTS `doshou_db`;

CREATE DATABASE IF NOT EXISTS `doshou_db`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `doshou_db`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

SET FOREIGN_KEY_CHECKS=0;

-- -----------------------------
-- Table structure for category
-- -----------------------------
DROP TABLE IF EXISTS `category`;
create table `category`(
  `id`          bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`        varchar(100) NOT NULL DEFAULT '',
  `is_show`     tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `sort_order`  smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_category_name` (`name`),
  INDEX `idx_category_show_order` (`is_show`,`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -----------------------------
-- Table structure for product
-- -----------------------------
DROP TABLE IF EXISTS `product`;
create table `product`(
  `id`            bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `cat_id`        bigint NOT NULL DEFAULT 0,
  `brief`         varchar(255) NOT NULL DEFAULT '',
  `url`           varchar(2000) NOT NULL DEFAULT '',
  `img_url`       varchar(255) NOT NULL DEFAULT '',
  `market_price`  int(10) NOT NULL DEFAULT 0,
  `shop_price`    int(10) NOT NULL DEFAULT 0,
  `sales`         int(10) NOT NULL DEFAULT 0,
  `comments`      int(10) NOT NULL DEFAULT 0,
  `is_best`       tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `is_hot`        tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `is_show`       tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `sort_order`    smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `add_date`      date NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `idx_product_cat_id` (`cat_id`),
  INDEX `idx_product_best_hot` (`is_best`,`is_hot`),
  INDEX `idx_product_sort_order` (`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------
-- Table structure for store
-- -------------------------
DROP TABLE IF EXISTS `store`;
create table `store`(
  `id`            bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `cat_id`        bigint NOT NULL DEFAULT 0,
  `name`          varchar(255) NOT NULL DEFAULT '',
  `url`           varchar(2000) NOT NULL DEFAULT '',
  `img_url`       varchar(255) NOT NULL DEFAULT '',
  `is_show`       tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `sort_order`    smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `add_date`      date NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `idx_product_cat_id` (`cat_id`),
  INDEX `idx_product_sort_order` (`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ---------------------------
-- Table structure for config
-- ---------------------------
DROP TABLE IF EXISTS `config`;
create table `config`(
  `id`           bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`         varchar(255) NOT NULL DEFAULT '',
  `value`        varchar(2000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_config_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;