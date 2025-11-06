# How to Change Item Images

## Problem with Google Image URLs
Google image URLs (like `https://www.google.com/imgres?q=...`) are redirect links and **DO NOT work directly** in `<img>` tags. You need to use **direct image URLs**.

## Methods to Get Direct Image URLs

### Method 1: Extract from Google URL (if available)
If you have a Google image URL, look for the `imgurl` parameter:
```
https://www.google.com/imgres?q=chicken%20curry&imgurl=https%3A%2F%2Fwww.whiskaffair.com%2Fwp-content%2Fuploads%2F2021%2F10%2FAndhra-Chicken-Curry-2-3.jpg
```
The actual image URL is: `https://www.whiskaffair.com/wp-content/uploads/2021/10/Andhra-Chicken-Curry-2-3.jpg`

### Method 2: Use Unsplash (Recommended)
Unsplash provides free, high-quality images:
```
https://images.unsplash.com/photo-[PHOTO_ID]?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80
```

Search for images at: https://unsplash.com/s/photos/[item-name]

### Method 3: Use Direct Image URLs
- Right-click on an image → "Copy image address"
- Make sure the URL ends with `.jpg`, `.jpeg`, `.png`, `.webp`, etc.
- Example: `https://example.com/image.jpg`

## How to Update Images in Database

### Option 1: Update via SQL Script
Create a file `update_images.sql`:

```sql
USE cafe_akasa;

-- Update individual items
UPDATE items SET image_url = 'https://images.unsplash.com/photo-1605027990121-47593b304e33?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80' WHERE name = 'Mango';

UPDATE items SET image_url = 'https://www.whiskaffair.com/wp-content/uploads/2021/10/Andhra-Chicken-Curry-2-3.jpg' WHERE name = 'Chicken Curry';

-- Add more UPDATE statements as needed
```

Then run:
```bash
mysql -u your_username -p < update_images.sql
```

### Option 2: Update via MySQL Command Line
```bash
mysql -u your_username -p cafe_akasa
```

Then run:
```sql
UPDATE items SET image_url = 'YOUR_DIRECT_IMAGE_URL' WHERE name = 'Item Name';
```

### Option 3: Update schema.sql and Re-run
1. Edit `Backend/database/schema.sql`
2. Replace the image URLs with direct URLs
3. Re-run the schema (WARNING: This will recreate the database and lose existing data)

## Quick Fix: Replace All Google URLs

Run this SQL to replace all Google URLs with Unsplash fallbacks:

```sql
USE cafe_akasa;

-- Update items with Google URLs to use Unsplash
UPDATE items SET image_url = CONCAT('https://source.unsplash.com/800x600/?', REPLACE(name, ' ', '%20')) 
WHERE image_url LIKE '%google.com%';
```

## Testing Image URLs
Before updating the database, test your image URL:
1. Open the URL directly in a browser
2. The image should display (not redirect to another page)
3. The URL should end with an image extension or be from a trusted image service

