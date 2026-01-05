# Mobile To-Do List Application (Flutter)

| **Muhammad Abhyasa Santoso** | **5025221066** |
|------|------------|

---

## Application Description
The Mobile To-Do List application is an Android-based mobile application developed to assist users in organizing and managing their daily activities. The application enables users to create, modify, delete, and track the completion status of tasks in a simple and intuitive interface. All task data is stored locally on the device, ensuring persistence even when the application is closed or restarted.

This project is developed as a final assignment for the Mobile Application Development (PPB) course. The application is built using the Flutter framework and follows the Model–View–ViewModel (MVVM) architectural pattern to ensure clean separation of concerns, maintainability, and scalability.

---

## Learning Objectives
This project aims to achieve the following learning outcomes:
- Design and develop a functional mobile application using Flutter
- Apply the MVVM architectural pattern in a real-world application
- Implement effective UI and UX principles for mobile users
- Integrate local data persistence mechanisms
- Utilize Git and GitHub for version control and project documentation
- Produce a complete final project deliverable including source code, APK, demo video, and technical report

---

## Application Features

### Core Features (Mandatory)

| **Feature** | **Description** |
|------|------------|
| **Add Task** | Users can add new to-do items by entering a task title through a dialog interface. |
| **Edit Task** | Users can modify existing task titles to update task details. |
| **Delete Task** | Tasks can be removed from the list using a swipe (Dismissible) gesture. |
| **Mark Task as Completed** | Each task includes a checkbox to mark it as completed or uncompleted, with visual strikethrough for completed tasks. |
| **Task Filtering** | Users can filter tasks to view all tasks, completed tasks only, or uncompleted tasks only. |
| **Local Storage** | All tasks are stored locally using Shared Preferences, ensuring data persistence even after the app is closed. |

### Bonus Features

| **Feature** | **Description** |
|------|------------|
| **Dark Mode / Light Mode** | The application automatically adapts to system theme settings to provide better accessibility and user comfort. |

---

## Application Architecture
The application follows the **Model–View–ViewModel (MVVM)** architecture to separate concerns and improve code organization.

### Directory Structure
```
lib/
│
├── models/
│ └── task.dart
│ // Defines the task data model
│
├── viewmodels/
│ └── task_viewmodel.dart
│ // Handles business logic and application state
│
├── views/
│ └── task_list_view.dart
│ // Displays UI and handles user interaction
│
├── services/
│ └── local_storage.dart
│ // Manages local data persistence
│
└── main.dart
// Application entry point and dependency injection
```

### Architecture Explanation

The application follows the **Model–View–ViewModel (MVVM)** architecture pattern to ensure clear separation of concerns, improved maintainability, and scalability.

| **Layer** | **Component** | **Description** |
|------|----------|------------|
| **Model** | `Task` | Represents the task data structure, including fields such as `id`, `title`, `description`, and `isDone`. It also handles JSON serialization and deserialization for local storage. |
| **View** | `TaskListView` | Responsible for displaying the user interface. It renders the task list, input dialogs, checkboxes, and user interactions without containing business logic. |
| **ViewModel** | `TaskViewModel` | Acts as a bridge between the View and Model. It manages application state, handles task operations (add, edit, delete, toggle), and notifies the UI using `ChangeNotifier`. |
| **Service** | `LocalStorageService` | Handles data persistence using Shared Preferences. It saves and retrieves task data in JSON format to ensure data remains available after the app is closed. |
| **State Management** | `Provider` | Supplies the ViewModel to the widget tree and enables reactive UI updates when the application state changes. |

This architecture ensures:
- Loose coupling between UI and business logic  
- Easier debugging and testing  
- Clear separation of responsibilities across the application  

---

## Technologies and Tools Used

- Flutter
- Dart Programming Language
- Provider (State Management)
- Shared Preferences (Local Storage)
- UUID (Unique Task Identification)
- Android Emulator
- Git and GitHub (Version Control)

---

## Screenshots
Screenshots of the application interface are provided in the report, including:
### 1. Application Home Screen

### 2. Add Task Dialog

### 3. Task Successfully Added

### 4. Edit Task

### 5. Mark Task as Completed

### 6. Delete Task

### 7. Filtering Feature

### 8. Dark Mode (Bonus Feature)

---

## Demo Video
Link (Soon)

---

## Installer
Link (Soon)

---

## Conclusion
The Mobile To-Do List application successfully meets all the required specifications of the final project. By implementing Flutter and the MVVM architecture, the application achieves good separation of concerns, maintainable code structure, and responsive performance. Local data storage ensures data persistence, while UI features such as filtering and dark mode enhance the overall user experience.

---

## Future Development Plan
Possible improvements and extensions for the application include:
- Reminder notifications for tasks
- Task categorization and tagging
- Cloud synchronization using Firebase
- User authentication and login system
- Drag-and-drop task reordering
