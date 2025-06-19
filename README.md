Winjit Task Tracker

A simple task-tracking Flutter app built during L&D Week 1.

Features:-
1.Add new tasks.
2.Mark tasks complete/incomplete.
3.View active and completed tasks separately.
4.State management using "Provider" as it helps in sharing and managing data across different parts of your app in a clean and efficient way.
5."shared_preferences" used to store data locally.
6.Task detail screen with routing.
7.Clean Architecture structure.

Project Structure:-
lib/
├── core/
├── features/
│ ├── home/
│ │ ├── data/
│ │ ├── domain/
│ │ │ ├── task_model.dart
│ │ │ └── task_provider.dart
│ │ └── presentation/
│ │ ├── task_screen.dart
│ │ └── task_details.dart
└── main.dart

Git Commands Used:-
1."git init","git add .","git commit","git push","git branch".
2.Additionally I learned about "git checkout" which helps us to access or get the version of code we want have.
3.Meaningful commit messages with descriptive changes.

Learning Summary:-
1.Understood version control and Git workflow in team projects.
2.Learned Flutter app structure, widget tree, and state management.
3.Implemented Provider pattern and clean architecture.
4.Also,learned about hot reload and restart.
5.Used shared_preferences for persistence and learned routing basics.

Challenges Faced:-
1.Managing state persistence across app reloads.
2.Structuring the folder hierarchy as per Clean Architecture.
3.Creating functions and actual logic how it works took time.

QNA:-
1. What did you learn about Git and Flutter so far?
->Git is a version control system used to track changes in source code during software development.
->Flutter is an open source UI SDK which uses Dart as a programming language. It is used for developing cross platform applications using one codebase.

2. What challenges did you face with Provider and project structure?
->Structuring logic across domain/presentation layers and using "ChangeNotifier" effectively was tricky at first.
->Managing updates and persistence also took time.
->Also used gpt to solve problem and also learned proper routing.

3. How would you scale this app if features grow in future?
->To scale the app, I had first restructure it using clean architecture—separating UI, logic, and data.
->I would switch from sharedpreference to a local database for better performance with large data.
->For more complex state riverpod or Bloc instead of Provider.
->Routing can be improved and features like user login, notifications, and cloud sync can be added later.
->Organizing the code by feature will also make it easier to maintain and grow.

4. What state management strategy would you explore next?  
->Will use Riverpod. As it offers a more testable, scalable, and flexible approach compared to Provider, especially for larger apps.