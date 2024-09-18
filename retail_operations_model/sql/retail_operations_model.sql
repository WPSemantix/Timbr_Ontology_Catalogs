CREATE OR REPLACE PROPERTY `color` string;
CREATE OR REPLACE PROPERTY `legalname` string;
CREATE OR REPLACE PROPERTY `hasunitofmeasurement` string;
CREATE OR REPLACE PROPERTY `description` string;
CREATE OR REPLACE PROPERTY `durationofwarrantyinmonths` integer;
CREATE OR REPLACE PROPERTY `hasmanufacturer` string;
CREATE OR REPLACE PROPERTY `hasminvalue` float;
CREATE OR REPLACE PROPERTY `hasmpn` string;
CREATE OR REPLACE PROPERTY `billingincrement` float;
CREATE OR REPLACE PROPERTY `taxid` string;
CREATE OR REPLACE PROPERTY `appliestopaymentmethod` string;
CREATE OR REPLACE PROPERTY `amountofthisgood` float;
CREATE OR REPLACE PROPERTY `appliestodeliverymethod` string;
CREATE OR REPLACE PROPERTY `hasgtin8` string;
CREATE OR REPLACE PROPERTY `pricetype` string;
CREATE OR REPLACE PROPERTY `validthrough` timestamp;
CREATE OR REPLACE PROPERTY `serialnumber` string;
CREATE OR REPLACE PROPERTY `vatid` string;
CREATE OR REPLACE PROPERTY `hasstockkeepingunit` string;
CREATE OR REPLACE PROPERTY `includes` string;
CREATE OR REPLACE PROPERTY `hascurrency` string;
CREATE OR REPLACE PROPERTY `hasgtin14` string;
CREATE OR REPLACE PROPERTY `closes` time;
CREATE OR REPLACE PROPERTY `hasmaxvalue` float;
CREATE OR REPLACE PROPERTY `isicv4` integer;
CREATE OR REPLACE PROPERTY `condition` string;
CREATE OR REPLACE PROPERTY `hasvalue` float;
CREATE OR REPLACE PROPERTY `globallocationnumber` string;
CREATE OR REPLACE PROPERTY `name` string;
CREATE OR REPLACE PROPERTY `dayofweek` string;
CREATE OR REPLACE PROPERTY `duns` string;
CREATE OR REPLACE PROPERTY `hascurrencyvalue` float;
CREATE OR REPLACE PROPERTY `opens` time;
CREATE OR REPLACE PROPERTY `validfrom` timestamp;
CREATE OR REPLACE PROPERTY `hasean_ucc13` string;
CREATE OR REPLACE PROPERTY `availabilityends` timestamp;
CREATE OR REPLACE PROPERTY `availabilitystarts` timestamp;
CREATE OR REPLACE PROPERTY `naics` integer;
CREATE OR REPLACE PROPERTY `eligibleregions` string;
CREATE OR REPLACE CONCEPT `warrantyscope` (`name` string, PRIMARY KEY (`name`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-info-circle');
CREATE OR REPLACE CONCEPT `warrantypromise` (`durationofwarrantyinmonths` integer, PRIMARY KEY (`durationofwarrantyinmonths`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-shield-halved');
CREATE OR REPLACE CONCEPT `typeandquantitynode` (`amountofthisgood` float, `hasunitofmeasurement` string, PRIMARY KEY (`amountofthisgood`, `hasunitofmeasurement`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-list-alt');
CREATE OR REPLACE CONCEPT `quantitativevalue` (`hasminvalue` float, `hasunitofmeasurement` string, `hasmaxvalue` float, `hasvalue` float, PRIMARY KEY (`hasminvalue`, `hasmaxvalue`, `hasvalue`, `hasunitofmeasurement`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-calculator');
CREATE OR REPLACE CONCEPT `productorservice` (`description` string, `hasstockkeepingunit` string, `hasean_ucc13` string, `hasmpn` string, `hasmanufacturer` string, `condition` string, `color` string, `hasgtin14` string, `name` string, `hasgtin8` string, PRIMARY KEY (`name`), LABEL (`name`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-cart-shopping');
CREATE OR REPLACE CONCEPT `pricespecification` (`hascurrency` string, `hascurrencyvalue` float, PRIMARY KEY (`hascurrencyvalue`, `hascurrency`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-dollar-sign');
CREATE OR REPLACE CONCEPT `paymentmethod` (`name` string, PRIMARY KEY (`name`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-credit-card');
CREATE OR REPLACE CONCEPT `openinghoursspecification` (`dayofweek` string, `validfrom` timestamp, `opens` time, `closes` time, `validthrough` timestamp, PRIMARY KEY (`opens`, `closes`), CONSTRAINT `hasopeninghoursday` FOREIGN KEY (`dayofweek`) REFERENCES `dayofweek` (`dayofweek`) INVERSEOF `openinghoursspecification` ) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-clock');
CREATE OR REPLACE CONCEPT `offering` (`description` string, `availabilityends` timestamp, `serialnumber` string, `validfrom` timestamp, `eligibleregions` string, `availabilitystarts` timestamp, `condition` string, `includes` string, `name` string, `validthrough` timestamp, PRIMARY KEY (`name`), LABEL (`name`), CONSTRAINT `haswarrantypromiseconstraint` FOREIGN KEY (`name`) REFERENCES `warrantypromise` (`durationofwarrantyinmonths`) INVERSEOF `~haswarrantypromiseconstraint` , CONSTRAINT `acceptedpaymentmethodsconstraint` FOREIGN KEY (`name`) REFERENCES `paymentmethod` (`name`) INVERSEOF `~acceptedpaymentmethodsconstraint` , CONSTRAINT `eligibletransactionvolumeconstraint` FOREIGN KEY (`name`) REFERENCES `pricespecification` (`hascurrencyvalue`) INVERSEOF `~eligibletransactionvolumeconstraint` , CONSTRAINT `advancebookingrequirementconstraint` FOREIGN KEY (`name`) REFERENCES `quantitativevalue` (`hasvalue`) INVERSEOF `~advancebookingrequirementconstraint` , CONSTRAINT `availableatorfromconstraint` FOREIGN KEY (`name`) REFERENCES `location` (`globallocationnumber`) INVERSEOF `~availableatorfromconstraint` , CONSTRAINT `availabledeliverymethodsconstraint` FOREIGN KEY (`name`) REFERENCES `deliverymethod` (`name`) INVERSEOF `~availabledeliverymethodsconstraint` , CONSTRAINT `haspricespecificationconstraint` FOREIGN KEY (`name`) REFERENCES `pricespecification` (`hascurrencyvalue`) INVERSEOF `~haspricespecificationconstraint` , CONSTRAINT `haseligiblequantityconstraint` FOREIGN KEY (`name`) REFERENCES `quantitativevalue` (`hasvalue`) INVERSEOF `~haseligiblequantityconstraint` , CONSTRAINT `deliveryleadtimeconstraint` FOREIGN KEY (`name`) REFERENCES `quantitativevalue` (`hasvalue`) INVERSEOF `~deliveryleadtimeconstraint` , CONSTRAINT `hasbusinessfunctionconstraint` FOREIGN KEY (`name`) REFERENCES `businessfunction` (`name`) INVERSEOF `~hasbusinessfunctionconstraint` , CONSTRAINT `eligibledurationconstraint` FOREIGN KEY (`name`) REFERENCES `quantitativevalue` (`hasvalue`) INVERSEOF `~eligibledurationconstraint` ) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-gift');
CREATE OR REPLACE CONCEPT `location` (`name` string, `globallocationnumber` string, PRIMARY KEY (`globallocationnumber`), LABEL (`name`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-location-dot');
CREATE OR REPLACE CONCEPT `deliverymethod` (`name` string, PRIMARY KEY (`name`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-truck');
CREATE OR REPLACE CONCEPT `dayofweek` (`dayofweek` string, PRIMARY KEY (`dayofweek`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-calendar-week');
CREATE OR REPLACE CONCEPT `businessfunction` (`name` string, PRIMARY KEY (`name`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-users-cog');
CREATE OR REPLACE CONCEPT `businessentitytype` (`name` string, PRIMARY KEY (`name`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-tags');
CREATE OR REPLACE CONCEPT `businessentity` (`taxid` string, `duns` string, `isicv4` integer, `naics` integer, `legalname` string, `vatid` string, `name` string, `globallocationnumber` string, PRIMARY KEY (`globallocationnumber`), LABEL (`name`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-building-un');
CREATE OR REPLACE CONCEPT `brand` (`name` string, PRIMARY KEY (`name`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-bootstrap');
CREATE OR REPLACE CONCEPT `partsandlaborpickup`  INHERITS (`warrantyscope`);
CREATE OR REPLACE CONCEPT `partsandlaborbringin`  INHERITS (`warrantyscope`);
CREATE OR REPLACE CONCEPT `laborbringin`  INHERITS (`warrantyscope`);
CREATE OR REPLACE CONCEPT `quantitativevalueinteger`  INHERITS (`quantitativevalue`);
CREATE OR REPLACE CONCEPT `quantitativevaluefloat`  INHERITS (`quantitativevalue`);
CREATE OR REPLACE CONCEPT `someitems`  INHERITS (`productorservice`);
CREATE OR REPLACE CONCEPT `productorservicemodel`  INHERITS (`productorservice`);
CREATE OR REPLACE CONCEPT `individual`  INHERITS (`productorservice`);
CREATE OR REPLACE CONCEPT `unitpricespecification` (`pricetype` string, `hasunitofmeasurement` string, `billingincrement` float) INHERITS (`pricespecification`);
CREATE OR REPLACE CONCEPT `paymentchargespecification` (`appliestopaymentmethod` string, CONSTRAINT `appliestopaymentmethodconstraint` FOREIGN KEY (`appliestopaymentmethod`) REFERENCES `paymentmethod` (`name`) INVERSEOF `~appliestopaymentmethodconstraint` ) INHERITS (`pricespecification`);
CREATE OR REPLACE CONCEPT `deliverychargespecification` (`eligibleregions` string, `appliestodeliverymethod` string, LABEL (`appliestodeliverymethod`), CONSTRAINT `appliestodeliverymethodconstraint` FOREIGN KEY (`appliestodeliverymethod`) REFERENCES `deliverymethod` (`name`) INVERSEOF `~appliestodeliverymethodconstraint` ) INHERITS (`pricespecification`);
CREATE OR REPLACE CONCEPT `payswarm`  INHERITS (`paymentmethod`);
CREATE OR REPLACE CONCEPT `paypal`  INHERITS (`paymentmethod`);
CREATE OR REPLACE CONCEPT `paymentmethodcreditcard`  INHERITS (`paymentmethod`);
CREATE OR REPLACE CONCEPT `googlecheckout`  INHERITS (`paymentmethod`);
CREATE OR REPLACE CONCEPT `directdebit`  INHERITS (`paymentmethod`);
CREATE OR REPLACE CONCEPT `cod`  INHERITS (`paymentmethod`);
CREATE OR REPLACE CONCEPT `checkinadvance`  INHERITS (`paymentmethod`);
CREATE OR REPLACE CONCEPT `cash`  INHERITS (`paymentmethod`);
CREATE OR REPLACE CONCEPT `byinvoice`  INHERITS (`paymentmethod`);
CREATE OR REPLACE CONCEPT `bybanktransferinadvance`  INHERITS (`paymentmethod`);
CREATE OR REPLACE CONCEPT `visa`  INHERITS (`paymentmethodcreditcard`);
CREATE OR REPLACE CONCEPT `mastercard`  INHERITS (`paymentmethodcreditcard`);
CREATE OR REPLACE CONCEPT `jcb`  INHERITS (`paymentmethodcreditcard`);
CREATE OR REPLACE CONCEPT `discover`  INHERITS (`paymentmethodcreditcard`);
CREATE OR REPLACE CONCEPT `dinersclub`  INHERITS (`paymentmethodcreditcard`);
CREATE OR REPLACE CONCEPT `americanexpress`  INHERITS (`paymentmethodcreditcard`);
CREATE OR REPLACE CONCEPT `ups`  INHERITS (`deliverymethod`);
CREATE OR REPLACE CONCEPT `federalexpress`  INHERITS (`deliverymethod`);
CREATE OR REPLACE CONCEPT `dhl`  INHERITS (`deliverymethod`);
CREATE OR REPLACE CONCEPT `deliverymodepickup`  INHERITS (`deliverymethod`);
CREATE OR REPLACE CONCEPT `deliverymodeownfleet`  INHERITS (`deliverymethod`);
CREATE OR REPLACE CONCEPT `deliverymodemail`  INHERITS (`deliverymethod`);
CREATE OR REPLACE CONCEPT `deliverymodefreight`  INHERITS (`deliverymethod`);
CREATE OR REPLACE CONCEPT `deliverymodedirectdownload`  INHERITS (`deliverymethod`);
CREATE OR REPLACE CONCEPT `wednesday`  INHERITS (`dayofweek`);
CREATE OR REPLACE CONCEPT `tuesday`  INHERITS (`dayofweek`);
CREATE OR REPLACE CONCEPT `thursday`  INHERITS (`dayofweek`);
CREATE OR REPLACE CONCEPT `sunday`  INHERITS (`dayofweek`);
CREATE OR REPLACE CONCEPT `saturday`  INHERITS (`dayofweek`);
CREATE OR REPLACE CONCEPT `publicholidays`  INHERITS (`dayofweek`);
CREATE OR REPLACE CONCEPT `monday`  INHERITS (`dayofweek`);
CREATE OR REPLACE CONCEPT `friday`  INHERITS (`dayofweek`);
CREATE OR REPLACE CONCEPT `sell`  INHERITS (`businessfunction`);
CREATE OR REPLACE CONCEPT `repair`  INHERITS (`businessfunction`);
CREATE OR REPLACE CONCEPT `provideservice`  INHERITS (`businessfunction`);
CREATE OR REPLACE CONCEPT `maintain`  INHERITS (`businessfunction`);
CREATE OR REPLACE CONCEPT `leaseout`  INHERITS (`businessfunction`);
CREATE OR REPLACE CONCEPT `dispose`  INHERITS (`businessfunction`);
CREATE OR REPLACE CONCEPT `constructioninstallation`  INHERITS (`businessfunction`);
CREATE OR REPLACE CONCEPT `buy`  INHERITS (`businessfunction`);
CREATE OR REPLACE CONCEPT `reseller`  INHERITS (`businessentitytype`);
CREATE OR REPLACE CONCEPT `publicinstitution`  INHERITS (`businessentitytype`);
CREATE OR REPLACE CONCEPT `enduser`  INHERITS (`businessentitytype`);
CREATE OR REPLACE CONCEPT `business`  INHERITS (`businessentitytype`);
CREATE OR REPLACE CONCEPT `person`  INHERITS (`businessentity`);
CREATE OR REPLACE CONCEPT `organization`  INHERITS (`businessentity`);