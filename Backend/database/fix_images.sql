-- Fix Image URLs in Database
-- This script extracts direct image URLs from Google URLs and replaces them with working URLs

USE cafe_akasa;

-- Update Mango (use Unsplash)
UPDATE items SET image_url = 'https://images.unsplash.com/photo-1605027990121-47593b304e33?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80' WHERE name = 'Mango';

-- Update Chicken Curry (extract direct URL from Google link)
UPDATE items SET image_url = 'https://www.whiskaffair.com/wp-content/uploads/2021/10/Andhra-Chicken-Curry-2-3.jpg' WHERE name = 'Chicken Curry';

-- Update Fish Fry (extract direct URL from Google link)
UPDATE items SET image_url = 'https://www.yummytummyaarthi.com/wp-content/uploads/2022/02/fish-fry-1.jpeg' WHERE name = 'Fish Fry';

-- Update Egg Curry (use Unsplash)
UPDATE items SET image_url = 'https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80' WHERE name = 'Egg Curry';

-- Update Mutton Biryani (use Unsplash)
UPDATE items SET image_url = 'https://images.unsplash.com/photo-1563379091339-03246963d96c?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80' WHERE name = 'Mutton Biryani';

-- Update White Bread (use Unsplash)
UPDATE items SET image_url = 'https://images.unsplash.com/photo-1509440159596-0249088772ff?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80' WHERE name = 'White Bread';

-- Update Brown Bread (use Unsplash)
UPDATE items SET image_url = 'https://images.unsplash.com/photo-1586444248902-2f64eddc13df?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80' WHERE name = 'Brown Bread';

-- Update Garlic Bread (use Unsplash)
UPDATE items SET image_url = 'https://images.unsplash.com/photo-1573140247632-f8fd74997d5c?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80' WHERE name = 'Garlic Bread';

