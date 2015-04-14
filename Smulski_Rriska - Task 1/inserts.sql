INSERT INTO agecategories(agecategory_id,agecategory_value) VALUES (1, 18);
INSERT INTO agecategories(agecategory_id,agecategory_value) VALUES (2, 16);
INSERT INTO agecategories(agecategory_id,agecategory_value) VALUES (3, 12);

INSERT INTO platforms (platform_id, name) VALUES (1, 'PC');
INSERT INTO platforms (platform_id, name) VALUES (2, 'PS3');
INSERT INTO platforms (platform_id, name) VALUES (3, 'XBOX360');

INSERT INTO genres (genre_id, name) VALUES (1, 'SHOOTER');
INSERT INTO genres (genre_id, name) VALUES (2, 'RACING');
INSERT INTO genres (genre_id, name) VALUES (3, 'ARCADE');

INSERT INTO producers (producer_id, name, country) VALUES (1, 'UBISOFT', 'Canada');
INSERT INTO producers (producer_id, name, country) VALUES (2, 'BioWare', 'USA');
INSERT INTO producers (producer_id, name, country) VALUES (3, 'Electronic Arts', 'USA');

INSERT INTO customers(customer_id, name, surname, gender, email, birth_date) VALUES (1, 'Jan', 'Nowak', 'male', 'jn@gmail.com', '2-mar-1970');
INSERT INTO customers(customer_id, name, surname, gender, email, birth_date) VALUES (2, 'Adam', 'Kowalski', 'male', 'ak@gmail.com', '2-mar-1999');
INSERT INTO customers(customer_id, name, surname, gender, email, birth_date) VALUES (3, 'Anna', 'Zet', 'female', 'az@onet.pl', '2-mar-2012');

INSERT INTO orders (order_id, order_date, customer_id) VALUES (1, '10-feb-2014', 1);
INSERT INTO orders (order_id, order_date, customer_id) VALUES (2, '14-feb-2014', 1);
INSERT INTO orders (order_id, order_date, customer_id) VALUES (3, '20-feb-2014', 1);
INSERT INTO orders (order_id, order_date, customer_id) VALUES (4, '1-may-2014', 1);
INSERT INTO orders (order_id, order_date, customer_id) VALUES (5, '3-may-2014', 1);
INSERT INTO orders (order_id, order_date, customer_id) VALUES (6, '7-jun-2014', 1);
INSERT INTO orders (order_id, order_date, customer_id) VALUES (7, '8-jun-2014', 1);
INSERT INTO orders (order_id, order_date, customer_id) VALUES (8, '9-jul-2014', 1);
INSERT INTO orders (order_id, order_date, customer_id) VALUES (9, '9-jul-2014', 1);
INSERT INTO orders (order_id, order_date, customer_id) VALUES (10, '24-feb-2014', 1);
INSERT INTO orders (order_id, order_date, customer_id) VALUES (11, '24-feb-2014', 2);
INSERT INTO orders (order_id, order_date, customer_id) VALUES (12, '24-feb-2014', 2);

INSERT INTO games (game_id, name, price, agecategory_id, producer_id, genre_id, platform_id, order_id) VALUES (1, 'Mass Effect', 60, 1, 2, 1, 1, 1);
INSERT INTO games (game_id, name, price, agecategory_id, producer_id, genre_id, platform_id, order_id) VALUES (2, 'Mass Effect', 60, 1, 2, 1, 1, 2);
INSERT INTO games (game_id, name, price, agecategory_id, producer_id, genre_id, platform_id, order_id) VALUES (3, 'Mass Effect', 60, 1, 2, 1, 1, 3);
INSERT INTO games (game_id, name, price, agecategory_id, producer_id, genre_id, platform_id, order_id) VALUES (4, 'Assasins Creed 2', 80, 1, 1, 3, 1, 4);
INSERT INTO games (game_id, name, price, agecategory_id, producer_id, genre_id, platform_id, order_id) VALUES (5, 'Assasins Creed 2', 80, 1, 1, 3, 2, 5);
INSERT INTO games (game_id, name, price, agecategory_id, producer_id, genre_id, platform_id, order_id) VALUES (6, 'Assasins Creed 2', 80, 1, 1, 3, 3, 6);
INSERT INTO games (game_id, name, price, agecategory_id, producer_id, genre_id, platform_id, order_id) VALUES (7, 'Need for Speed', 40, 3, 3, 2, 1, 7);
INSERT INTO games (game_id, name, price, agecategory_id, producer_id, genre_id, platform_id, order_id) VALUES (8, 'Need for Speed', 40, 3, 3, 2, 1, 8);
INSERT INTO games (game_id, name, price, agecategory_id, producer_id, genre_id, platform_id, order_id) VALUES (9, 'Need for Speed', 40, 3, 3, 2, 1, 9);
INSERT INTO games (game_id, name, price, agecategory_id, producer_id, genre_id, platform_id, order_id) VALUES (10, 'Need for Speed', 40, 3, 3, 2, 1, 10);
INSERT INTO games (game_id, name, price, agecategory_id, producer_id, genre_id, platform_id, order_id) VALUES (11, 'Need for Speed', 40, 3, 3, 2, 1, 11);
INSERT INTO games (game_id, name, price, agecategory_id, producer_id, genre_id, platform_id, order_id) VALUES (12, 'Need for Speed 2', 40, 3, 3, 2, 1, 12);
INSERT INTO games (game_id, name, price, agecategory_id, producer_id, genre_id, platform_id, order_id) VALUES (13, 'Need for Speed 2', 40, 3, 3, 2, 2, 12);
INSERT INTO games (game_id, name, price, agecategory_id, producer_id, genre_id, platform_id, order_id) VALUES (14, 'Need for Speed 2', 40, 3, 3, 2, 2, 12);