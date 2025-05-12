# **Notes Keeper - Your Offline Note-Taking Companion**

## 🚀 Project Overview

**Notes Keeper** is a lightweight and intuitive offline note-taking application built with **Flutter**. Designed for quick access and simplicity, it allows users to create, edit, and manage personal notes efficiently without needing an internet connection.

🧠 This project was developed as a hands-on exercise to strengthen Flutter development skills, particularly in local storage and state management.

---

## 📌 Key Features

- 📝 **Create Notes**: Users can write and save custom notes.  
- 🗑️ **Delete Notes**: Remove unwanted notes instantly.  
- 🎨 **Multiple Themes**: Toggle between light and dark themes for personalized UI.  
- 📂 **Persistent Local Storage**: All data is stored locally using SQLite – fully offline!  
- 🔄 **Update Notes**: Edit existing notes and save changes easily.

---

## ⚙️ Technologies Used

- **Flutter**: Framework for cross-platform UI development.  
- **Dart**: Primary programming language.  
- **Provider**: Lightweight and powerful state management solution.  
- **SQLite**: Used for local, persistent note storage.  
- **Android Studio / VS Code**: IDEs used during development.  
- **GitHub**: Version control and project collaboration.

---

## 📱 App Pages & UI Components

### 1. **Home Page**

- Displays a list/grid of all saved notes.  
- Options to **add**, **view**, **edit**, or **delete** notes.  
- Theme switcher (light/dark toggle).

### 2. **Note Editor Page**

- **Fields**:  
  - Title  
  - Content  

- **Buttons**:  
  - Save  
  - Discard/Back

### 3. **Settings Page (Optional)**

- Theme Selector  
- About App

---

## 🧑‍💻 Note Model Class

- **Attributes**:  
  - `id`: Unique identifier  
  - `title`: Title of the note  
  - `content`: Main text of the note  
  - `timestamp`: Time the note was created or last edited  

- **Functionalities**:  
  - Add Note  
  - Update Note  
  - Delete Note  
  - Fetch Notes from SQLite DB

---

## 🔧 State Management with Provider

The app uses the **Provider** package to handle state updates efficiently. All note-related actions (add, delete, update) are wrapped in provider-notified functions to ensure reactive UI updates.

---

## 🗃️ Database (SQLite)

The app stores all note data locally using **SQLite**:

- **Notes Table**:  
  - `id` (Primary Key)  
  - `title`  
  - `content`  
  - `timestamp`

SQLite ensures quick local access, even without internet connectivity.

---

## 💡 Future Improvements

- 🔍 **Search Notes** functionality  
- 📁 **Note Categories/Tags**  
- ☁️ **Optional Cloud Sync** with Firebase for backup  
- 🔒 **Biometric Lock** or App Password
