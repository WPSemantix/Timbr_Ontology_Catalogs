CREATE OR REPLACE PROPERTY `has_urgency_banner` bigint;
CREATE OR REPLACE PROPERTY `customer_phone_number` string;
CREATE OR REPLACE PROPERTY `title_orig` string;
CREATE OR REPLACE PROPERTY `product_url` string;
CREATE OR REPLACE PROPERTY `badge_fast_shipping` bigint;
CREATE OR REPLACE PROPERTY `badge_local_product` bigint;
CREATE OR REPLACE PROPERTY `rating` float;
CREATE OR REPLACE PROPERTY `inventory_name` string;
CREATE OR REPLACE PROPERTY `rating_four_count` bigint;
CREATE OR REPLACE PROPERTY `rating_five_count` bigint;
CREATE OR REPLACE PROPERTY `rating_two_count` bigint;
CREATE OR REPLACE PROPERTY `retail_price` bigint;
CREATE OR REPLACE PROPERTY `inventory_city` string;
CREATE OR REPLACE PROPERTY `merchant_title` string;
CREATE OR REPLACE PROPERTY `inventory_country` string;
CREATE OR REPLACE PROPERTY `price` float;
CREATE OR REPLACE PROPERTY `product_id` string;
CREATE OR REPLACE PROPERTY `shipping_option_price` bigint;
CREATE OR REPLACE PROPERTY `badge_product_quality` bigint;
CREATE OR REPLACE PROPERTY `currency_buyer` string;
CREATE OR REPLACE PROPERTY `rating_one_count` integer;
CREATE OR REPLACE PROPERTY `inventory_id` string;
CREATE OR REPLACE PROPERTY `badges_count` bigint;
CREATE OR REPLACE PROPERTY `merchant_name` string;
CREATE OR REPLACE PROPERTY `urgency_text` string;
CREATE OR REPLACE PROPERTY `product_color` string;
CREATE OR REPLACE PROPERTY `product_picture` string;
CREATE OR REPLACE PROPERTY `shipment_id` string;
CREATE OR REPLACE PROPERTY `countries_shipped_to` bigint;
CREATE OR REPLACE PROPERTY `merchant_has_profile_picture` bigint;
CREATE OR REPLACE PROPERTY `rating_count` bigint;
CREATE OR REPLACE PROPERTY `tags` string;
CREATE OR REPLACE PROPERTY `merchant_rating_count` bigint;
CREATE OR REPLACE PROPERTY `product_variation_inventory` bigint;
CREATE OR REPLACE PROPERTY `uses_ad_boosts` bigint;
CREATE OR REPLACE PROPERTY `customer_email` string;
CREATE OR REPLACE PROPERTY `merchant_info_subtitle` string;
CREATE OR REPLACE PROPERTY `rating_three_count` bigint;
CREATE OR REPLACE PROPERTY `merchant_profile_picture` string;
CREATE OR REPLACE PROPERTY `order_id` string;
CREATE OR REPLACE PROPERTY `shipping_is_express` bigint;
CREATE OR REPLACE PROPERTY `merchant_id` string;
CREATE OR REPLACE PROPERTY `title` string;
CREATE OR REPLACE PROPERTY `theme` string;
CREATE OR REPLACE PROPERTY `merchant_rating` float;
CREATE OR REPLACE PROPERTY `tag_name` string;
CREATE OR REPLACE PROPERTY `inventory_total` bigint;
CREATE OR REPLACE PROPERTY `origin_country` string;
CREATE OR REPLACE PROPERTY `units_sold` bigint;
CREATE OR REPLACE PROPERTY `shipping_option_name` string;
CREATE OR REPLACE PROPERTY `customer_name` string;
CREATE OR REPLACE PROPERTY `product_variation_size_id` string;
CREATE OR REPLACE PROPERTY `customer_id` string;
CREATE OR REPLACE CONCEPT `tag` (`tag_name` string, PRIMARY KEY (`tag_name`), LABEL (`tag_name`)) INHERITS (`thing`) DESCRIPTION 'Tags per product' WITH TAGS (`icon` = 'fa-tag');
CREATE OR REPLACE CONCEPT `shipment` (`origin_country` string, `order_id` string, `shipping_is_express` bigint, `shipping_option_name` string, `shipping_option_price` bigint, `countries_shipped_to` bigint, `shipment_id` string, PRIMARY KEY (`shipment_id`), LABEL (`shipment_id`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-shipping-fast');
CREATE OR REPLACE CONCEPT `product` (`retail_price` bigint, `product_url` string, `badge_local_product` bigint, `product_variation_inventory` bigint, `product_id` string, `badge_fast_shipping` bigint, `tags` string, `uses_ad_boosts` bigint, `title_orig` string, `price` float, `product_picture` string, `product_color` string, `merchant_id` string, `tag_name` string, `title` string, `theme` string, `badge_product_quality` bigint, `badges_count` bigint, `product_variation_size_id` string, PRIMARY KEY (`product_id`), LABEL (`title_orig`), CONSTRAINT `of_merchant` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`merchant_id`) INVERSEOF `has_product` , CONSTRAINT `has_tag` MULTIREFERENCE `tag` INVERSEOF `of_product` ) INHERITS (`thing`) DESCRIPTION 'information about products' WITH TAGS (`icon` = 'fa-box-open');
CREATE OR REPLACE CONCEPT `order` (`customer_id` string, `product_id` string, `order_id` string, `currency_buyer` string, `has_urgency_banner` bigint, `units_sold` bigint, `urgency_text` string, PRIMARY KEY (`order_id`), LABEL (`order_id`), CONSTRAINT `includes_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) INVERSEOF `in_order` , CONSTRAINT `in_shipment` FOREIGN KEY (`order_id`) REFERENCES `shipment` (`order_id`) INVERSEOF `has_order` , CONSTRAINT `ordered_by` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) INVERSEOF `has_ordered` ) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-wpforms');
CREATE OR REPLACE CONCEPT `merchant` (`rating_one_count` integer, `rating_four_count` bigint, `origin_country` string, `merchant_rating` float, `rating_five_count` bigint, `rating_count` bigint, `rating` float, `rating_three_count` bigint, `merchant_info_subtitle` string, `merchant_has_profile_picture` bigint, `merchant_rating_count` bigint, `merchant_name` string, `merchant_title` string, `merchant_profile_picture` string, `merchant_id` string, `rating_two_count` bigint, PRIMARY KEY (`merchant_id`), LABEL (`merchant_title`)) INHERITS (`thing`) DESCRIPTION 'Information about all merchants' WITH TAGS (`icon` = 'fa-store');
CREATE OR REPLACE CONCEPT `inventory` (`inventory_total` bigint, `inventory_name` string, `product_id` string, `inventory_city` string, `inventory_country` string, `inventory_id` string, PRIMARY KEY (`inventory_id`), LABEL (`inventory_name`), CONSTRAINT `of_product_` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) INVERSEOF `has_inventory` ) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-warehouse');
CREATE OR REPLACE CONCEPT `customer` (`customer_id` string, `customer_email` string, `customer_name` string, `customer_phone_number` string, PRIMARY KEY (`customer_id`), LABEL (`customer_name`)) INHERITS (`thing`) WITH TAGS (`icon` = 'fa-user');
CREATE OR REPLACE CONCEPT `yoga`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Yoga';
CREATE OR REPLACE CONCEPT `women_vest`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Women Vest';
CREATE OR REPLACE CONCEPT `women_top`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'women top';
CREATE OR REPLACE CONCEPT `women_jumpsuit`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'women Jumpsuit';
CREATE OR REPLACE CONCEPT `women_fashion`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Women Fashion';
CREATE OR REPLACE CONCEPT `women_dress`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'women dress';
CREATE OR REPLACE CONCEPT `womens_fashion`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` LIKE 'Women%' AND `tag_name` LIKE '%Fashion';
CREATE OR REPLACE CONCEPT `women`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Women';
CREATE OR REPLACE CONCEPT `waist`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Waist';
CREATE OR REPLACE CONCEPT `v_neck`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'V-neck';
CREATE OR REPLACE CONCEPT `vintage`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Vintage';
CREATE OR REPLACE CONCEPT `vest`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Vest';
CREATE OR REPLACE CONCEPT `t_shirts`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'T Shirts';
CREATE OR REPLACE CONCEPT `tunic`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'tunic';
CREATE OR REPLACE CONCEPT `trousers`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'trousers';
CREATE OR REPLACE CONCEPT `tops_t_shirts`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Tops & T-Shirts';
CREATE OR REPLACE CONCEPT `tops_blouses`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Tops & Blouses';
CREATE OR REPLACE CONCEPT `topsamptshirt`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'topsamptshirt';
CREATE OR REPLACE CONCEPT `tank_top`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'tank top';
CREATE OR REPLACE CONCEPT `tank`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Tank';
CREATE OR REPLACE CONCEPT `swimwear`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Swimwear';
CREATE OR REPLACE CONCEPT `swimsuit`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Swimsuit';
CREATE OR REPLACE CONCEPT `swimming`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Swimming';
CREATE OR REPLACE CONCEPT `summer_t_shirts`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'summer t-shirts';
CREATE OR REPLACE CONCEPT `summer_tops`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'summer tops';
CREATE OR REPLACE CONCEPT `summer_shorts`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'summer shorts';
CREATE OR REPLACE CONCEPT `summer_fashion`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Summer Fashion';
CREATE OR REPLACE CONCEPT `summer_dresses`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'summer dresses';
CREATE OR REPLACE CONCEPT `summer_dress`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'summer dress';
CREATE OR REPLACE CONCEPT `summer`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Summer';
CREATE OR REPLACE CONCEPT `suits`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Suits';
CREATE OR REPLACE CONCEPT `spring`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Spring';
CREATE OR REPLACE CONCEPT `sport`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Sport';
CREATE OR REPLACE CONCEPT `spaghetti_strap`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Spaghetti Strap';
CREATE OR REPLACE CONCEPT `spaghetti`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Spaghetti';
CREATE OR REPLACE CONCEPT `solid_color`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'solid color';
CREATE OR REPLACE CONCEPT `slim_fit`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Slim Fit';
CREATE OR REPLACE CONCEPT `slim`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'slim';
CREATE OR REPLACE CONCEPT `sleeveless_tops`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'sleeveless tops';
CREATE OR REPLACE CONCEPT `sleeveless_dress`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Sleeveless dress';
CREATE OR REPLACE CONCEPT `sleeveless`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'sleeveless';
CREATE OR REPLACE CONCEPT `sleeve`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Sleeve';
CREATE OR REPLACE CONCEPT `skirts`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Skirts';
CREATE OR REPLACE CONCEPT `size`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Plus Size' OR `tag_name` = 'Large Size' OR `tag_name` = 'Big size' OR `tag_name` = 'Oversize' OR `tag_name` = 'sizesxxxl' OR `tag_name` = 'Medium' OR `tag_name` = 'Large';
CREATE OR REPLACE CONCEPT `short_sleeves`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'short sleeves';
CREATE OR REPLACE CONCEPT `short_pants`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Short pants';
CREATE OR REPLACE CONCEPT `sexy_dress`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Sexy Dress';
CREATE OR REPLACE CONCEPT `sexy`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'sexy';
CREATE OR REPLACE CONCEPT `round_neck`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Round neck';
CREATE OR REPLACE CONCEPT `pure_color`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Pure Color';
CREATE OR REPLACE CONCEPT `printed`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'printed';
CREATE OR REPLACE CONCEPT `print`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Print';
CREATE OR REPLACE CONCEPT `plus_size`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Plus Size';
CREATE OR REPLACE CONCEPT `pleated`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Pleated';
CREATE OR REPLACE CONCEPT `party_dress`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Party Dress';
CREATE OR REPLACE CONCEPT `party`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'party';
CREATE OR REPLACE CONCEPT `off_shoulder`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'off shoulder';
CREATE OR REPLACE CONCEPT `necks`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Necks';
CREATE OR REPLACE CONCEPT `mini_dress`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Mini dress';
CREATE OR REPLACE CONCEPT `mini`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Mini';
CREATE OR REPLACE CONCEPT `men`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Men';
CREATE OR REPLACE CONCEPT `maxi_dress`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'maxi dress';
CREATE OR REPLACE CONCEPT `loose_dress`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'loose dress';
CREATE OR REPLACE CONCEPT `loose`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Loose';
CREATE OR REPLACE CONCEPT `long_dress`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'long dress';
CREATE OR REPLACE CONCEPT `letter_print`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'letter print';
CREATE OR REPLACE CONCEPT `ladies_fashion`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Ladies Fashion';
CREATE OR REPLACE CONCEPT `ladies`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Ladies';
CREATE OR REPLACE CONCEPT `lace_up`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Lace Up';
CREATE OR REPLACE CONCEPT `lace`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Lace';
CREATE OR REPLACE CONCEPT `high_waist`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'high waist';
CREATE OR REPLACE CONCEPT `halter`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Halter';
CREATE OR REPLACE CONCEPT `floral_print`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Floral print';
CREATE OR REPLACE CONCEPT `floral_dress`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Floral dress';
CREATE OR REPLACE CONCEPT `floral`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Floral';
CREATE OR REPLACE CONCEPT `fashion`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Fashion';
CREATE OR REPLACE CONCEPT `elastic`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Elastic';
CREATE OR REPLACE CONCEPT `dresses`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Dresses';
CREATE OR REPLACE CONCEPT `deep_v_neck`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Deep V-Neck';
CREATE OR REPLACE CONCEPT `crop_top`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'crop top';
CREATE OR REPLACE CONCEPT `cotton`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Cotton';
CREATE OR REPLACE CONCEPT `color`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Red' OR `tag_name` = 'Black' OR `tag_name` = 'white' OR `tag_name` = 'Blues' OR `tag_name` = 'Green' OR `tag_name` = 'Yellow' OR `tag_name` = 'pink' OR `tag_name` = 'Grey' OR `tag_name` = 'Colorful';
CREATE OR REPLACE CONCEPT `chiffon`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'chiffon';
CREATE OR REPLACE CONCEPT `category`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Dress' OR `tag_name` = 'Shirt' OR `tag_name` = 'Tops' OR `tag_name` = 'pants' OR `tag_name` = 'Shorts' OR `tag_name` = 'Beach' OR `tag_name` = 'jumpsuit' OR `tag_name` = 'Fitness' OR `tag_name` = 'Bath' OR `tag_name` = 'Sleepwear';
CREATE OR REPLACE CONCEPT `casual_t_shirt`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Casual T-Shirt';
CREATE OR REPLACE CONCEPT `casual_pants`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Casual pants';
CREATE OR REPLACE CONCEPT `casual_dress`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'casual dress';
CREATE OR REPLACE CONCEPT `casual`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Casual';
CREATE OR REPLACE CONCEPT `boho_dress`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'boho dress';
CREATE OR REPLACE CONCEPT `boho`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'boho';
CREATE OR REPLACE CONCEPT `blouse`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'blouse';
CREATE OR REPLACE CONCEPT `bikini`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'Bikini';
CREATE OR REPLACE CONCEPT `beach_dress`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'beach dress';
CREATE OR REPLACE CONCEPT `backless`  INHERITS (`tag`) FROM timbr.`tag` WHERE `tag_name` = 'backless';
CREATE OR REPLACE CONCEPT `xxxl`  INHERITS (`size`) FROM timbr.`size` WHERE `tag_name` = 'sizesxxxl';
CREATE OR REPLACE CONCEPT `plus`  INHERITS (`size`) FROM timbr.`size` WHERE `tag_name` = 'Plus Size';
CREATE OR REPLACE CONCEPT `oversize`  INHERITS (`size`) FROM timbr.`size` WHERE `tag_name` = 'Oversize';
CREATE OR REPLACE CONCEPT `medium`  INHERITS (`size`) FROM timbr.`size` WHERE `tag_name` = 'Medium';
CREATE OR REPLACE CONCEPT `large`  INHERITS (`size`) FROM timbr.`size` WHERE `tag_name` = 'Large' OR `tag_name` = 'Large Size';
CREATE OR REPLACE CONCEPT `big`  INHERITS (`size`) FROM timbr.`size` WHERE `tag_name` = 'Big size';
CREATE OR REPLACE CONCEPT `yellow`  INHERITS (`color`) FROM timbr.`color` WHERE `tag_name` = 'Yellow';
CREATE OR REPLACE CONCEPT `white`  INHERITS (`color`) FROM timbr.`color` WHERE `tag_name` = 'white';
CREATE OR REPLACE CONCEPT `red`  INHERITS (`color`) FROM timbr.`color` WHERE `tag_name` = 'Red';
CREATE OR REPLACE CONCEPT `pink`  INHERITS (`color`) FROM timbr.`color` WHERE `tag_name` = 'pink';
CREATE OR REPLACE CONCEPT `grey`  INHERITS (`color`) FROM timbr.`color` WHERE `tag_name` = 'Grey';
CREATE OR REPLACE CONCEPT `green`  INHERITS (`color`) FROM timbr.`color` WHERE `tag_name` = 'Green';
CREATE OR REPLACE CONCEPT `colorful`  INHERITS (`color`) FROM timbr.`color` WHERE `tag_name` = 'Colorful';
CREATE OR REPLACE CONCEPT `blue`  INHERITS (`color`) FROM timbr.`color` WHERE `tag_name` = 'Blues';
CREATE OR REPLACE CONCEPT `black`  INHERITS (`color`) FROM timbr.`color` WHERE `tag_name` = 'Black';
CREATE OR REPLACE CONCEPT `tops`  INHERITS (`category`) FROM timbr.`category` WHERE `tag_name` = 'Tops';
CREATE OR REPLACE CONCEPT `sleepwear`  INHERITS (`category`) FROM timbr.`category` WHERE `tag_name` = 'Sleepwear';
CREATE OR REPLACE CONCEPT `shorts`  INHERITS (`category`) FROM timbr.`category` WHERE `tag_name` = 'Shorts';
CREATE OR REPLACE CONCEPT `shirt`  INHERITS (`category`) FROM timbr.`category` WHERE `tag_name` = 'Shirt';
CREATE OR REPLACE CONCEPT `pants`  INHERITS (`category`) FROM timbr.`category` WHERE `tag_name` = 'pants';
CREATE OR REPLACE CONCEPT `jumpsuit`  INHERITS (`category`) FROM timbr.`category` WHERE `tag_name` = 'jumpsuit';
CREATE OR REPLACE CONCEPT `fitness`  INHERITS (`category`) FROM timbr.`category` WHERE `tag_name` = 'Fitness';
CREATE OR REPLACE CONCEPT `dress`  INHERITS (`category`) FROM timbr.`category` WHERE `tag_name` = 'Dress';
CREATE OR REPLACE CONCEPT `beach`  INHERITS (`category`) FROM timbr.`category` WHERE `tag_name` = 'Beach';
CREATE OR REPLACE CONCEPT `bath`  INHERITS (`category`) FROM timbr.`category` WHERE `tag_name` = 'Bath';
CREATE OR REPLACE CONCEPT `low_volume`  INHERITS (`product`) DESCRIPTION 'Products that were sold < 100 times within the timeframe (datasource)';
CREATE OR REPLACE CONCEPT `low_rating_product`  INHERITS (`product`) DESCRIPTION 'Information about product with lower rating than average (3.820)';
CREATE OR REPLACE CONCEPT `high_volume`  INHERITS (`product`) DESCRIPTION 'Products that were sold over 1,000 times within the timeframe (datasource)';
CREATE OR REPLACE CONCEPT `high_rating_product`  INHERITS (`product`) DESCRIPTION 'Information about product with higher rating than average (3.820)';
CREATE OR REPLACE CONCEPT `us_merchant`  INHERITS (`merchant`) FROM timbr.`merchant` WHERE `origin_country` = 'US';
CREATE OR REPLACE CONCEPT `sg_merchant`  INHERITS (`merchant`) FROM timbr.`merchant` WHERE `origin_country` = 'SG';
CREATE OR REPLACE CONCEPT `low_rating`  INHERITS (`merchant`) FROM timbr.`merchant` WHERE `merchant_rating` < 4.032345119305161;
CREATE OR REPLACE CONCEPT `high_rating`  INHERITS (`merchant`) FROM timbr.`merchant` WHERE `merchant_rating` > 4.032345119305161;
CREATE OR REPLACE CONCEPT `gb_merchant`  INHERITS (`merchant`) FROM timbr.`merchant` WHERE `origin_country` = 'GB';
CREATE OR REPLACE CONCEPT `china_merchant`  INHERITS (`merchant`) FROM timbr.`merchant` WHERE `origin_country` = 'CN';