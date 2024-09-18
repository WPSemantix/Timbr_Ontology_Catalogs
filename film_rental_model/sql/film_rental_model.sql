CREATE OR REPLACE PROPERTY `special_features` string;
CREATE OR REPLACE PROPERTY `rental_duration` integer;
CREATE OR REPLACE PROPERTY `pictureurl` string;
CREATE OR REPLACE PROPERTY `languageid` integer;
CREATE OR REPLACE PROPERTY `rating` string;
CREATE OR REPLACE PROPERTY `replacement_cost` decimal;
CREATE OR REPLACE PROPERTY `description` string;
CREATE OR REPLACE PROPERTY `storeid` integer;
CREATE OR REPLACE PROPERTY `title` string;
CREATE OR REPLACE PROPERTY `password` string;
CREATE OR REPLACE PROPERTY `actorid` integer;
CREATE OR REPLACE PROPERTY `filmid` integer;
CREATE OR REPLACE PROPERTY `last_update` timestamp;
CREATE OR REPLACE PROPERTY `fulltext` string;
CREATE OR REPLACE PROPERTY `inventoryid` integer;
CREATE OR REPLACE PROPERTY `id` integer;
CREATE OR REPLACE PROPERTY `rental_date` timestamp;
CREATE OR REPLACE PROPERTY `create_date` timestamp;
CREATE OR REPLACE PROPERTY `first_name` string;
CREATE OR REPLACE PROPERTY `categoryid` integer;
CREATE OR REPLACE PROPERTY `email` string;
CREATE OR REPLACE PROPERTY `payment_date` timestamp;
CREATE OR REPLACE PROPERTY `staffid` integer;
CREATE OR REPLACE PROPERTY `rentalid` integer;
CREATE OR REPLACE PROPERTY `amount` decimal;
CREATE OR REPLACE PROPERTY `rental_rate` decimal;
CREATE OR REPLACE PROPERTY `address2` string;
CREATE OR REPLACE PROPERTY `address1` string;
CREATE OR REPLACE PROPERTY `length` integer;
CREATE OR REPLACE PROPERTY `release_year` integer;
CREATE OR REPLACE PROPERTY `active` string;
CREATE OR REPLACE PROPERTY `last_name` string;
CREATE OR REPLACE PROPERTY `cityid` integer;
CREATE OR REPLACE PROPERTY `countryid` integer;
CREATE OR REPLACE PROPERTY `addressid` integer;
CREATE OR REPLACE PROPERTY `phone` string;
CREATE OR REPLACE PROPERTY `district` string;
CREATE OR REPLACE PROPERTY `customerid` integer;
CREATE OR REPLACE PROPERTY `name` string;
CREATE OR REPLACE PROPERTY `postal_code` string;
CREATE OR REPLACE PROPERTY `return_date` timestamp;
CREATE OR REPLACE PROPERTY `username` string;
CREATE OR REPLACE CONCEPT `store` (`last_update` timestamp, `id` integer, `addressid` integer, PRIMARY KEY (`id`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-store-alt');
CREATE OR REPLACE CONCEPT `staff` (`username` string, `last_update` timestamp, `password` string, `id` integer, `storeid` integer, `active` string, `last_name` string, `pictureurl` string, `email` string, `addressid` integer, `first_name` string, PRIMARY KEY (`id`), LABEL (`first_name`, `last_name`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-briefcase');
CREATE OR REPLACE CONCEPT `rental` (`rental_date` timestamp, `last_update` timestamp, `id` integer, `inventoryid` integer, `customerid` integer, `staffid` integer, `return_date` timestamp, PRIMARY KEY (`id`), CONSTRAINT `handled_by_staff` FOREIGN KEY (`staffid`) REFERENCES `staff` (`id`) INVERSEOF `handled` , CONSTRAINT `belongs_to_customer` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`) INVERSEOF `rented_by` , CONSTRAINT `belongs_to_inventory` FOREIGN KEY (`inventoryid`) REFERENCES `inventory` (`id`) INVERSEOF `rented_by` ) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-file-contract');
CREATE OR REPLACE CONCEPT `payment` (`id` integer, `amount` decimal, `payment_date` timestamp, `rentalid` integer, `customerid` integer, `staffid` integer, PRIMARY KEY (`id`), CONSTRAINT `belongs_to_rental` FOREIGN KEY (`rentalid`) REFERENCES `rental` (`id`) INVERSEOF `paid_for` , CONSTRAINT `handled_by_staff` FOREIGN KEY (`staffid`) REFERENCES `staff` (`id`) INVERSEOF `handled_payment` , CONSTRAINT `belongs_to_customer` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`) INVERSEOF `paid_by` ) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-credit-card');
CREATE OR REPLACE CONCEPT `language` (`last_update` timestamp, `id` integer, `name` string, PRIMARY KEY (`id`), LABEL (`name`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-language');
CREATE OR REPLACE CONCEPT `inventory` (`last_update` timestamp, `id` integer, `filmid` integer, PRIMARY KEY (`id`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-box-open');
CREATE OR REPLACE CONCEPT `film_category` (`last_update` timestamp, `categoryid` integer, `filmid` integer, PRIMARY KEY (`filmid`, `categoryid`), CONSTRAINT `belongs_to_category` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`) INVERSEOF `has_film` , CONSTRAINT `belongs_to_film` FOREIGN KEY (`filmid`) REFERENCES `film` (`id`) INVERSEOF `has_category` ) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-ranking-star');
CREATE OR REPLACE CONCEPT `film_actor` (`actorid` integer, `last_update` timestamp, `filmid` integer, PRIMARY KEY (`filmid`, `actorid`), CONSTRAINT `features_film` FOREIGN KEY (`filmid`) REFERENCES `film` (`id`) INVERSEOF `featured_in` , CONSTRAINT `features_actor` FOREIGN KEY (`actorid`) REFERENCES `actor` (`id`) INVERSEOF `featured_in` ) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-people-robbery');
CREATE OR REPLACE CONCEPT `film` (`last_update` timestamp, `special_features` string, `id` integer, `rental_rate` decimal, `fulltext` string, `languageid` integer, `rating` string, `replacement_cost` decimal, `description` string, `rental_duration` integer, `title` string, `release_year` integer, `length` integer, PRIMARY KEY (`id`), LABEL (`title`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-film');
CREATE OR REPLACE CONCEPT `customer` (`create_date` timestamp, `last_update` timestamp, `id` integer, `active` string, `last_name` string, `email` string, `addressid` integer, `first_name` string, PRIMARY KEY (`id`), LABEL (`first_name`, `last_name`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-user-friends');
CREATE OR REPLACE CONCEPT `country` (`last_update` timestamp, `id` integer, `name` string, PRIMARY KEY (`id`), LABEL (`name`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-flag');
CREATE OR REPLACE CONCEPT `city` (`last_update` timestamp, `id` integer, `countryid` integer, `name` string, PRIMARY KEY (`id`), LABEL (`name`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-city');
CREATE OR REPLACE CONCEPT `category` (`last_update` timestamp, `id` integer, `name` string, PRIMARY KEY (`id`), LABEL (`name`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-tags');
CREATE OR REPLACE CONCEPT `address` (`phone` string, `last_update` timestamp, `district` string, `id` integer, `postal_code` string, `cityid` integer, `address2` string, `address1` string, PRIMARY KEY (`id`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-map-location');
CREATE OR REPLACE CONCEPT `actor` (`last_update` timestamp, `id` integer, `last_name` string, `first_name` string, PRIMARY KEY (`id`), LABEL (`first_name`, `last_name`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-user-astronaut');