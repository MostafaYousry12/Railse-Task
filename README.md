# Task Manager - Railse Hiring Task

This project is a **Task Manager screen** implemented as part of the **Railse hiring task**.  
It allows users to view, update, and manage tasks, with features like starting tasks, marking them as completed, and updating start dates.

## 📌 Features
- Display task list with status (`Not Started`, `Started`, `Completed`)
- Start a task and track its progress
- Mark a task as completed with a completion date
- Update the start date via a date picker
- Automatic status text formatting (e.g., *Due in X days*, *Overdue*, *Completed Today*)
- Built using **MVVM Pattern** for clean and maintainable code
_ Build Using Bloc State Management

## 🏗 Architecture
This app is structured using **MVVM**:
- **Date** → `Task` data model representing the task entity
- **View** → UI widgets displaying task information
- **ViewModel** → `TaskManagerCubit` handling state changes using `flutter_bloc`

