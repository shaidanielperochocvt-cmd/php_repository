-- =====================================================
-- Russian Grocery Items Database (MySQL 8.0+)
-- Country: Russia
-- Table: grocery_items (9 columns, 100 records)
-- =====================================================

CREATE DATABASE IF NOT EXISTS russian_grocery_db;
USE russian_grocery_db;

DROP TABLE IF EXISTS grocery_items;

CREATE TABLE grocery_items (
    item_id         INT             NOT NULL AUTO_INCREMENT,
    item_name       VARCHAR(100)    NOT NULL,
    brand_name      VARCHAR(60)     NOT NULL,
    category        VARCHAR(30)     NOT NULL,
    unit_size       VARCHAR(20)     NOT NULL,
    price_rub       DECIMAL(8,2)    NOT NULL CHECK (price_rub > 0),
    stock_quantity  INT             NOT NULL DEFAULT 0 CHECK (stock_quantity >= 0),
    shelf_life_days INT             NOT NULL CHECK (shelf_life_days > 0),
    created_at      TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (item_id)
);

INSERT INTO grocery_items
    (item_name, brand_name, category, unit_size, price_rub, stock_quantity, shelf_life_days)
VALUES
-- ---------- DAIRY ----------
('Whole Milk 3.4%',              'Prostokvashino',  'Dairy', '930 ml', 109.90, 120, 10),
('Sour Cream 20%',               'Prostokvashino',  'Dairy', '300 g',   99.90,  90, 21),
('Kefir 2.5%',                   'Prostokvashino',  'Dairy', '930 ml',  94.90, 100, 14),
('Butter 82.5%',                 'Prostokvashino',  'Dairy', '180 g',  199.90,  75, 60),
('Pasteurized Milk 3.2%',        'Domik v Derevne', 'Dairy', '950 ml', 112.90, 110, 10),
('Cottage Cheese 5%',            'Domik v Derevne', 'Dairy', '400 g',  129.90,  70, 14),
('Ryazhenka 4%',                 'Domik v Derevne', 'Dairy', '930 ml',  99.90,  60, 14),
('Cream 20%',                    'Domik v Derevne', 'Dairy', '480 ml', 139.90,  40, 21),
('Strawberry Yogurt',            'Chudo',           'Dairy', '290 g',   69.90,  80, 30),
('Chocolate Milk Cocktail',      'Chudo',           'Dairy', '200 ml',  44.90,  95, 180),
('Apple-Banana Fruit Yogurt',    'Agusha',          'Dairy', '90 g',    39.90, 100, 28),
('Kids Cottage Cheese',          'Agusha',          'Dairy', '100 g',   44.90,  85, 21),
('Butter 82.5%',                 'Vkusnoteevo',     'Dairy', '180 g',  189.90,  85, 60),
('Butter 82.5%',                 'Pestravka',       'Dairy', '180 g',  179.90,  70, 60),
('Russian Cheese 50%',           'Ichalki',         'Dairy', '200 g',  169.90,  50, 90),
('Adyghe Cheese',                'Umalat',          'Dairy', '300 g',  159.90,  45, 45),
('Sweetened Condensed Milk',     'Glavprodukt',     'Dairy', '380 g',  109.90, 130, 365),

-- ---------- MEAT & POULTRY ----------
('Chilled Chicken Breast Fillet','Cherkizovo',      'Meat & Poultry', '1 kg',   449.90, 60, 7),
('Whole Chilled Chicken',        'Cherkizovo',      'Meat & Poultry', '1.5 kg', 389.90, 45, 7),
('Chilled Chicken Thighs',       'Petelinka',       'Meat & Poultry', '1 kg',   299.90, 55, 7),
('Chicken Drumsticks',           'Petelinka',       'Meat & Poultry', '1 kg',   279.90, 50, 7),
('Beef Ribeye Steak',            'Miratorg',        'Meat & Poultry', '300 g',  699.90, 30, 10),
('Pork Neck',                    'Miratorg',        'Meat & Poultry', '800 g',  549.90, 35, 10),
('Minced Beef',                  'Miratorg',        'Meat & Poultry', '400 g',  329.90, 40, 7),

-- ---------- PROCESSED MEAT ----------
('Doktorskaya Boiled Sausage',   'Dymov',                      'Processed Meat', '400 g', 269.90, 60, 30),
('Smoked Servelat Sausage',      'Klinsky',                    'Processed Meat', '350 g', 299.90, 40, 60),
('Milk Frankfurters',            'Mikoyan',                    'Processed Meat', '450 g', 219.90, 65, 20),
('Pork Frankfurters',            'Velikoluksky Myasokombinat', 'Processed Meat', '400 g', 199.90, 55, 20),
('Doktorskaya Boiled Sausage',   'Cherkizovo',                 'Processed Meat', '400 g', 249.90, 50, 30),

-- ---------- FROZEN FOODS ----------
('Classic Pelmeni',              'Ostankino',                      'Frozen Foods', '800 g', 349.90, 70, 270),
('Siberian Pelmeni',             'Sibirskaya Torgovaya Kompaniya', 'Frozen Foods', '900 g', 329.90, 65, 270),
('Beef Pelmeni',                 'Talosto',                        'Frozen Foods', '450 g', 289.90, 50, 270),

-- ---------- EGGS ----------
('Chicken Eggs Category C1',     'Sinyavinskie',    'Eggs', '10 pcs', 109.90, 100, 25),

-- ---------- SEAFOOD ----------
('Crab Sticks Surimi',           'Vici',            'Seafood', '200 g',  119.90,  90,  45),
('Salted Herring Fillet',        'Russkoye More',   'Seafood', '300 g',  199.90,  60,  60),
('Salted Salmon Fillet',         'Russkoye More',   'Seafood', '200 g',  449.90,  40,  45),
('Red Salmon Caviar',            'Russkoye More',   'Seafood', '140 g', 1099.90,  25, 180),
('Canned Pink Salmon',           'Dalmoreprodukt',  'Seafood', '245 g',  189.90,  70, 1095),
('Canned Saury in Oil',          'Dalmoreprodukt',  'Seafood', '250 g',   99.90, 100, 1095),
('Cod Liver in Oil',             'Russkoye More',   'Seafood', '230 g',  229.90,  60, 1095),

-- ---------- GRAINS, PASTA & FLOUR ----------
('Spaghetti No. 9',              'Makfa',           'Grains & Pasta', '450 g',  79.90, 140, 730),
('Penne Rigate',                 'Makfa',           'Grains & Pasta', '450 g',  79.90, 120, 730),
('Vermicelli',                   'Makfa',           'Grains & Pasta', '450 g',  69.90,  90, 730),
('Premium Wheat Flour',          'Makfa',           'Grains & Pasta', '2 kg',  129.90,  80, 365),
('Premium Wheat Flour',          'Pudov',           'Grains & Pasta', '2 kg',  139.90,  70, 365),
('Long Grain Rice',              'Uvelka',          'Grains & Pasta', '800 g', 119.90, 100, 730),
('Buckwheat',                    'Uvelka',          'Grains & Pasta', '800 g', 129.90, 110, 730),
('Buckwheat',                    'Mistral',         'Grains & Pasta', '900 g', 139.90,  95, 730),
('Pearl Barley',                 'Mistral',         'Grains & Pasta', '800 g',  69.90,  60, 730),
('Rolled Oats',                  'Mistral',         'Grains & Pasta', '500 g',  59.90,  85, 365),
('Millet',                       'Mistral',         'Grains & Pasta', '800 g',  74.90,  55, 730),
('Basmati Rice',                 'National',        'Grains & Pasta', '900 g', 189.90,  65, 730),
('Krasnodar Rice',               'Agro-Alliance',   'Grains & Pasta', '900 g', 109.90,  70, 730),
('Granulated Sugar',             'Russkiy Sakhar',  'Grains & Pasta', '1 kg',   79.90, 300, 1095),

-- ---------- INSTANT FOODS ----------
('Beef Flavor Instant Noodles',    'Rollton',       'Instant Foods', '60 g',  24.90, 200, 365),
('Chicken Flavor Instant Noodles', 'Big Bon',       'Instant Foods', '75 g',  34.90, 160, 365),

-- ---------- BAKERY ----------
('Borodinsky Rye Bread',         'Tsaritsyno',      'Bakery', '400 g', 59.90, 60, 5),
('Sliced Wheat Loaf',            'Khlebny Dom',     'Bakery', '400 g', 49.90, 65, 5),

-- ---------- BABY FOOD ----------
('Apple Puree',                  'Frutonyanya',     'Baby Food', '90 g',  39.90, 90, 540),
('Beef Puree',                   'Tyoma',           'Baby Food', '100 g', 59.90, 70, 540),

-- ---------- PANTRY: OIL, SALT, SAUCES ----------
('Table Salt',                   'Baskunchak',      'Pantry', '1 kg',   29.90, 200, 1825),
('Refined Sunflower Oil',        'Zolotaya Semechka','Pantry', '1 L',  139.90, 120, 365),
('Refined Sunflower Oil',        'Oleina',          'Pantry', '1 L',   134.90, 110, 365),
('Refined Sunflower Oil',        'Sloboda',         'Pantry', '1 L',   129.90, 100, 365),
('Mayonnaise Provansal 67%',     'Sloboda',         'Pantry', '400 ml', 89.90, 100, 180),
('Mayonnaise Provansal',         'Mr. Ricco',       'Pantry', '400 ml', 94.90,  90, 180),
('Classic Mayonnaise',           'Ryaba',           'Pantry', '372 g',  79.90,  95, 180),
('Tomato Ketchup',               'Pudov',           'Pantry', '350 g',  99.90,  85, 365),
('Tomato Ketchup',               'Baltimor',        'Pantry', '300 g',  89.90,  70, 365),

-- ---------- SWEETS & SNACKS ----------
('Alyonka Milk Chocolate Bar',   'Krasny Oktyabr',  'Sweets & Snacks', '90 g',  99.90, 150, 365),
('Mishka Kosolapy Candies',      'Krasny Oktyabr',  'Sweets & Snacks', '250 g', 229.90,  80, 270),
('Dark Chocolate Bar',           'Rot Front',       'Sweets & Snacks', '90 g',  94.90, 100, 365),
('Milk Chocolate with Hazelnuts','Babaevsky',       'Sweets & Snacks', '90 g',  89.90, 110, 365),
('Dark Chocolate 55%',           'Babaevsky',       'Sweets & Snacks', '100 g', 89.90, 105, 365),
('Assorted Chocolate Candies',   'Slavyanka',       'Sweets & Snacks', '220 g', 199.90, 60, 270),
('Dark Chocolate Bar',           'Korkunov',        'Sweets & Snacks', '90 g', 119.90,  75, 365),
('Sugar Cookies',                'Yashkino',        'Sweets & Snacks', '200 g',  59.90, 120, 180),
('Butter Biscuits',              'Bolshevik',       'Sweets & Snacks', '250 g',  79.90,  90, 180),
('Apple Pastila',                'Belevskaya Pastila','Sweets & Snacks', '150 g', 189.90, 50, 120),
('Rye Croutons Beef Flavor',     'Kirieshki',       'Sweets & Snacks', '40 g',   29.90, 250, 180),
('Potato Chips Sour Cream & Onion','Khrusteam',     'Sweets & Snacks', '90 g',   79.90, 140, 120),

-- ---------- BEVERAGES ----------
('Tarkhun Soda',                 'Chernogolovka',   'Beverages', '1 L',     79.90, 130, 270),
('Buratino Soda',                'Chernogolovka',   'Beverages', '1 L',     79.90, 125, 270),
('Baikal Herbal Soda',           'Chernogolovka',   'Beverages', '0.5 L',   64.90, 110, 270),
('Cola',                         'Dobry',           'Beverages', '1 L',     89.90, 150, 270),
('Orange Soda',                  'Dobry',           'Beverages', '1 L',     89.90, 140, 270),
('Orange Juice',                 'Rich',            'Beverages', '1 L',    119.90,  90, 365),
('Apple Juice',                  'J7',              'Beverages', '970 ml', 109.90,  85, 365),
('Cherry Juice',                 'Lyubimy Sad',     'Beverages', '0.95 L', 109.90,  80, 365),
('Apple Juice',                  'Sady Pridonya',   'Beverages', '1 L',     99.90,  95, 365),
('Multifruit Nectar',            'Fruktovy Sad',    'Beverages', '0.95 L',  94.90,  85, 365),
('Bread Kvass',                  'Nikola',          'Beverages', '1.5 L',   74.90, 100, 90),
('Mineral Water No. 17',         'Essentuki',       'Beverages', '1.5 L',  109.90,  75, 730),
('Mineral Water',                'Narzan',          'Beverages', '0.5 L',   59.90,  90, 730),
('Spring Water',                 'Svyatoy Istochnik','Beverages', '1.5 L',  54.90, 160, 730),
('Golden Ceylon Black Tea',      'Greenfield',      'Beverages', '25 bags', 149.90, 120, 730),
('Earl Grey Fantasy Black Tea',  'Greenfield',      'Beverages', '25 bags', 149.90, 100, 730),
('Black Tea',                    'Princess Nuri',   'Beverages', '25 bags', 129.90,  95, 730),
('Colombia Medellin Coffee Beans','Jardin',         'Beverages', '250 g',   449.90,  55, 365),
('Instant Coffee',               'Moskovskaya Kofeynya na Paiakh','Beverages', '95 g', 279.90, 65, 540);

-- Quick check: should return 100
SELECT COUNT(*) AS total_rows FROM grocery_items;
