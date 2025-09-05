```markdown
# Kabtour Social Media App

> A Flutter-based offline-first social media platform for tourism content sharing, built by **Nur Wahid Azhar**

## 📌 Overview

Kabtour is a rapidly growing startup aiming to revolutionize how small businesses manage their store operations through an internet-accessible platform without extra charges. As part of this vision, we've developed a **social media system** that allows users to share moments from their tourism experiences — such as travel activities, accommodations, and products they’ve purchased.

This mobile application enables users to:
- View content from others
- Create and publish posts with images
- Manage their own content (edit, delete, archive)
- See detailed view of any post
- Login/Register securely using JWT-like tokens (offline-first)

The app is fully functional **offline**, storing all data locally using `GetStorage`, and simulates authentication and content management without requiring a backend server.

---

## 🔧 Built With

- **Flutter** – Cross-platform UI framework  
- **GetX** – State management & navigation  
- **GetStorage** – Local persistence (offline-first)  
- **File Picker** – Image upload from device  
- **Huge Icons** – Icon library  
- **JWT Generator** – Mock token handling  
- **MVC Pattern** – Clean separation of concerns  
- **Feature-Based Architecture** – Modular and scalable  

---

## 🚀 How to Set Up & Run the Application

### 1. Clone the Repository
```bash
git clone https://github.com/nurwahidazhar/kabtour-social-media.git
cd kabtour-social-media
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Run the App
```bash
flutter run
```

> Supported on Android & iOS emulators/devices.

### 4. Initial Setup
- The app runs in **offline mode**.
- No internet connection required.
- On first launch, you'll be redirected to the **Login Screen**.
- You can register a new account or log in with existing credentials.

---

## 🔐 Authentication (Offline Mode)

Since the app is designed to work **without a backend**, authentication is handled locally using:
- **GetStorage** to save user data and JWT-like tokens
- **Mock JWT** generation with expiration time
- Passwords stored in plain text (for demo purposes only)

> ⚠️ For production, use `flutter_secure_storage` and hashed passwords.

---

## 📁 Project Structure

```
lib/
├── main.dart
├── core/
│   ├── constants/        # Colors, strings, themes
│   ├── services/         # StorageService, AuthService
│   ├── models/           # User, Post, JWTToken
│   ├── utils/            # Base64, validators
│   └── widgets/          # Reusable UI components
├── features/
│   ├── auth/             # Login, Register, AuthController
│   ├── home/             # Main feed, create, detail, profile
├── routes/
│   └── app_routes.dart
```

---

## 🎨 Design Choices & Assumptions

| Choice | Reason |
|-------|--------|
| **Offline-First Architecture** | To support users in areas with poor connectivity; all data saved locally via `GetStorage`. |
| **GetX State Management** | Lightweight, fast, and supports reactive programming with minimal boilerplate. |
| **MVC Pattern** | Clear separation between Model, View, and Controller for maintainability. |
| **Feature-Based Folder Structure** | Improves scalability and makes codebase easier to navigate. |
| **Mock JWT Tokens** | Simulates real-world authentication without needing a backend API. |
| **Base64 Image Storage** | Images picked from device are converted to Base64 and stored locally. |
| **No Backend Required** | All operations (login, posting, managing) happen offline. |
| **Simple UI with Blue Theme** | Clean, modern design focused on usability and accessibility. |

---

## 👤 Developer Information

**Name:** Nur Wahid Azhar  
**Email:** [nur.wahid.azhar@gmail.com](mailto:nur.wahid.azhar@gmail.com)  
**Portfolio:** [https://porto-ku.excitech.id/user?id=nur.wahid.azhar](https://porto-ku.excitech.id/user?id=nur.wahid.azhar)

---

## 📝 License

This project is open-source and available under the MIT License.

---

## 🙌 Acknowledgements

Special thanks to:
- Flutter Team
- GetX Community
- Kabtour Startup for the opportunity to contribute

---

## 💬 Feedback?

If you have any suggestions or issues, feel free to open an issue or contact me directly at **nur.wahid.azhar@gmail.com**.
```