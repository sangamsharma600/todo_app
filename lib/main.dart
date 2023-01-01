import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> tasks = [];
  final TextEditingController _addTaskController = TextEditingController();

  void _addTask(String task) {
    setState(() {
      tasks.add(task);
    });
  }

  void _removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Todo App"),
          ),
          body: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 25),
                    child: TextField(
                      controller: _addTaskController,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_addTaskController.text.isNotEmpty) {
                        _addTask(_addTaskController.text);
                        _addTaskController.clear();
                      }
                    },
                    child: const Text("Add New Task"),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text("${index + 1}"),
                        title: Text(tasks[index].toString()),
                        trailing: IconButton(
                          onPressed: () {
                            _removeTask(index);
                          },
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
