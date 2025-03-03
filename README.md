# **🏏 Sportz Interactive App**

A Flutter application that provides real-time match details, squads, and player statistics. Designed with a modern UI, this app presents match data in an engaging and user-friendly manner, inspired by Dream11-style designs.

![Sportz Interactive App](https://via.placeholder.com/800x400?text=Sportz+Interactive+App+Preview)


---

## **📌 Features**
✅ **Match Details Screen** – Displays live match info with an aesthetic UI  
✅ **Squad Information** – View complete team squads with player details  
✅ **Player Statistics** – Batting & Bowling stats, including Strike Rate, Economy, etc.  
✅ **Smooth Navigation** – Effortless transitions between match details & squads  
✅ **Modern UI with Image Backgrounds & Opacity Effects** – Enhances user experience  

---

## **🛠️ Tech Stack**
- **Flutter** (Dart)
- **GetX** – State Management & Navigation
- **Custom UI Components** – No third-party UI libraries for better flexibility

---

## **📦 Installation**
### **Prerequisites**
- Install [Flutter](https://flutter.dev/docs/get-started/install)
- Ensure you have an **Android/iOS Emulator** or a **physical device** connected

### **Clone the Repository**
```bash
git clone https://github.com/your-username/sportz_interactive_app.git
cd sportz_interactive_app
```

### **Install Dependencies**
```bash
flutter pub get
```

### **Run the App**
```bash
flutter run
```

*(For iOS, run `pod install` inside the `ios` folder before running the app.)*

---

## **📁 Project Structure**
```
sportz_interactive_app/
│-- lib/
│   ├── main.dart               # Entry point of the application
│   ├── screens/
│   │   ├── match_screen.dart   # UI for Match Details
│   │   ├── squad_screen.dart   # UI for Squad Details
│   ├── controllers/
│   │   ├── match_controller.dart # Manages API data & state
│   ├── models/
│   │   ├── match_model.dart    # Match data model
│   │   ├── player_model.dart   # Player data model
│   ├── resource/
│   │   ├── app_assets.dart     # Image assets paths
│-- pubspec.yaml                # Dependencies & assets
│-- README.md                   # Documentation
```

---

## **📝 API Integration**
- Consumes **match details & squads** from a **REST API** *(Mention the API source if applicable)*
- Uses **GetX** for API calls & state management

---

## **🛠 Future Enhancements**
🔹 **Live Match Updates** – Fetch real-time scores  
🔹 **Player Comparison Feature** – Compare player stats dynamically  
🔹 **Dark Mode Support** – Enhance user experience with themes  

---

## **📌 Author**
👤 **[Ziyad Surve]**  
📧 [zsurve16@gmail.com]
---

## **⭐ Contributing**
Contributions are welcome! Feel free to **fork** this repository and submit a **pull request**.

