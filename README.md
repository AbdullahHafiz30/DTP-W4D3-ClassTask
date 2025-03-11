# Multi-Screen Task Manager

## Overview

Multi-Screen Task Manager is a simple task management app built with SwiftUI. It demonstrates a basic MVVM architecture for creating, listing, and managing tasks, along with supporting accessibility features and Dynamic Type.

## Features

- **Task Listing:** Displays tasks in a form with the ability to toggle completion status.
- **Task Creation:** Add new tasks on a separate screen.
- **Dark/Light Mode:** Toggle between dark and light themes.
- **Accessibility:** Implements `accessibilityLabel()`, `accessibilityHint()`, and supports Dynamic Type for text scaling.
- **Persistence:** Uses `UserDefaults` to save and load tasks between app launches.

## Architecture

- **ContentView:** The main view showing the task list, dark mode toggle, and a navigation link to the task creation view.
- **NewTaskView:** A form view dedicated to adding new tasks.
- **TaskViewModel:** An observable object managing the list of tasks and handling data persistence.
- **Task:** A model representing each task that conforms to `Identifiable` and `Codable`.

## Installation

1. **Clone the Repository:**

   ```bash
   git clone https://your-repository-url.git
2. **Open in Xcode: Open the project file in Xcode.**

3. **Build and Run: Select your simulator or device and run the application.**

## Code Structure
- ContentView.swift:
Contains the main interface for viewing and interacting with the task list. It includes a dark/light mode toggle and a navigation link to the New Task screen.

- NewTaskView.swift:
Provides a form for entering a new task. Once the task is added, the view dismisses, and the task is saved using the shared view model.

- Task.swift:
Defines the Task model with properties such as `title` and `isCompleted`.

- TaskViewModel.swift:
Manages the tasks, including adding new tasks, toggling task completion, deleting tasks, and saving/loading data from `UserDefaults`.

## Accessibility
The app includes several accessibility features to enhance usability:

- accessibilityLabel():
Provides clear labels for UI elements like toggles and buttons.

- accessibilityHint():
Offers additional context for actions, helping users understand what will happen when an element is activated.

- Dynamic Type:
Uses system fonts (e.g., `.body`, `.headline`) that automatically scale according to the user’s preferred text size.

## Future Enhancements

- Enhance UI/UX design.

- Implement more advanced task filtering and sorting.

- Integrate persistent storage options like Core Data.


## License
This project is provided for educational purposes and does not include a formal license.
