# Cafe Akasa - Food Ordering Platform

A full-stack food ordering platform built with React (Frontend) and Express/Node.js (Backend) with MySQL database.

## Features

- **User Authentication**: Register and login with JWT token-based authentication
- **Browse Items**: Browse food items by category (Fruit, Vegetable, Non-veg, Breads, Beverages, Snacks)
- **Shopping Cart**: Add items to cart, update quantities, and manage cart items
- **Checkout**: Place orders with inventory validation and real-time stock checking
- **Order History**: View past orders with tracking IDs and delivery status
- **Multi-device Support**: Cart and orders synced across all devices
- **Real-time Inventory**: Stock validation during checkout

## Tech Stack

### Backend
- Node.js
- Express.js
- MySQL
- JWT (JSON Web Tokens)
- bcryptjs (Password hashing)

### Frontend
- React
- React Router
- Axios
- CSS3

## Prerequisites

- Node.js (v14 or higher)
- MySQL (v5.7 or higher)
- npm or yarn

## Setup Instructions

### 1. Database Setup

1. Open MySQL command line or MySQL Workbench
2. Run the schema file to create the database and tables:

```bash
mysql -u root -p < Backend/database/schema.sql
```

Or manually execute the SQL file in MySQL Workbench.

### 2. Backend Setup

1. Navigate to the Backend directory:
```bash
cd Backend
```

2. Install dependencies:
```bash
npm install
```

3. Create a `.env` file in the Backend directory with the following content:
```env
# Server Configuration
PORT=5000

# Database Configuration
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_mysql_password_here
DB_NAME=cafe_akasa

# JWT Secret Key (Change this to a strong random string in production)
JWT_SECRET=your_secret_key_here_change_in_production

# Environment
NODE_ENV=development
```

4. Update the `.env` file with your MySQL credentials:
   - Replace `your_mysql_password_here` with your actual MySQL password
   - Replace `your_secret_key_here_change_in_production` with a strong random string for JWT token signing

5. Start the backend server:
```bash
npm start
```

For development with auto-reload:
```bash
npm run dev
```

The backend server will run on `http://localhost:5000`

### 3. Frontend Setup

1. Navigate to the Frontend directory:
```bash
cd Frontend
```

2. Install dependencies:
```bash
npm install
```

3. Create a `.env` file in the Frontend directory with the following content:
```env
# API Base URL
# Change this if your backend is running on a different port or host
REACT_APP_API_URL=http://localhost:5000/api
```

   **Note:** If your backend is running on a different port or host, update `REACT_APP_API_URL` accordingly.

4. Start the frontend development server:
```bash
npm start
```

The frontend will run on `http://localhost:3000`

## API Endpoints

### Authentication
- `POST /api/auth/register` - Register a new user
  - Body: `{ email: string, password: string }`
- `POST /api/auth/login` - Login user
  - Body: `{ email: string, password: string }`

### Items
- `GET /api/items/categories` - Get all categories
- `GET /api/items` - Get all items
- `GET /api/items?category=:categoryId` - Get items by category

### Cart (Requires Authentication)
- `GET /api/cart` - Get user's cart
- `POST /api/cart` - Add item to cart
  - Body: `{ itemId: number, quantity: number }`
- `PUT /api/cart/:itemId` - Update cart item quantity
  - Body: `{ quantity: number }`
- `DELETE /api/cart/:itemId` - Remove item from cart

### Orders (Requires Authentication)
- `POST /api/orders/checkout` - Place order
- `GET /api/orders` - Get order history
- `GET /api/orders/:orderId` - Get order details

## Database Schema

### Tables
- **users**: User accounts with email and hashed passwords
- **categories**: Food categories (Fruit, Vegetable, etc.)
- **items**: Food items with price, stock, and category
- **cart_items**: User's shopping cart items
- **orders**: Order records with tracking IDs
- **order_items**: Items in each order

## Usage

1. **Register/Login**: Create an account or login with existing credentials
2. **Browse Items**: Use category filters to browse available items
3. **Add to Cart**: Click "Add to Cart" on any item
4. **Manage Cart**: View cart, update quantities, or remove items
5. **Checkout**: Review order and place order
6. **View Orders**: Check order history and tracking information

## Features Implementation

### Cart Persistence
- Cart items are stored in the database
- Cart is synced across all devices when user logs in
- Cart persists between sessions

### Inventory Management
- Real-time stock checking during checkout
- Items are deducted from inventory only on successful checkout
- Users are notified if items are out of stock

### Order Tracking
- Each order gets a unique tracking ID (format: CA-timestamp-UUID)
- Order status can be tracked (Pending/Delivered)
- Order history shows all past orders

## Security Features

- Password hashing with bcryptjs
- JWT token-based authentication
- Protected API routes
- Input validation
- SQL injection prevention with parameterized queries

## Project Structure

```
Cafe Akasa/
├── Backend/
│   ├── src/
│   │   ├── config/
│   │   │   └── database.js
│   │   ├── controllers/
│   │   │   ├── authController.js
│   │   │   ├── itemController.js
│   │   │   ├── cartController.js
│   │   │   └── orderController.js
│   │   ├── middleware/
│   │   │   └── auth.js
│   │   ├── routes/
│   │   │   ├── auth.js
│   │   │   ├── items.js
│   │   │   ├── cart.js
│   │   │   └── orders.js
│   │   └── server.js
│   ├── database/
│   │   └── schema.sql
│   └── package.json
├── Frontend/
│   ├── src/
│   │   ├── components/
│   │   │   ├── Navbar.js
│   │   │   └── ItemCard.js
│   │   ├── pages/
│   │   │   ├── Login.js
│   │   │   ├── Register.js
│   │   │   ├── Home.js
│   │   │   ├── CartPage.js
│   │   │   ├── Checkout.js
│   │   │   └── OrderHistory.js
│   │   ├── context/
│   │   │   └── AuthContext.js
│   │   ├── services/
│   │   │   └── api.js
│   │   ├── App.js
│   │   └── index.js
│   └── package.json
└── README.md
```

## Troubleshooting

### Database Connection Issues
- Verify MySQL is running
- Check database credentials in `.env` file
- Ensure database `cafe_akasa` exists

### Port Already in Use
- Change PORT in Backend `.env` file
- Update REACT_APP_API_URL in Frontend `.env` accordingly

### CORS Issues
- Backend CORS is configured to allow all origins in development
- For production, update CORS settings in `Backend/src/server.js`

## Future Improvements

- Admin panel for inventory management
- Real-time order status updates
- Payment gateway integration
- Email notifications for orders
- Search functionality for items
- Item reviews and ratings
- Discount and coupon system
- Order cancellation feature
- Delivery address management
- Push notifications

## License

This project is created for interview purposes.

## Author

Cafe Akasa Development Team

