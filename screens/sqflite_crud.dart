import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MyApp());
}

class Task {
  int id;
  String title;
  String description;
  bool isComplete;

  Task({required this.id, required this.title, required this.description, required this.isComplete});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isComplete': isComplete ? 1 : 0,
    };
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite CRUD Example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final db = await _initializeDatabase();
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    setState(() {
      tasks.clear();
      tasks.addAll(List.generate(maps.length, (i) {
        return Task(
          id: maps[i]['id'],
          title: maps[i]['title'],
          description: maps[i]['description'],
          isComplete: maps[i]['isComplete'] == 1,
        );
      }));
    });
  }

  Future<Database> _initializeDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'my_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE IF NOT EXISTS tasks (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            isComplete INTEGER
          )
        ''');
      },
    );
  }

  Future<void> _createTask() async {
    final title = titleController.text;
    final description = descriptionController.text;
    final db = await _initializeDatabase();
    await db.insert(
      'tasks',
      Task(title: title, description: description, isComplete: false, id: 1).toMap(),
    );
    titleController.clear();
    descriptionController.clear();
    _loadTasks();
  }

  Future<void> _updateTask(Task task) async {
    final db = await _initializeDatabase();
    await db.update('tasks', task.toMap(), where: 'id = ?', whereArgs: [task.id]);
    _loadTasks();
  }

  Future<void> _deleteTask(int id) async {
    final db = await _initializeDatabase();
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
    _loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite CRUD Example'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Add Task', style: TextStyle(fontSize: 20)),
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                ElevatedButton(
                  onPressed: _createTask,
                  child: Text('Add Task'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  title: Text(task.title),
                  subtitle: Text(task.description),
                  leading: Checkbox(
                    value: task.isComplete,
                    onChanged: (value) {
                      task.isComplete = value!;
                      _updateTask(task);
                    },
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteTask(task.id);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
