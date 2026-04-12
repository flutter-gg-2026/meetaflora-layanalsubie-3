# 🌿 Meetaflora - Intelligent Plant Identification App

**Meetaflora** is a modern, AI-powered mobile application designed for plant enthusiasts. It allows users to identify plant species and receive detailed care instructions instantly by either uploading a photo or searching by name.

---

## 📱 App Screenshots
| Home Screen | Plant Identification |
| :---: | :---:
| <img width="250" src="https://github.com/user-attachments/assets/37d32d70-ac41-482c-9d24-dba92a0657c3" /> | <img width="250" src="https://github.com/user-attachments/assets/ea3df520-1039-41d9-b38a-de07bce1364a" />
 |

---

## 🎥 App Demo


https://github.com/user-attachments/assets/4c4d0d23-6527-42ee-89bb-06a56bdbdc4b



---

## ✨ Key Features
* **AI Plant Recognition:** Upload an image from your gallery and let Gemini AI analyze and identify the species.
* **Flexible Search:** Search for plants by name to retrieve scientific data and fun facts.
* **Comprehensive Care Guides:** Get detailed information including botanical descriptions, care tips, and interesting trivia.
* **Modern UI/UX:** A sleek interface featuring custom Bottom Sheets, smooth transitions, and responsive design.

---

## 🛠 Tech Stack
This project is built following industry best practices and modern architectural patterns:

* **Framework:** Flutter (Dart) 🎯
* **Architecture:** Clean Architecture (Separation of Data, Domain, and Presentation layers).
* **State Management:** Flutter BLoC / Cubit.
* **AI Integration:** Google Gemini AI API (v1 / v1beta).
* **Navigation:** GoRouter (Declarative routing).
* **Dependency Injection:** GetIt & Injectable.
* **Networking:** Dio (with custom interceptors for error handling).
* **UI Hooks:** Flutter Hooks (for clean lifecycle management).
* **Environment Management:** flutter_dotenv (to securely manage API keys).

---

## 🚀 How It Works
The application converts user-uploaded images into `Base64` strings and sends them via multimodal requests to the `gemini-1.5-flash` model. The AI response is enforced as a `JSON` object, which is then parsed and displayed in the UI.

### Sample JSON Structure from Gemini:
```json
{
  "plantName": "Monstera Deliciosa",
  "description": "A species of flowering plant native to tropical forests...",
  "careTips": "Thrives in bright, indirect light. Water every 1-2 weeks.",
  "funFact": "It is also known as the 'Swiss Cheese Plant' due to its leaf holes."
}
```

---

## 📂 Project Structure
Following **Feature-first Clean Architecture**:
```text
lib/
├── core/            # Errors, constants, and shared widgets
├── features/        # Feature-specific modules (Home, Plant Info)
│   ├── data/        # Models, Repositories Implementation & DataSources
│   ├── domain/      # Entities & UseCases
│   └── presentation/# Cubits, Screens, & UI Components
└── main.dart        # Application entry point
```

---

## ⚙️ Setup & Installation
1. Clone the repository and fetch dependencies:
   ```bash
   flutter pub get
   ```
2. Create a `.env` file in the root directory and add your Gemini API key:
   ```text
   gemini_key=YOUR_API_KEY_HERE
   ```
3. Run the application:
   ```bash
   flutter run
   ```

---

## 👩‍💻 Developer
**Layan Alsubaie** 
