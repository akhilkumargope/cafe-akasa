# How to Run SQL Scripts

## Method 1: Using Command Prompt / PowerShell (Windows)

### Step 1: Open Command Prompt or PowerShell
- Press `Windows + R`
- Type `cmd` or `powershell`
- Press Enter

### Step 2: Navigate to Your Project Directory
```bash
cd "C:\Users\Akhil\OneDrive\Documents\Cafe Akasa"
```

### Step 3: Run the MySQL Command
```bash
mysql -u root -p < Backend\database\fix_images.sql
```

**Note:** 
- Replace `root` with your MySQL username if different
- You'll be prompted to enter your MySQL password
- Use backslashes `\` for Windows paths

### Alternative: If MySQL is not in PATH
If you get "mysql is not recognized", use the full path:
```bash
"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -u root -p < Backend\database\fix_images.sql
```

Or add MySQL to your PATH:
1. Find MySQL installation (usually `C:\Program Files\MySQL\MySQL Server 8.0\bin`)
2. Add it to Windows PATH environment variable

## Method 2: Using MySQL Command Line Directly

### Step 1: Open MySQL Command Line
- Search for "MySQL Command Line Client" in Windows Start Menu
- Enter your password when prompted

### Step 2: Select Database
```sql
USE cafe_akasa;
```

### Step 3: Copy and Paste SQL Commands
Open `Backend/database/fix_images.sql` in a text editor, copy all the SQL commands, and paste them into MySQL command line.

## Method 3: Using MySQL Workbench (GUI - Easiest)

### Step 1: Open MySQL Workbench
- Search for "MySQL Workbench" in Windows Start Menu
- Connect to your MySQL server

### Step 2: Open SQL Script
- Click `File` → `Open SQL Script`
- Navigate to: `C:\Users\Akhil\OneDrive\Documents\Cafe Akasa\Backend\database\fix_images.sql`
- Click Open

### Step 3: Select Database
- In the SQL editor, make sure you're connected to the right server
- Run this first: `USE cafe_akasa;`

### Step 4: Execute Script
- Click the lightning bolt icon (⚡) or press `Ctrl + Shift + Enter`
- All SQL commands will execute

## Method 4: Manual Update via MySQL Workbench

### Step 1: Open MySQL Workbench
- Connect to your database

### Step 2: Select Database
- In the left sidebar, double-click `cafe_akasa` database

### Step 3: Open SQL Editor
- Click `File` → `New Query Tab` or press `Ctrl + T`

### Step 4: Run Individual Updates
Copy and paste each UPDATE statement from `fix_images.sql` one by one:

```sql
USE cafe_akasa;

UPDATE items SET image_url = 'https://images.unsplash.com/photo-1605027990121-47593b304e33?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80' WHERE name = 'Mango';
```

Click the execute button (⚡) after each statement.

## Troubleshooting

### "mysql is not recognized"
- MySQL is not in your PATH
- Use full path to mysql.exe (see Method 1)
- Or use MySQL Workbench instead

### "Access denied"
- Check your MySQL username and password
- Default username is usually `root`
- If you forgot password, you may need to reset it

### "Database doesn't exist"
- First run the main schema.sql to create the database:
```bash
mysql -u root -p < Backend\database\schema.sql
```

### "Table doesn't exist"
- Make sure you've run the schema.sql first
- Check that you're using the correct database: `USE cafe_akasa;`

## Quick Test After Running

After running the fix script, verify the images are updated:

```sql
USE cafe_akasa;
SELECT name, image_url FROM items WHERE name IN ('Mango', 'Chicken Curry', 'Fish Fry');
```

You should see direct image URLs (not Google URLs).

