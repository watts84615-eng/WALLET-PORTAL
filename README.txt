WALLET PORTAL v2  (React + Node + MongoDB)

EASY WAY (Windows): double-click setup.bat once (installs Node.js and MongoDB only if missing), edit backend\.env, then double-click start.bat. The frontend is now complete, no Vite/Tailwind steps needed.

MANUAL BACKEND   cd backend ; npm install ; npm start
FRONTEND  cd frontend ; npm create vite@latest . -- --template react ; npm install
          npm install -D tailwindcss postcss autoprefixer ; npx tailwindcss init -p
          (add Tailwind to index.css as usual) ; replace src/App.jsx with the one here ; npm run dev
First admin login = ADMIN_USERNAME / ADMIN_PASSWORD from .env (change them).

What it does: own login per user, wallet top-up by UPI reference + admin approval, Rs 20 (editable) cut per
order, balance can never go below zero, refund when admin rejects an order, admin panel (users, wallet, services,
orders with 12-digit number and WhatsApp number). Admin sends the finished card to the customer's WhatsApp by hand.
Not included: any card generation or AgriStack fetching. Before going live: use HTTPS, a strong JWT_SECRET, and add
Razorpay/Cashfree if you want automatic top-ups.

LIVE: set FRONTEND_ORIGIN in the backend environment to your website link (https://yourname.in). Only that site can call the API.
Login/register is limited to 10 tries per IP per 15 minutes.
