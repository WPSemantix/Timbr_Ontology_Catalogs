CREATE OR REPLACE PROPERTY `company_classification` string;
CREATE OR REPLACE PROPERTY `logo_url` string;
CREATE OR REPLACE PROPERTY `stock_symbol` string;
CREATE OR REPLACE PROPERTY `last_funding_at` date;
CREATE OR REPLACE PROPERTY `subject` string;
CREATE OR REPLACE PROPERTY `funding_round_code` string;
CREATE OR REPLACE PROPERTY `normalized_name` string;
CREATE OR REPLACE PROPERTY `pre_money_valuation` decimal;
CREATE OR REPLACE PROPERTY `source_url` string;
CREATE OR REPLACE PROPERTY `zip_code` string;
CREATE OR REPLACE PROPERTY `graduated_at` date;
CREATE OR REPLACE PROPERTY `office_id` string;
CREATE OR REPLACE PROPERTY `institution` string;
CREATE OR REPLACE PROPERTY `pre_money_currency_code` string;
CREATE OR REPLACE PROPERTY `product_id` string;
CREATE OR REPLACE PROPERTY `ipo_id` string;
CREATE OR REPLACE PROPERTY `first_funding_at` date;
CREATE OR REPLACE PROPERTY `id` bigint;
CREATE OR REPLACE PROPERTY `funding_round_id` bigint;
CREATE OR REPLACE PROPERTY `logo_height` integer;
CREATE OR REPLACE PROPERTY `longitude` decimal;
CREATE OR REPLACE PROPERTY `person_id` string;
CREATE OR REPLACE PROPERTY `closed_at` date;
CREATE OR REPLACE PROPERTY `is_first_round` integer;
CREATE OR REPLACE PROPERTY `category_code` string;
CREATE OR REPLACE PROPERTY `pre_money_valuation_usd` decimal;
CREATE OR REPLACE PROPERTY `invested_companies` integer;
CREATE OR REPLACE PROPERTY `organization_name` string;
CREATE OR REPLACE PROPERTY `valuation_amount` decimal;
CREATE OR REPLACE PROPERTY `created_by` string;
CREATE OR REPLACE PROPERTY `object_id` string;
CREATE OR REPLACE PROPERTY `product_name` string;
CREATE OR REPLACE PROPERTY `c1` string;
CREATE OR REPLACE PROPERTY `post_money_valuation_usd` decimal;
CREATE OR REPLACE PROPERTY `country_code` string;
CREATE OR REPLACE PROPERTY `full_name` string;
CREATE OR REPLACE PROPERTY `birthplace` string;
CREATE OR REPLACE PROPERTY `parent_id` string;
CREATE OR REPLACE PROPERTY `domain` string;
CREATE OR REPLACE PROPERTY `organization_id` string;
CREATE OR REPLACE PROPERTY `name` string;
CREATE OR REPLACE PROPERTY `founded_at` date;
CREATE OR REPLACE PROPERTY `permalink` string;
CREATE OR REPLACE PROPERTY `region` string;
CREATE OR REPLACE PROPERTY `state_code` string;
CREATE OR REPLACE PROPERTY `last_investment_at` date;
CREATE OR REPLACE PROPERTY `is_last_round` integer;
CREATE OR REPLACE PROPERTY `raised_currency_code` string;
CREATE OR REPLACE PROPERTY `status` string;
CREATE OR REPLACE PROPERTY `last_milestone_at` date;
CREATE OR REPLACE PROPERTY `short_description` string;
CREATE OR REPLACE PROPERTY `funding_round_type` string;
CREATE OR REPLACE PROPERTY `city` string;
CREATE OR REPLACE PROPERTY `homepage_url` string;
CREATE OR REPLACE PROPERTY `latitude` decimal;
CREATE OR REPLACE PROPERTY `milestone_id` string;
CREATE OR REPLACE PROPERTY `twitter_username` string;
CREATE OR REPLACE PROPERTY `description` string;
CREATE OR REPLACE PROPERTY `fund_id` string;
CREATE OR REPLACE PROPERTY `affiliation_name` string;
CREATE OR REPLACE PROPERTY `first_investment_at` date;
CREATE OR REPLACE PROPERTY `funded_at` date;
CREATE OR REPLACE PROPERTY `raised_amount_usd` decimal;
CREATE OR REPLACE PROPERTY `tag_list` string;
CREATE OR REPLACE PROPERTY `valuation_currency_code` string;
CREATE OR REPLACE PROPERTY `first_name` string;
CREATE OR REPLACE PROPERTY `logo_width` integer;
CREATE OR REPLACE PROPERTY `participants` integer;
CREATE OR REPLACE PROPERTY `overview` string;
CREATE OR REPLACE PROPERTY `address2` string;
CREATE OR REPLACE PROPERTY `address1` string;
CREATE OR REPLACE PROPERTY `last_name` string;
CREATE OR REPLACE PROPERTY `raised_amount` decimal;
CREATE OR REPLACE PROPERTY `post_money_currency_code` string;
CREATE OR REPLACE PROPERTY `first_milestone_at` date;
CREATE OR REPLACE PROPERTY `milestone_at` date;
CREATE OR REPLACE PROPERTY `funding_rounds` integer;
CREATE OR REPLACE PROPERTY `degree_type` string;
CREATE OR REPLACE PROPERTY `post_money_valuation` decimal;
CREATE OR REPLACE PROPERTY `milestone_code` string;
CREATE OR REPLACE PROPERTY `public_at` date;
CREATE OR REPLACE PROPERTY `organization_type` string;
CREATE OR REPLACE PROPERTY `fullname` string;
CREATE OR REPLACE PROPERTY `investment_rounds` integer;
CREATE OR REPLACE PROPERTY `milestones` integer;
CREATE OR REPLACE PROPERTY `funding_total_usd` decimal;
CREATE OR REPLACE PROPERTY `source_description` string;
CREATE OR REPLACE CONCEPT `profile` (`invested_companies` integer, `person_id` string, `tag_list` string, `twitter_username` string, `name` string, `overview` string, PRIMARY KEY (`person_id`), LABEL (`name`)) INHERITS (`thing`) DESCRIPTION 'info about profiles' WITH TAGS (`icon` = 'fa-user-circle');
CREATE OR REPLACE CONCEPT `product` (`logo_width` integer, `first_milestone_at` date, `milestones` integer, `tag_list` string, `product_id` string, `founded_at` date, `closed_at` date, `twitter_username` string, `permalink` string, `domain` string, `logo_height` integer, `logo_url` string, `parent_id` string, `last_milestone_at` date, `region` string, `status` string, `normalized_name` string, `product_name` string, `homepage_url` string, `overview` string, PRIMARY KEY (`product_id`), LABEL (`product_name`), CONSTRAINT `product_milestone` FOREIGN KEY (`product_id`) REFERENCES `milestone` (`object_id`) INVERSEOF `~product_milestone` ) INHERITS (`thing`) DESCRIPTION 'The product information of a specific company' WITH TAGS (`icon` = 'fa-product-hunt');
CREATE OR REPLACE CONCEPT `person` (`full_name` string, `person_id` string, `funding_round_id` bigint, `last_name` string, `fullname` string, `birthplace` string, `organization_id` string, `affiliation_name` string, `first_name` string, `c1` string, PRIMARY KEY (`person_id`), LABEL (`first_name`, `last_name`), CONSTRAINT `has_degree` FOREIGN KEY (`person_id`) REFERENCES `degree` (`person_id`) INVERSEOF `~has_degree` , CONSTRAINT `made_investment` MULTIREFERENCE `funding_round` INVERSEOF `invested_by` , CONSTRAINT `has_profile` FOREIGN KEY (`person_id`) REFERENCES `profile` (`person_id`) INVERSEOF `profile_of` , CONSTRAINT `works_at` MULTIREFERENCE `organization` INVERSEOF `has_employee` , CONSTRAINT `works_at2` MULTIREFERENCE `organization` INVERSEOF `has_employee2` , CONSTRAINT `reached_milestone` FOREIGN KEY (`person_id`) REFERENCES `milestone` (`object_id`) INVERSEOF `milestone_by` ) INHERITS (`thing`) DESCRIPTION 'info about people' WITH TAGS (`icon` = 'fa-person');
CREATE OR REPLACE CONCEPT `organization` (`invested_companies` integer, `first_milestone_at` date, `tag_list` string, `funding_round_id` bigint, `first_investment_at` date, `short_description` string, `organization_name` string, `city` string, `organization_id` string, `permalink` string, `logo_height` integer, `organization_type` string, `last_milestone_at` date, `normalized_name` string, `homepage_url` string, `state_code` string, `overview` string, `logo_width` integer, `investment_rounds` integer, `founded_at` date, `twitter_username` string, `domain` string, `description` string, `country_code` string, `last_investment_at` date, `logo_url` string, `region` string, `status` string, PRIMARY KEY (`organization_id`), LABEL (`organization_name`), CONSTRAINT `made_investment` MULTIREFERENCE `funding_round` INVERSEOF `invested_from` , CONSTRAINT `reached_milestone` FOREIGN KEY (`organization_id`) REFERENCES `milestone` (`object_id`) INVERSEOF `milestone_of` , CONSTRAINT `has_office` FOREIGN KEY (`organization_id`) REFERENCES `office` (`organization_id`) INVERSEOF `organization_office` ) INHERITS (`thing`) DESCRIPTION 'General information about an organization like location, status, contact, investments ' WITH TAGS (`icon` = 'fa-people-group');
CREATE OR REPLACE CONCEPT `office` (`country_code` string, `description` string, `region` string, `latitude` decimal, `office_id` string, `address2` string, `zip_code` string, `city` string, `organization_id` string, `state_code` string, `longitude` decimal, `address1` string, PRIMARY KEY (`office_id`), LABEL (`region`)) INHERITS (`thing`) DESCRIPTION 'General information about an offices like country, city, address' WITH TAGS (`icon` = 'fa-building-user');
CREATE OR REPLACE CONCEPT `milestone` (`description` string, `source_url` string, `object_id` string, `milestone_id` string, `source_description` string, `milestone_code` string, `milestone_at` date, PRIMARY KEY (`milestone_id`), LABEL (`milestone_code`)) INHERITS (`thing`) DESCRIPTION 'milestones info' WITH TAGS (`icon` = 'fa-mountain-sun');
CREATE OR REPLACE CONCEPT `ipo` (`valuation_amount` decimal, `source_url` string, `raised_currency_code` string, `valuation_currency_code` string, `raised_amount` decimal, `source_description` string, `ipo_id` string, `organization_id` string, `public_at` date, `stock_symbol` string, PRIMARY KEY (`ipo_id`), LABEL (`stock_symbol`)) INHERITS (`thing`) DESCRIPTION 'Information about company IPOs' WITH TAGS (`icon` = 'fa-funnel-dollar');
CREATE OR REPLACE CONCEPT `funding_round` (`funding_round_type` string, `pre_money_valuation_usd` decimal, `source_url` string, `company_classification` string, `funding_round_code` string, `funding_round_id` bigint, `created_by` string, `post_money_valuation_usd` decimal, `raised_currency_code` string, `participants` integer, `post_money_currency_code` string, `organization_id` string, `pre_money_valuation` decimal, `post_money_valuation` decimal, `is_last_round` integer, `raised_amount` decimal, `funded_at` date, `pre_money_currency_code` string, `source_description` string, `is_first_round` integer, `raised_amount_usd` decimal, PRIMARY KEY (`funding_round_id`), LABEL (`funding_round_type`), CONSTRAINT `funding_of` FOREIGN KEY (`organization_id`) REFERENCES `company` (`organization_id`) INVERSEOF `investment` ) INHERITS (`thing`) DESCRIPTION 'A specific funding round of a company' WITH TAGS (`icon` = 'fa-arrows-to-circle',`t1` = 'test');
CREATE OR REPLACE CONCEPT `fund` (`source_url` string, `fund_id` string, `object_id` string, `raised_currency_code` string, `funded_at` date, `raised_amount` decimal, `source_description` string, `name` string, PRIMARY KEY (`fund_id`), LABEL (`name`)) INHERITS (`thing`) DESCRIPTION 'An investment fund' WITH TAGS (`icon` = 'fa-money-check-dollar');
CREATE OR REPLACE CONCEPT `degree` (`person_id` string, `id` bigint, `subject` string, `graduated_at` date, `institution` string, `degree_type` string, PRIMARY KEY (`id`), LABEL (`degree_type`)) INHERITS (`thing`) DESCRIPTION 'The degree of a specific person' WITH TAGS (`icon` = 'fa-user-graduate');
CREATE OR REPLACE CONCEPT `private`  INHERITS (`product`) FROM timbr.`product` WHERE `status` = 'private';
CREATE OR REPLACE CONCEPT `operating`  INHERITS (`product`) FROM timbr.`product` WHERE `status` = 'operating';
CREATE OR REPLACE CONCEPT `live`  INHERITS (`product`) FROM timbr.`product` WHERE `status` = 'live';
CREATE OR REPLACE CONCEPT `development`  INHERITS (`product`) FROM timbr.`product` WHERE `status` = 'development';
CREATE OR REPLACE CONCEPT `closed`  INHERITS (`product`) FROM timbr.`product` WHERE `status` = 'closed';
CREATE OR REPLACE CONCEPT `beta`  INHERITS (`product`) FROM timbr.`product` WHERE `status` = 'beta';
CREATE OR REPLACE CONCEPT `alpha`  INHERITS (`product`) FROM timbr.`product` WHERE `status` = 'alpha';
CREATE OR REPLACE CONCEPT `financial_organization` ( CONSTRAINT `financial_funds` FOREIGN KEY (`organization_id`) REFERENCES `fund` (`object_id`) INVERSEOF `~financial_funds` ) INHERITS (`organization`) DESCRIPTION 'Organizations that have financial funds and invest in companies';
CREATE OR REPLACE CONCEPT `company` (`fund_id` string, `category_code` string, `funding_rounds` integer, `last_funding_at` date, `created_by` string, `funding_total_usd` decimal, `closed_at` date, `first_funding_at` date, `degree_type` string, CONSTRAINT `has_product` FOREIGN KEY (`organization_id`) REFERENCES `product` (`parent_id`) INVERSEOF `product_by` , CONSTRAINT `company_ipo` FOREIGN KEY (`organization_id`) REFERENCES `ipo` (`organization_id`) INVERSEOF `of_company` , CONSTRAINT `has_acquired` MULTIREFERENCE `company` INVERSEOF `acquired_by` ) INHERITS (`organization`) DESCRIPTION 'An organization that has funding informaton';
CREATE OR REPLACE CONCEPT `web_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'web';
CREATE OR REPLACE CONCEPT `travel_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'travel';
CREATE OR REPLACE CONCEPT `transportation_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'transportation';
CREATE OR REPLACE CONCEPT `sport_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'sports';
CREATE OR REPLACE CONCEPT `software_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'software';
CREATE OR REPLACE CONCEPT `social_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'social';
CREATE OR REPLACE CONCEPT `semiconductor_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'semiconductor';
CREATE OR REPLACE CONCEPT `security_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'security';
CREATE OR REPLACE CONCEPT `search_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'search';
CREATE OR REPLACE CONCEPT `real_estate_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'real_estate';
CREATE OR REPLACE CONCEPT `public_relations_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'public_relations';
CREATE OR REPLACE CONCEPT `photo_video_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'photo_video';
CREATE OR REPLACE CONCEPT `pet_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'pets';
CREATE OR REPLACE CONCEPT `nonprofit_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'nonprofit';
CREATE OR REPLACE CONCEPT `news_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'news';
CREATE OR REPLACE CONCEPT `network_hosting_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'network_hosting';
CREATE OR REPLACE CONCEPT `nanotech_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'nanotech';
CREATE OR REPLACE CONCEPT `music_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'music';
CREATE OR REPLACE CONCEPT `mobile_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'mobile';
CREATE OR REPLACE CONCEPT `messaging_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'messaging';
CREATE OR REPLACE CONCEPT `medical_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'medical';
CREATE OR REPLACE CONCEPT `manufacturing_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'manufacturing';
CREATE OR REPLACE CONCEPT `local_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'local';
CREATE OR REPLACE CONCEPT `legal_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'legal';
CREATE OR REPLACE CONCEPT `hospitality_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'hospitality';
CREATE OR REPLACE CONCEPT `health_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'health';
CREATE OR REPLACE CONCEPT `hardware_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'hardware';
CREATE OR REPLACE CONCEPT `government_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'government';
CREATE OR REPLACE CONCEPT `google_owned_company`  INHERITS (`company`) FROM timbr.`company` WHERE `organization_name` LIKE '%Google%';
CREATE OR REPLACE CONCEPT `games_video_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'games_video';
CREATE OR REPLACE CONCEPT `finance_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'finance';
CREATE OR REPLACE CONCEPT `education_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'education';
CREATE OR REPLACE CONCEPT `ecommerce_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'ecommerce';
CREATE OR REPLACE CONCEPT `design_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'design';
CREATE OR REPLACE CONCEPT `consulting_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'consulting';
CREATE OR REPLACE CONCEPT `cleantech_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'cleantech';
CREATE OR REPLACE CONCEPT `biotech_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'biotech';
CREATE OR REPLACE CONCEPT `automotive_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'automotive';
CREATE OR REPLACE CONCEPT `analytics_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'analytics';
CREATE OR REPLACE CONCEPT `advertising_company`  INHERITS (`company`) FROM timbr.`company` WHERE `category_code` = 'advertising';
CREATE OR REPLACE CONCEPT `series_c`  INHERITS (`funding_round`) FROM timbr.`funding_round` WHERE `funding_round_type` = 'series-c+';
CREATE OR REPLACE CONCEPT `series_b`  INHERITS (`funding_round`) FROM timbr.`funding_round` WHERE `funding_round_type` = 'series-b';
CREATE OR REPLACE CONCEPT `series_a`  INHERITS (`funding_round`) FROM timbr.`funding_round` WHERE `funding_round_type` = 'series-a';
CREATE OR REPLACE CONCEPT `post_ipo`  INHERITS (`funding_round`) FROM timbr.`funding_round` WHERE `funding_round_type` = 'post-ipo';
CREATE OR REPLACE CONCEPT `angel`  INHERITS (`funding_round`) FROM timbr.`funding_round` WHERE `funding_round_type` = 'angel';
CREATE OR REPLACE CONCEPT `mba`  INHERITS (`degree`) DESCRIPTION 'info about mba degrees' FROM timbr.`degree` WHERE `degree_type` = 'MBA';
CREATE OR REPLACE CONCEPT `bs`  INHERITS (`degree`) DESCRIPTION 'info about bs degrees' WITH TAGS (`icon` = 'fa-user-graduate') FROM timbr.`degree` WHERE `degree_type` = 'BS';
CREATE OR REPLACE CONCEPT `ba`  INHERITS (`degree`) DESCRIPTION 'info about ba degrees' WITH TAGS (`icon` = 'fa-user-graduate') FROM timbr.`degree` WHERE `degree_type` = 'BA';