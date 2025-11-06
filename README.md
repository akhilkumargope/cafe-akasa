

# Cafe Akasa - Food Ordering Platform

A full-stack food ordering platform built with React for the frontend and Express/Node.js for the backend, using MySQL as the database.

## Features

- User Authentication: JWT-based authentication system
- Product Browsing: Browse items by category (Fruit, Vegetable, Non-veg, Breads, Beverages, Snacks)
- Shopping Cart: Persistent cart that syncs across devices
- Order Management: Place orders with real-time inventory validation
- Order Tracking: Unique tracking IDs for each order
- Order History: View past orders with detailed information

## Tech Stack

Backend:
- Node.js, Express.js
- MySQL
- JWT, bcryptjs

Frontend:
- React 18.2.0
- React Router DOM
- Axios

## Prerequisites

You'll need:
- Node.js (v14 or higher)
- MySQL (v5.7 or higher)
- npm

## Quick Start

### 1. Database Setup

First, set up the database. Run this command:

```bash
mysql -u root -p < Backend/database/schema.sql
```

Enter your MySQL password when prompted.

### 2. Backend Setup

Navigate to the Backend directory and install dependencies:

```bash
cd Backend
npm install
```

Create a `.env` file in the Backend directory with these variables:

```env
PORT=5000
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_mysql_password_here
DB_NAME=cafe_akasa
JWT_SECRET=your_secret_key_here_change_in_production
NODE_ENV=development
```

Replace `your_mysql_password_here` with your actual MySQL password, and `your_secret_key_here_change_in_production` with a random string.

Start the backend server:

```bash
npm start
```

The backend will run on http://localhost:5000

### 3. Frontend Setup

Open a new terminal and navigate to the Frontend directory:

```bash
cd Frontend
npm install
```

Create a `.env` file in the Frontend directory:

```env
REACT_APP_API_URL=http://localhost:5000/api
```

Start the frontend development server:

```bash
npm start
```

The frontend will run on http://localhost:3000 and should open automatically in your browser.

## API Endpoints

### Authentication
- POST /api/auth/register - Register a new user
- POST /api/auth/login - Login user

### Items
- GET /api/items/categories - Get all categories
- GET /api/items - Get all items
- GET /api/items?category=:categoryId - Get items by category

### Cart (Protected)
- GET /api/cart - Get user's cart
- POST /api/cart - Add item to cart
- PUT /api/cart/:itemId - Update cart item quantity
- DELETE /api/cart/:itemId - Remove item from cart

### Orders (Protected)
- POST /api/orders/checkout - Place order
- GET /api/orders - Get order history
- GET /api/orders/:orderId - Get order details

## Database Schema

The database has 6 main tables:
- users: User accounts
- categories: Food categories
- items: Food items with price and stock
- cart_items: User's shopping cart
- orders: Order records with tracking IDs
- order_items: Items in each order

## Usage

Here's how to use the app:
1. Register or login to create an account
2. Browse items by category
3. Add items to cart
4. Manage cart (update quantities, remove items)
5. Checkout to place order
6. View order history

## Project Structure

```
Cafe Akasa/
├── Backend/
│   ├── src/
│   │   ├── config/          # Database configuration
│   │   ├── controllers/      # Business logic
│   │   ├── middleware/       # Auth middleware
│   │   ├── routes/           # API routes
│   │   └── server.js         # Express server
│   ├── database/
│   │   └── schema.sql        # Database schema
│   └── package.json
├── Frontend/
│   ├── src/
│   │   ├── components/       # Reusable components
│   │   ├── pages/            # Page components
│   │   ├── context/          # React Context
│   │   ├── services/         # API calls
│   │   └── App.jsx           # Main app
│   └── package.json
├── README.md
└── DOCUMENTATION.md
```

## Security Features

The app includes:
- Password hashing with bcryptjs
- JWT token-based authentication
- Protected API routes
- SQL injection prevention
- Input validation

## Troubleshooting

Database Connection Error:
- Make sure MySQL is running
- Check your credentials in the `.env` file
- Verify the database `cafe_akasa` exists

Port Already in Use:
- Change the PORT in Backend `.env` file
- Update REACT_APP_API_URL in Frontend `.env` to match

CORS Issues:
- Backend CORS is configured for development
- For production, update CORS settings in Backend/src/server.js

## Future Improvements

Some features I'd like to add if I had more time:
- Admin panel for inventory management
- Payment gateway integration
- Search functionality
- Order status updates
- User profile management
- Reviews and ratings

## License

This project is created for interview/educational purposes.



