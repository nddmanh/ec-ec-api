CREATE TABLE `users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `email` varchar(255) UNIQUE,
  `user_type_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active` TINYINT(1) NOT NULL
);

CREATE TABLE `user_types` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `desc` varchar(255) NOT NULL
);

CREATE TABLE `product_template` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sequence` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` int NOT NULL,
  `quantity` int NOT NULL,
  `saleable` TINYINT(1) NOT NULL,
  `active` TINYINT(1) NOT NULL,
  `allow_negative_stock` TINYINT(1) NOT NULL,
  `note` varchar(255) NOT NULL
);

CREATE TABLE `product_categories` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `parent_path` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
);

CREATE TABLE `product_attribute` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
);

CREATE TABLE `product_template_attribute` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `product_template_id` int NOT NULL,
  `product_attribute_id` int NOT NULL
);

CREATE TABLE `product_variant` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `product_template_id` int NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` TINYINT(1) NOT NULL,
  `quantity` int NOT NULL,
  `price` DECIMAL(10, 2) NOT NULL,
  `display` varchar(255) NOT NULL,
  `display_technology` varchar(255) NOT NULL,
  `screen_resolution` varchar(255) NOT NULL,
  `scan_frequency` varchar(255) NOT NULL,
  `rear_camera` varchar(255) NOT NULL,
  `video_rear_camera` varchar(255) NOT NULL,
  `front_camera` varchar(255) NOT NULL,
  `video_front_camera` varchar(255) NOT NULL,
  `chipset` varchar(255) NOT NULL,
  `cpu` varchar(255) NOT NULL,
  `jack3.5` TINYINT(1) NOT NULL,
  `gpu` varchar(255) NOT NULL,
  `ram` varchar(255) NOT NULL,
  `rom` varchar(255) NOT NULL,
  `pin` varchar(255) NOT NULL,
  `os` varchar(255) NOT NULL,
  `bluetooth` varchar(255) NOT NULL,
  `wifi` varchar(255) NOT NULL,
  `gps` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `weight` varchar(255) NOT NULL,
  `charging_technology` varchar(255) NOT NULL,
  `charging_port` varchar(255) NOT NULL
);

CREATE TABLE `images` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `review_id` int DEFAULT NULL,
  `product_template_id` int DEFAULT NULL,
  `url` varchar(255) NOT NULL
);

CREATE TABLE `reviews` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `star` int NOT NULL,
  `review` varchar(255) NOT NULL
);

CREATE TABLE `orders` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `cart_id` int NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `origin` varchar(255) NOT NULL,
  `state` int NOT NULL,
  `date_order` datetime NOT NULL,
  `date_confirm` datetime NOT NULL,
  `note` varchar(255) NOT NULL,
  `amount_total` DECIMAL(10, 2) NOT NULL,
  `amount_tax` DECIMAL(10, 2) NOT NULL,
  `amount_untaxed` DECIMAL(10, 2) NOT NULL,
  `delivery_address` varchar(255) NOT NULL
);

CREATE TABLE `order_lines` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price_unit` DECIMAL(10, 2) NOT NULL,
  `price_subtotal` DECIMAL(10, 2) NOT NULL,
  `price_tax` DECIMAL(10, 2) NOT NULL,
  `price_total` DECIMAL(10, 2) NOT NULL,
  `discount` DECIMAL(10, 2) NOT NULL,
  `product_quantity` int NOT NULL
);

CREATE TABLE `carts` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `info_receive` varchar(255) NOT NULL,
  `state` int NOT NULL,
  `date_order` datetime NOT NULL,
  `amount_total` DECIMAL(10, 2) NOT NULL
);

CREATE TABLE `cart_lines` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `cart_id` int NOT NULL,
  `product_id` int NOT NULL
);


ALTER TABLE `users` ADD FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`id`);

ALTER TABLE `product_template` ADD FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`);

ALTER TABLE `product_template_attribute` ADD FOREIGN KEY (`product_template_id`) REFERENCES `product_template` (`id`);
ALTER TABLE `product_template_attribute` ADD FOREIGN KEY (`product_attribute_id`) REFERENCES `product_attribute` (`id`);

ALTER TABLE `product_variant` ADD FOREIGN KEY (`product_template_id`) REFERENCES `product_template` (`id`);

ALTER TABLE `images` ADD FOREIGN KEY (`product_id`) REFERENCES `product_variant` (`id`);
ALTER TABLE `images` ADD FOREIGN KEY (`product_template_id`) REFERENCES `product_template` (`id`);
ALTER TABLE `images` ADD FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`);

ALTER TABLE `orders` ADD FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`);
ALTER TABLE `orders` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `order_lines` ADD FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);
ALTER TABLE `order_lines` ADD FOREIGN KEY (`product_id`) REFERENCES `product_variant` (`id`);

ALTER TABLE `cart_lines` ADD FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`);
ALTER TABLE `cart_lines` ADD FOREIGN KEY (`product_id`) REFERENCES `product_variant` (`id`);
