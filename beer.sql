-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`distribution`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`distribution` (
  `distribution_id` INT(11) NOT NULL AUTO_INCREMENT,
  `distribution_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`distribution_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`brewery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`brewery` (
  `brewery_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `year_started` DATE NOT NULL,
  `parent_company` VARCHAR(45) NULL DEFAULT NULL,
  `distribution_id` INT(11) NOT NULL,
  PRIMARY KEY (`brewery_id`),
  INDEX `distirbution_id_idx` (`distribution_id` ASC),
  CONSTRAINT `distirbution_id`
    FOREIGN KEY (`distribution_id`)
    REFERENCES `mydb`.`distribution` (`distribution_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



-- -----------------------------------------------------
-- Table `mydb`.`beer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`beer` (
  `beer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `brewery_id` INT(11) NOT NULL,
  `style` VARCHAR(45) NOT NULL,
  `abv` DOUBLE(10,1) NOT NULL,
  PRIMARY KEY (`beer_id`),
  INDEX `brewery_id_idx` (`brewery_id` ASC),
  CONSTRAINT `brewery_id`
    FOREIGN KEY (`brewery_id`)
    REFERENCES `mydb`.`brewery` (`brewery_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;







-- -----------------------------------------------------
-- Table `mydb`.`store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`store` (
  `store_id` INT(11) NOT NULL AUTO_INCREMENT,
  `store_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`store_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `mydb`.`storedetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`storeDetails` (
  `sd_id` INT(11) NOT NULL AUTO_INCREMENT,
  `store_id` INT(11) NOT NULL,
  `store_type` VARCHAR(45) NOT NULL,
  `store_location` VARCHAR(45) NOT NULL,
  `opens` TIME,
  `closes`TIME,
  PRIMARY KEY (`sd_id`),
  CONSTRAINT `store_id`
    FOREIGN KEY (`store_id`)
    REFERENCES `mydb`.`store` (`store_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)  
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orders` (
  `order_id` INT(11) NOT NULL AUTO_INCREMENT,
  `store_id` INT(11) NOT NULL,
  `distribution_id` INT(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `store_id_idx` (`store_id` ASC),
  INDEX `distribution_id_idx` (`distribution_id` ASC),
   CONSTRAINT `store`
    FOREIGN KEY (`store_id`)
    REFERENCES `mydb`.`store` (`store_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `distribution`
    FOREIGN KEY (`distribution_id`)
    REFERENCES `mydb`.`distribution` (`distribution_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`orderDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orderDetails` (
	`od_id` INT(11) NOT NULL AUTO_INCREMENT,
   `order_id` int(11) NOT NULL,
   `beer_id` int(11) NOT NULL,
   `price` int(11) NOT NULL,
   `delivery_status` varchar(15) not null,
  `delivery_date` DATE NOT NULL,
  `order_date` DATE NOT NULL,
  PRIMARY KEY (`od_id`),
  CONSTRAINT `order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `mydb`.`order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `beer`
    FOREIGN KEY (`beer_id`)
    REFERENCES `mydb`.`beer` (`beer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT distribution(distribution_name)
VALUES ('Anheuser-Busch InBev');

INSERT distribution(distribution_name)
VALUEs ('Bells Brewery Inc');

INSERT distribution(distribution_name)
VALUES ('Boston Beer Company');

INSERT distribution(distribution_name)
VALUES ('Dogfish Head Craft Brewery');

INSERT distribution(distribution_name)
VALUES ('East End Brewery');

INSERT distribution(distribution_name)
VALUES ('Erie Brewing Company');

INSERT distribution(distribution_name)
VALUES ('Flying Dog Brewery');

INSERT distribution(distribution_name)
VALUES ('Founders Brewing Company');

INSERT distribution(distribution_name)
VALUES ('Full Pint Brewing');

INSERT distribution(distribution_name)
VALUES ('Great Divide Brewing Company');

INSERT distribution(distribution_name)
VALUES ('Lagunitas Brewing Company');

INSERT distribution(distribution_name)
VALUES ('Left Hand Brewing Company');

INSERT distribution(distribution_name)
VALUES ('Molson MillerCoors');

INSERT distribution(distribution_name)
VALUES ('New Belgium Brewing');

INSERT distribution(distribution_name)
VALUES ('New Holland Brewery');

INSERT distribution(distribution_name)
VALUES ('Pittsburgh Brewing Company');

INSERT distribution(distribution_name)
VALUES ('Pennsylvania Brewing Company');

INSERT distribution(distribution_name)
VALUES ('Rogue Ales Brewery');

INSERT distribution(distribution_name)
VALUES ('Sierra Nevada Brewing Company');

INSERT distribution(distribution_name)
VALUES ('Straub Brewery');

INSERT distribution(distribution_name)
VALUES ('Stone Brewing Company');

INSERT distribution(distribution_name)
VALUES ('Tröegs');

INSERT distribution(distribution_name)
VALUES ('Victory');

INSERT distribution(distribution_name)
VALUES ('Voodoo Brewing Compnay');

INSERT distribution(distribution_name)
VALUES ('Yards Brewing Company');

INSERT distribution(distribution_name)
VALUES ('Yuengling');

INSERT brewery(name, State, year_started, parent_company, distribution_id)
VALUES ('Goose Island', 'IL', '1988-1-1', 'Anheiser-Busch Inbev', 001);

INSERT brewery(name, State, year_started, parent_company, distribution_id)
VALUES ('Elysian Brewing Company', 'WA', '1995-1-1', 'Anheiser-Busch Inbev', 001);

INSERT brewery(name, State, year_started, parent_company, distribution_id)
VALUES ('Devils Backbone Brewing Company', 'VA', '2008-1-1', 'Anheiser-Busch Inbev', 001);

INSERT brewery(name, State, year_started, parent_company, distribution_id)
VALUES ('Red Hook Brewing Company', 'WA', '1981-1-1', 'Craft Brew Alliance', 001);

INSERT brewery(name, State, year_started, parent_company, distribution_id)
VALUES ('Widmer Brothers Brewery', 'OR', '1984-1-1', 'Craft Brew Alliance', 001);

INSERT brewery(name, State, year_started, parent_company, distribution_id)
VALUES ('Kona Brewing Company', 'HI', '1994-1-1', 'Craft Brew Alliance', 001);

INSERT brewery(name, State, year_started, parent_company, distribution_id)
VALUES ('Samuel Adams', 'MA', '1984-1-1', 'Boston Beer Company', 003);

INSERT brewery(name, State, year_started,  distribution_id)
VALUES ('Bells Brewery', 'MI', '1983-1-1', 002);

INSERT brewery(name, State, year_started, distribution_id)
VALUES ('Dogfish Head Craft Brewery', 'MI', '1983-6-1', 004);

INSERT brewery(name, State, year_started, distribution_id)
VALUES ('East End Brewery', 'PA', '2004-1-1', 005);

INSERT brewery(name, State, year_started, distribution_id)
VALUES ('Erie Brewing Company', 'PA', '1994-1-1',  006);

INSERT brewery(name, State, year_started, distribution_id)
VALUES ('Flying Dog Brewery', 'MD', '1990-1-1',  007);

INSERT brewery(name, State, year_started, distribution_id)
VALUES ('Founders Brewing Company', 'MI', '1997-1-1', 008);

INSERT brewery(name, State, year_started, distribution_id)
VALUES ('Full Pint Brewing Company', 'PA', '1997-1-1',  009);

INSERT brewery(name, State, year_started, distribution_id)
VALUES ('Great Divide Brewing Company', 'CO', '1994-1-1',  010);

INSERT brewery(name, State, year_started, distribution_id)
VALUES ('Lagunitas Brewing Company', 'CA', '1993-1-1',  011);

INSERT brewery(name, State, year_started, distribution_id)
VALUES ('Left Hand Brewing Company', 'CO', '1993-1-1', 012);

INSERT brewery(name, State, year_started, distribution_id)
VALUES ('New Belgium Brewing Company', 'CO', '1991-1-1',  014);

INSERT brewery(name, State, year_started,  distribution_id)
VALUES ('New Holland Brewing Company', 'MI', '1996-1-1', 015);

INSERT brewery(name, State, year_started,  distribution_id)
VALUES ('Pittsburgh Brewing Company', 'PA', '1861-1-1',  016);

INSERT brewery(name, State, year_started,  distribution_id)
VALUES ('Pennsylvania Brewing Company', 'PA', '1986-1-1',  017);

INSERT brewery(name, State, year_started,  distribution_id)
VALUES ('Rogue Ales', 'OR', '1988-1-1',  018);

INSERT brewery(name, State, year_started,  distribution_id)
VALUES ('Sierra Nevada Brewing Company', 'CA', '1980-1-1',  019);

INSERT brewery(name, State, year_started,  distribution_id)
VALUES ('Straub Brewery', 'PA', '1872-1-1',  020);

INSERT brewery(name, State, year_started,  distribution_id)
VALUES ('Stone Brewing Co.', 'CA', '1996-1-1',  021);

INSERT brewery(name, State, year_started,  distribution_id)
VALUES ('Tröegs', 'PA', '1996-1-1',  022);

INSERT brewery(name, State, year_started,  distribution_id)
VALUES ('VooDoo Brewing Company', 'PA', '1996-1-1',  024);

INSERT brewery(name, State, year_started,  distribution_id)
VALUES ('Yards Brewing Company', 'PA', '1994-1-1',  025);

INSERT brewery(name, State, year_started,  distribution_id)
VALUES ('Yuengling', 'PA', '1829-1-1',  026);

INSERT brewery(name, State, year_started, distribution_id)
VALUES ('Victory', 'PA', '1996-2-15',  023);

INSERT beer(name, brewery_id, style, abv)
VALUES('312 URBAN WHEAT ALE', 001, 'Wheat', 4.2);

INSERT beer(name, brewery_id, style, abv)
VALUES('FOUR STAR PILS', 001, 'Pilsner', 5.1);

INSERT beer(name, brewery_id, style, abv)
VALUES('GOOSE IPA', 001, 'IPA', 5.9 );

INSERT beer(name, brewery_id, style, abv)
VALUES('GREEN LINE PALE ALE', 001, 'APA', 5.4 );

INSERT beer(name, brewery_id, style, abv)
VALUES('Space Dust', 002, 'IPA', 8.2);

INSERT beer(name, brewery_id, style, abv)
VALUES('Immortal', 002, 'IPA', 6.3);

INSERT beer(name, brewery_id, style, abv)
VALUES('Dayglow', 002, 'IPA', 7.4 );

INSERT beer(name, brewery_id, style, abv)
VALUES('Dragonstooth', 002, 'Stout', 8.1 );

INSERT beer(name, brewery_id, style, abv)
VALUES('Vienna Lager', 003, 'Lager', 5.2);

INSERT beer(name, brewery_id, style, abv)
VALUES('Gold Leaf Lager', 003, 'Lager', 4.5);

INSERT beer(name, brewery_id, style, abv)
VALUES('Danzig', 003, 'Porter', 8.0 );

INSERT beer(name, brewery_id, style, abv)
VALUES('Trail Angel Weiss', 003, 'Weissbier', 4.9 );

INSERT beer(name, brewery_id, style, abv)
VALUES('Extra Special Bitter ', 004, 'Bitter', 5.8);

INSERT beer(name, brewery_id, style, abv)
VALUES('Long Hammer', 004, 'IPA', 6.2);

INSERT beer(name, brewery_id, style, abv)
VALUES('Big Ballard Imperial', 004, 'IPA', 8.6 );

INSERT beer(name, brewery_id, style, abv)
VALUES('Bicoastal', 004, 'IPA', 7.1 );

INSERT beer(name, brewery_id, style, abv)
VALUES('Hefe', 005, 'Hefeweizen', 4.9 );

INSERT beer(name, brewery_id, style, abv)
VALUES('Drop Top ', 005, 'Amber', 5.3);

INSERT beer(name, brewery_id, style, abv)
VALUES('Upheaval', 005, 'IPA', 7.0);

INSERT beer(name, brewery_id, style, abv)
VALUES('Drifter Pale ', 005, 'Pale Ale', 5.6);

INSERT beer(name, brewery_id, style, abv)
VALUES('Longboard Island Lager ', 006, 'Lager', 4.6 );

INSERT beer(name, brewery_id, style, abv)
VALUES('Big Wave', 006, 'Ale', 4.4);

INSERT beer(name, brewery_id, style, abv)
VALUES('Hanalei Island ', 006, 'IPA', 4.5);

INSERT beer(name, brewery_id, style, abv)
VALUES('Wailua Wheat', 006, 'Wheat', 5.4 );

INSERT beer(name, brewery_id, style, abv)
VALUES('Boston Lager', 007, 'Lager', 4.6 );

INSERT beer(name, brewery_id, style, abv)
VALUES('Two Hearted', 008, 'Ale', 7.0);

INSERT beer(name, brewery_id, style, abv)
VALUES('90 Minute IPA', 009, 'IPA', 9.0 );

INSERT beer(name, brewery_id, style, abv)
VALUES('LittleHop Session IPA', 010, 'IPA', 4.4 );

INSERT beer(name, brewery_id, style, abv)
VALUES('Monkey Boy', 010, 'Hefeweizen', 6.2);


INSERT beer(name, brewery_id, style, abv)
VALUES('Railbender', 011, 'Scottish Style Ale:', 6.8 );

INSERT beer(name, brewery_id, style, abv)
VALUES('MISERY BAY', 011, 'IPA', 6.5);


INSERT beer(name, brewery_id, style, abv)
VALUES('Raging Bitch', 012, 'IPA', 8.3 );

INSERT beer(name, brewery_id, style, abv)
VALUES('Snake Dog', 012, 'Ale', 7.1);

INSERT beer(name, brewery_id, style, abv)
VALUES('BREAKFAST STOUT', 013, 'Lager', 8.3 );

INSERT beer(name, brewery_id, style, abv)
VALUES('White Lightning', 014, 'Pilsner', 6.0);

INSERT beer(name, brewery_id, style, abv)
VALUES('Yeti', 015, 'Stout', 9.8);

INSERT beer(name, brewery_id, style, abv)
VALUES('A LITTLE SUMPIN SUMPIN', 016, 'Ale', 7.5 );

INSERT beer(name, brewery_id, style, abv)
VALUES('Milk Stout', 017, 'Stout', 6.0 );

INSERT beer(name, brewery_id, style, abv)
VALUES('Fat Tire Amber Ale ', 018, 'Ale', 5.2);

INSERT beer(name, brewery_id, style, abv)
VALUES('Dragons Milk ', 019, 'Stout', 11.0);

INSERT beer(name, brewery_id, style, abv)
VALUES('Iron City Beer ', 020, 'Ale', 4.5 );

INSERT beer(name, brewery_id, style, abv)
VALUES('Penn Dark', 021, 'Lager', 5.0 );

INSERT beer(name, brewery_id, style, abv)
VALUES('Dead Guy Ale', 022, 'Bock', 6.8);

INSERT beer(name, brewery_id, style, abv)
VALUES('Sierra Nevada Pale Ale', 023, 'APA', 5.6);

INSERT beer(name, brewery_id, style, abv)
VALUES('American Lager', 024, 'Lager', 4.3 );

INSERT beer(name, brewery_id, style, abv)
VALUES('Arrogant Bastard', 025, 'IPA', 7.2 );

INSERT beer(name, brewery_id, style, abv)
VALUES('Troegenator', 026, 'Doppelbock', 8.2);

INSERT beer(name, brewery_id, style, abv)
VALUES('VOODOO LOVE CHILD', 027, 'Tripel', 9.3);

INSERT beer(name, brewery_id, style, abv)
VALUES('THOMAS JEFFERSONS TAVERN ALE', 028, 'Ale', 8.0 );

INSERT beer(name, brewery_id, style, abv)
VALUES('Traditional Lager', 029, 'Lager', 4.5 );

INSERT beer(name, brewery_id, style, abv)
VALUES('Golden Monkey', 030, 'Tripel', 9.5);

INSERT beer(name, brewery_id, style, abv)
VALUES('Sour Monkey', 030, 'Sour', 9.5);

INSERT beer(name, brewery_id, style, abv)
VALUES('4 Front', 030, 'IPA', 5.5 );

INSERT beer(name, brewery_id, style, abv)
VALUES('Hop Devil', 030, 'IPA', 6.7 );

INSERT store(store_name)
VALUES ('Giant Eagle');

INSERT store(store_name)
VALUES ('GetGo');

INSERT store(store_name)
VALUES ('Giant');

INSERT store(store_name)
VALUES ('Weis Mart');

INSERT store(store_name)
VALUES ('Buddys Brew on Carson');

INSERT store(store_name)
VALUES ('Black and Gold Beer Warehouse');

INSERT store(store_name)
VALUES ('Warrington Beer Distributor');

INSERT store(store_name)
VALUES ('Mellinger Beer Distribution');

INSERT store(store_name)
VALUES ('Petes Beer');

INSERT store(store_name)
VALUES ('West Liberty Beer');

INSERT store(store_name)
VALUES ('Whole Foods Market');

INSERT store(store_name)
VALUES ('Trader Joes');

Insert storedetails(store_id, store_type, store_location, opens, closes )
VALUES (1, 'Grocery', 'Pittsburgh',073000,220000);

Insert storedetails(store_id, store_type, store_location, opens, closes )
VALUES (2, 'Gas station', 'Pittsburgh',060000,230000);

Insert storedetails(store_id, store_type, store_location, opens, closes )
VALUES (3, 'Grocery', 'Mechanicsburg',073000,220000);

Insert storedetails(store_id, store_type, store_location, opens, closes )
VALUES (4, 'Grocery', 'Mechanicsburg',000000,235959);

Insert storedetails(store_id, store_type, store_location, opens, closes )
VALUES (5, 'Beer Distributor', 'Pittsburgh',100000,220000);

Insert storedetails(store_id, store_type, store_location, opens, closes )
VALUES (6, 'Beer Distributor', 'Pittsburgh',100000,220000);

Insert storedetails(store_id, store_type, store_location, opens, closes )
VALUES (7, 'Beer Distributor', 'Pittsburgh',100000,220000);

Insert storedetails(store_id, store_type, store_location, opens, closes )
VALUES (8, 'Beer Distributor', 'Pittsburgh',100000,220000);

Insert storedetails(store_id, store_type, store_location, opens, closes )
VALUES (9, 'Beer Distributor', 'Pittsburgh',100000,220000);

Insert storedetails(store_id, store_type, store_location, opens, closes )
VALUES (10, 'Beer Distributor', 'Pittsburgh',100000,220000);

Insert storedetails(store_id, store_type, store_location, opens, closes )
VALUES (11, 'Grocery', 'Pittsburgh',080000,220000);

Insert storedetails(store_id, store_type, store_location, opens, closes )
VALUES (12, 'Grocery', 'Pittsburgh',080000,220000);



INSERT into orders(store_id, distribution_id)
VALUES (001, 003);

INSERT into orders(store_id, distribution_id)
VALUES (001, 001);

INSERT into orders(store_id, distribution_id)
VALUES (001, 030);

INSERT into orders(store_id, distribution_id)
VALUES (002, 003);

INSERT into orders(store_id, distribution_id)
VALUES (010, 003);

INSERT into orders(store_id, distribution_id)
VALUES (010, 001);

INSERT into orders(store_id, distribution_id)
VALUES (002, 003);

INSERT into orders(store_id, distribution_id)
VALUES (002, 020);

INSERT into orders(store_id, distribution_id)
VALUES (002, 030);

INSERT into orders(store_id, distribution_id)
VALUES (003, 015);


Insert orderdetails(Order_id, beer_id,price, delivery_status, order_date, delivery_date )
VALUES (001, 026, 1500.00, 'delivered', '2018-4-19', '2018-4-22'  );
Insert orderdetails(Order_id, beer_id,price, delivery_status, order_date, delivery_date )
VALUES (002, 021, 145.00, 'delivered', '2018-3-19', '2018-4-2'  );
Insert orderdetails(Order_id, beer_id,price, delivery_status, order_date, delivery_date )
VALUES (003, 053, 1645.00, 'delivered', '2018-4-19', '2018-4-22'  );
Insert orderdetails(Order_id, beer_id,price, delivery_status, order_date, delivery_date )
VALUES (004, 026, 1565.00, 'delivered', '2018-4-19', '2018-4-22'  );
Insert orderdetails(Order_id, beer_id,price, delivery_status, order_date, delivery_date )
VALUES (005, 026, 45.00, 'delivered', '2018-4-19', '2018-4-22'  );
Insert orderdetails(Order_id, beer_id,price, delivery_status, order_date, delivery_date )
VALUES (006, 034, 1545.00, 'delivered', '2018-4-19', '2018-4-22'  );
Insert orderdetails(Order_id, beer_id,price, delivery_status, order_date, delivery_date )
VALUES (007, 026, 1545.00, 'delivered', '2018-4-19', '2018-4-22'  );
Insert orderdetails(Order_id, beer_id,price, delivery_status, order_date, delivery_date )
VALUES (008, 041, 1545.00, 'delivered', '2018-4-19', '2018-4-22'  );
Insert orderdetails(Order_id, beer_id,price, delivery_status, order_date, delivery_date )
VALUES (009, 051, 1545.00, 'delivered', '2018-4-19', '2018-4-22'  );
Insert orderdetails(Order_id, beer_id,price, delivery_status, order_date, delivery_date )
VALUES (010, 036, 1545.00, 'delivered', '2018-4-19', '2018-4-22'  );



SELECT  b.name, b.style, b.abv, r.name as Brewer
FROM beer b
JOIN  brewery r ON r.brewery_id = b.brewery_id
WHERE distribution_id = 001;

SELECT b.name, YEAR(b.year_started)
FROM brewery b
WHERE distribution_id <> 001
group by YEAR(b.year_started) ASC;

SELECT b.name, b.state
FROM brewery b
WHERE state = 'PA'
group by b.name ASC;

SELECT s.store_name
FROM store s
JOIN storedetails sd ON s.store_id =sd.store_id
WHERE sd.closes > 220000 
group by s.store_name ASC;

SELECT b.name, YEAR(b.year_started) as Year
FROM brewery b
WHERE YEAR(b.year_started) >=1988
group by YEAR(b.year_started) desc;

SELECT  AVG(b.abv) as 'Average ABV'
FROM beer b;

SELECT  b.name, b.style, b.abv, r.name as Brewer
FROM beer b
JOIN  brewery r ON r.brewery_id = b.brewery_id
WHERE distribution_id <>001 && b.style ='IPA'
GROUP BY b.abv DESC;

SELECT  b.name, b.style, b.abv, r.name as Brewer
FROM beer b
JOIN  brewery r ON r.brewery_id = b.brewery_id
WHERE b.style ='Tripel';

SELECT  b.name, b.style, b.abv, r.name as Brewer
FROM beer b
JOIN  brewery r ON r.brewery_id = b.brewery_id
WHERE distribution_id = 001 && r.parent_company <> 'Anheiser-Busch Inbev';

SELECT  b.style, avg(b.abv) 
FROM beer b
GROUP BY b.style;


