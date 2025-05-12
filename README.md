# 🎬 FilmyINFO - Flutter Movie App

FilmyINFO is a sleek and modern Flutter application that provides users with up-to-date movie data using a RESTful API. Built following the **MVVM architecture**, this app showcases best practices in code structure, state management, and UI responsiveness. It also includes a login feature using a test API endpoint from [reqres.in](https://reqres.in).

---

## 🚀 Features

- 🔍 Browse movies with real-time data from a public REST API
- 📦 Clean and maintainable architecture using **MVVM**
- 🔐 User authentication using test API (reqres.in)
- ⚡ Smooth state management using **Provider**
- 🎨 Clean, responsive UI built with Flutter
- 🔁 Error handling and API state indicators (loading, error, success)
- ✅ Modular code structure for scalability and reusability

---

## 🧰 Tech Stack

| Category        | Technology     |
|----------------|----------------|
| Language        | Dart           |
| Framework       | Flutter        |
| Architecture    | MVVM           |
| State Management| Provider       |
| API Integration | RESTful API    |
| Authentication | reqres.in      |

---

## 📂 Project Structure (MVVM)
<pre> ``` lib/ ├── models/ # Data models ├── views/ # UI screens ├── viewmodels/ # Business logic and state management ├── data/ # API calls and network logic ├── res/ # Reusable UI components ├── utils/ # Helper functions/constants └── main.dart # Entry point ``` </pre>


---

## 🔐 Login Demo

The app uses a test login API:
- Email: `eve.holt@reqres.in`
- Password: `cityslicka`

Tested via `https://reqres.in/api/login`

---

## 🎥 Video Demo

Check out the demo of **FilmyINFO** on LinkedIn:

🔗 [Watch Demo on LinkedIn](https://www.linkedin.com/posts/muhammad-daniyal-086228178_flutterdev-dartlang-mobileappdevelopment-activity-7326645860686000129-xZwc?utm_source=share&utm_medium=member_android&rcm=ACoAACoJMGYBTBbcC6HtuJ7wYAPaik5v8ufNqG8)

> *(Click the link above to see the app in action — includes UI, login, and movie fetching features!)*


---

## 🧪 Getting Started

### Prerequisites
- Flutter SDK
- Dart SDK
- Android Studio / VS Code

### Run Locally

```bash
git clone https://github.com/daniyal-dev075/Movie-App.git
cd Movie-App
flutter pub get
flutter run
