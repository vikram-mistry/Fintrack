# Budget Pro 💰

<div align="center">

**A beautiful, feature-rich personal finance app for iOS with native widgets**

[![Swift](https://img.shields.io/badge/Swift-5.0+-orange.svg)](https://swift.org)
[![iOS](https://img.shields.io/badge/iOS-14.0+-blue.svg)](https://www.apple.com/ios)
[![Capacitor](https://img.shields.io/badge/Capacitor-6.0-green.svg)](https://capacitorjs.com)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

</div>

---

## ✨ Features

### 📊 Financial Dashboard
- **Net Worth Tracking** - Real-time view of assets minus liabilities
- **Monthly Overview** - Income, expenses, and burn rate at a glance
- **Smart Cycle Dates** - Customizable monthly billing cycles (e.g., 25th to 24th)
- **Visual Indicators** - Color-coded progress rings for budget health

### 💳 Transaction Management
- **Multi-Type Support** - Log income, expenses, and transfers
- **20+ Categories** - Groceries, Dining, Transport, EMI, Subscriptions, and more
- **Quick Add** - Add transactions in seconds with smart defaults
- **Recurring Transactions** - Automatic tracking for bills and subscriptions

### 🏦 Account Management
- **Multiple Account Types** - Bank, Wallet, Credit Card, Investment, Insurance
- **Credit Card Tracking** - Due dates and bill payment reminders
- **Balance Sync** - Automatic balance calculation across all accounts
- **Transfer Support** - Move money between accounts seamlessly

### 📱 Native iOS Widgets
- **Small Widget** - Quick expense view with dual-ring progress chart
- **Medium Widget** - Full stats with budget remaining and quick-add button
- **iOS 26 Ready** - Optimized for Clear/Glass mode with vibrancy support
- **Privacy Mode** - Hide amounts with •••• when Face ID is enabled

### 🔐 Security
- **Face ID / Touch ID** - Native biometric authentication on app launch
- **Lock Screen** - Beautiful overlay requiring authentication
- **Widget Privacy** - Option to hide financial data on home screen widgets
- **Passcode Fallback** - Device passcode when biometrics unavailable

### 📈 Budgeting & Analytics
- **Monthly Budget** - Set and track overall spending limits
- **Category Budgets** - Individual limits per spending category
- **Progress Visualization** - Dual-ring charts showing spend vs. income
- **Burn Rate** - Track daily spending velocity

### 🔔 Smart Notifications
- **Bill Reminders** - Native iOS notifications for upcoming payments
- **Due Date Alerts** - 7-day advance warnings for recurring bills
- **Haptic Feedback** - Tactile responses throughout the app

### 💾 Data Management
- **IndexedDB Storage** - Fast, reliable local data persistence
- **JSON Backup/Restore** - Export and import your complete data
- **Monthly Archives** - Automatic transaction archiving
- **CSV Export** - Export to spreadsheet format for analysis

### 🎨 Premium UI/UX
- **Glassmorphism Design** - Modern frosted glass aesthetics
- **Dark/Light Themes** - System-aware with manual toggle
- **Smooth Animations** - Liquid navigation and micro-interactions
- **Native Haptics** - Tactile feedback for all interactions

---

## 📲 Installation

### For Developers (Build from Source)

#### Prerequisites
- **macOS** with Xcode 15+ installed
- **Node.js** 18+ and npm
- **Apple Developer Account** (free tier works for personal devices)
- **iOS Device** running iOS 14+

#### Step 1: Clone the Repository
```bash
git clone https://github.com/vikram-mistry/Fintrack.git
cd Fintrack
```

#### Step 2: Install Dependencies
```bash
npm install
```

#### Step 3: Open in Xcode
```bash
npx cap open ios
```

#### Step 4: Configure Signing
1. Select the **App** target in Xcode
2. Go to **Signing & Capabilities** tab
3. Select your **Team** (create a free Apple ID if needed)
4. Change **Bundle Identifier** to something unique (e.g., `com.yourname.budgetpro`)

#### Step 5: Configure Widget Extension
1. Select the **BudgetWidgetExtension** target
2. Apply the same **Team** and update the **Bundle Identifier**
3. Ensure **App Groups** capability shows `group.com.budgetpro.data`

#### Step 6: Build and Run
1. Connect your iOS device via USB
2. Select your device in Xcode's device dropdown
3. Press **⌘+R** to build and run
4. Trust the developer certificate on your device:
   - Go to **Settings → General → VPN & Device Management**
   - Tap your developer profile and select **Trust**

### For End Users
This app is currently available for self-installation via Xcode. An App Store release is planned for the future.

---

## 🏗️ Project Structure

```
Fintrack/
├── index.html              # Main web app entry point
├── script.js               # Application logic (1600+ lines)
├── style.css               # Custom styles and themes
├── ios/
│   └── App/
│       ├── App/            # Capacitor iOS shell
│       │   ├── ViewController.swift   # Native bridges (haptics, widgets, Face ID)
│       │   ├── Info.plist              # iOS configuration
│       │   └── public/                 # Web assets (synced from root)
│       └── BudgetWidget/               # iOS widget extension
│           └── BudgetWidget.swift      # Widget UI and data
└── package.json
```

---

## 🔧 Native Bridges

Budget Pro uses custom Swift bridges for native functionality:

| Bridge | Purpose |
|--------|---------|
| `widgetBridge` | Sync financial data to home screen widgets |
| `hapticBridge` | Trigger native haptic feedback |
| `notificationBridge` | Schedule local notifications for bill reminders |
| `biometricBridge` | Face ID / Touch ID authentication |

---

## 📸 Screenshots

<div align="center">
<img width="280" alt="Home Dashboard" src="https://github.com/user-attachments/assets/aa072de9-d966-4294-a88c-299f598af895" />
<img width="280" alt="Transactions" src="https://github.com/user-attachments/assets/d81cf2c0-8bd8-4b90-a9a5-ec237fc3ca70" />
<img width="280" alt="Accounts" src="https://github.com/user-attachments/assets/152fbe1c-b576-407d-adad-920102b221f2" />
</div>

<div align="center">
<img width="280" alt="Settings" src="https://github.com/user-attachments/assets/7ce42d7f-b757-4bda-b192-b6cdb8f7c7cc" />
<img width="280" alt="Widget Small" src="https://github.com/user-attachments/assets/273326cb-d8de-4477-a8dc-9c9d9a897091" />
<img width="280" alt="Widget Medium" src="https://github.com/user-attachments/assets/7d9c5650-0388-4565-b6ba-51fa331300f3" />
</div>

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|------------|
| **Frontend** | HTML5, CSS3 (Tailwind), Vanilla JavaScript |
| **iOS Shell** | Capacitor 6.0, Swift 5 |
| **Widgets** | SwiftUI, WidgetKit |
| **Storage** | IndexedDB (primary), App Groups (widget sync) |
| **Security** | LocalAuthentication Framework (Face ID/Touch ID) |

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).

---

## 👨‍💻 Author

**Vikram Mistry**

- GitHub: [@vikram-mistry](https://github.com/vikram-mistry)

---

<div align="center">
<sub>Built with ❤️ using Capacitor, SwiftUI, and modern web technologies</sub>
</div>
