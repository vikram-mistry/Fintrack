# Fintrack Pro

Fintrack Pro is a personal finance management application designed to help users track their income, expenses, and investments efficiently. It provides a comprehensive view of your financial health with an intuitive and responsive user interface.

## Features

- **Dashboard Overview**: View your net worth, monthly income, monthly spending, and burn rate at a glance.
- **Transaction Management**:
    - Log Income, Expense, and Transfer transactions.
    - Categorize transactions for better tracking.
    - View recent transactions and a detailed log.
- **Account Management**:
    - Track balances across multiple accounts (Bank, Wallet, Credit Card, Investment, etc.).
    - Support for credit card due dates and bill payments.
- **Budgeting**:
    - Set a monthly budget and track your progress.
    - Set category-specific budget limits.
    - Visual indicators for budget health.
- **Recurring Transactions**:
    - Set up recurring payments for bills, subscriptions, or salaries.
    - Get reminders for upcoming due payments.
- **Data Visualization**:
    - Visual representations of spending vs. income.
    - Category-wise spending breakdown.
- **Data Persistence**:
    - All data is stored locally in your browser (LocalStorage), ensuring privacy and persistence across sessions.
- **Export Data**:
    - Export transaction logs to CSV for external analysis.
- **Theme Support**:
    - Toggle between Dark and Light modes.
    - Glassmorphism design aesthetics.

## Technologies Used

- **HTML5**: Structure of the application.
- **CSS3**: Styling, including Tailwind CSS (via CDN) for utility classes and custom CSS for glassmorphism effects.
- **JavaScript (Vanilla)**: Application logic, DOM manipulation, and state management.
- **LocalStorage**: Client-side data storage.

## Setup and Usage

1.  **Clone or Download**: Clone this repository or download the files.
2.  **Open the Application**: Simply open the `index.html` file in any modern web browser. No server setup or installation is required.
    ```bash
    # If you have python installed, you can serve it locally for a better experience
    python3 -m http.server
    ```
3.  **Start Tracking**:
    - Add your accounts.
    - Set your monthly budget.
    - Start logging your daily transactions.

## Application Structure

- `index.html`: The main entry point containing the application structure.
- `style.css`: Contains custom styles and overrides.
- `script.js`: Contains all the application logic.

## License

This project is open-source and available for personal use.
