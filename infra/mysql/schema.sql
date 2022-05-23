CREATE TABLE `users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `email` varchar(255) UNIQUE,
  `user_type_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `desc` text NOT NULL
);

CREATE TABLE `user_types` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `desc` varchar(255) NOT NULL
);

CREATE TABLE `products` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `note` text
);

ALTER TABLE `users` ADD FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`id`);
