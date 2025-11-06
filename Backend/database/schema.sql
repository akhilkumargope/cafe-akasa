-- Cafe Akasa Database Schema
-- MySQL Database Setup

CREATE DATABASE IF NOT EXISTS cafe_akasa;
USE cafe_akasa;

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Categories table
CREATE TABLE IF NOT EXISTS categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Items table
CREATE TABLE IF NOT EXISTS items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    category_id INT NOT NULL,
    image_url VARCHAR(500),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
);

-- Cart items table
CREATE TABLE IF NOT EXISTS cart_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE,
    UNIQUE KEY unique_user_item (user_id, item_id)
);

-- Orders table
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'Pending',
    tracking_id VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Order items table
CREATE TABLE IF NOT EXISTS order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE
);

-- Insert sample categories
INSERT INTO categories (name) VALUES
('All'),
('Fruit'),
('Vegetable'),
('Non-veg'),
('Breads'),
('Beverages'),
('Snacks')
ON DUPLICATE KEY UPDATE name=name;

-- Insert sample items
INSERT INTO items (name, description, price, stock, category_id, image_url) VALUES
-- Fruits
('Apple', 'Fresh red apples', 50.00, 100, 2, 'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'),
('Banana', 'Sweet yellow bananas', 40.00, 150, 2, 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'),
('Orange', 'Juicy oranges', 60.00, 80, 2, 'https://images.unsplash.com/photo-1580052614034-c55d20bfee3b?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'),
('Mango', 'Seasonal mangoes', 80.00, 50, 2, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.jiomart.com%2Fp%2Fgroceries%2Fraw-mango-1-kg%2F590000191&psig=AOvVaw3vQyqI4wm6qYpfvy-e1O5J&ust=1762538474983000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCOCM5dKN3pADFQAAAAAdAAAAABAT'),

-- Vegetables
('Tomato', 'Fresh red tomatoes', 30.00, 200, 3, 'https://images.unsplash.com/photo-1546098337-9e0e8988ffbd?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'),
('Potato', 'Fresh potatoes', 25.00, 300, 3, 'https://images.unsplash.com/photo-1518977822534-7049a61ee0c2?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'),
('Onion', 'Fresh onions', 35.00, 250, 3, 'https://images.unsplash.com/photo-1610194352361-4c81a6a896e8?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'),
('Carrot', 'Fresh carrots', 40.00, 180, 3, 'https://images.unsplash.com/photo-1445282768818-728615cc910a?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'),

-- Non-veg
('Chicken Curry', 'Spicy chicken curry', 200.00, 30, 4, 'https://www.google.com/imgres?q=chicken%20curry&imgurl=https%3A%2F%2Fwww.whiskaffair.com%2Fwp-content%2Fuploads%2F2021%2F10%2FAndhra-Chicken-Curry-2-3.jpg&imgrefurl=https%3A%2F%2Fwww.whiskaffair.com%2Fandhra-chicken-curry-recipe%2F&docid=Gf3BHFGFf4736M&tbnid=0R1GgfpoZPcIAM&vet=12ahUKEwjR9qe3j96QAxWUTGwGHUepOOwQM3oECBoQAA..i&w=1200&h=1200&hcb=2&ved=2ahUKEwjR9qe3j96QAxWUTGwGHUepOOwQM3oECBoQAA'),
('Fish Fry', 'Crispy fish fry', 250.00, 25, 4, 'https://www.google.com/imgres?q=fish%20fry&imgurl=https%3A%2F%2Fwww.yummytummyaarthi.com%2Fwp-content%2Fuploads%2F2022%2F02%2Ffish-fry-1.jpeg&imgrefurl=https%3A%2F%2Fwww.yummytummyaarthi.com%2Ftawa-fish-fry-recipe%2F&docid=W6ZVu1FjwgWceM&tbnid=G-C5aUXI-pAc0M&vet=12ahUKEwjEsozCj96QAxUUV3ADHSMuOowQM3oECBQQAA..i&w=768&h=512&hcb=2&ved=2ahUKEwjEsozCj96QAxUUV3ADHSMuOowQM3oECBQQAA'),
('Egg Curry', 'Delicious egg curry', 120.00, 40, 4, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.slurrp.com%2Frecipes%2Fkerala-egg-curry-recipe-1617380104&psig=AOvVaw28pHUo1DG7wBxrYEt1W5yX&ust=1762539004575000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCNiPzs-P3pADFQAAAAAdAAAAABAE0'),
('Mutton Biryani', 'Flavorful mutton biryani', 350.00, 20, 4, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.licious.in%2Fblog%2Frecipe%2Fmughlai-mutton-biryani-recipe%3Fsrsltid%3DAfmBOoo40p0Pl5XjTHObWVhvq7U_jwsk8hPLprP13mKcVHYOeYOvwZxc&psig=AOvVaw0iBCK8wStU78MF7x5EGtMO&ust=1762539025608000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCLjeu9eP3pADFQAAAAAdAAAAABAK'),

-- Breads
('White Bread', 'Fresh white bread', 30.00, 100, 5, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.foodandwine.com%2Frecipes%2Fperfect-sandwich-bread&psig=AOvVaw3sgpy5ZrYUj708NugpiKm6&ust=1762539048325000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCJCjwOKP3pADFQAAAAAdAAAAABAK'),
('Brown Bread', 'Healthy brown bread', 40.00, 80, 5, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.tasteofhome.com%2Frecipes%2Fold-fashioned-brown-bread%2F&psig=AOvVaw0GuCbN54sPLbh4b--PJFG4&ust=1762539069913000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCMjdwOyP3pADFQAAAAAdAAAAABAK'),
('Garlic Bread', 'Tasty garlic bread', 60.00, 50, 5, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.locatelli.com%2Frecipes%2Fappetizers%2Fcheesy-garlic-bread%2F&psig=AOvVaw0iLG2fpH4kVkPF_QcdfN_b&ust=1762539091945000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCLDP0_aP3pADFQAAAAAdAAAAABAJ'),
('Naan', 'Soft naan bread', 25.00, 120, 5, 'https://images.unsplash.com/photo-1601050690597-df0568f70950?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'),

-- Beverages
('Coffee', 'Hot coffee', 50.00, 200, 6, 'https://images.unsplash.com/photo-1511920170033-f8396924c348?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'),
('Tea', 'Hot tea', 30.00, 250, 6, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'),
('Orange Juice', 'Fresh orange juice', 60.00, 100, 6, 'https://images.unsplash.com/photo-1600271886742-f049cd451bba?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'),
('Mango Shake', 'Cold mango shake', 80.00, 80, 6, 'https://images.unsplash.com/photo-1600271886742-f049cd451bba?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'),

-- Snacks
('Samosa', 'Crispy samosa', 20.00, 150, 7, 'https://images.unsplash.com/photo-1601050690597-df0568f70950?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'),
('Pakora', 'Spicy pakora', 40.00, 100, 7, 'https://images.unsplash.com/photo-1601050690597-df0568f70950?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'),
('Chips', 'Potato chips', 30.00, 200, 7, 'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'),
('Biscuits', 'Sweet biscuits', 50.00, 180, 7, 'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80')
ON DUPLICATE KEY UPDATE name=name;

