import 'package:flutter/material.dart';

void main() {
  runApp(const ReorderableList());
}

class ReorderableList extends StatelessWidget {
  const ReorderableList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      // home: HomePage(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This variable holds the list's items
  final List<String> _todos = ['Task A', 'Task B', 'Task C', 'Task D'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: ReorderableListView(
          header: Container(
              padding: const EdgeInsets.all(25),
              color: Colors.amber,
              child: const Text('My Todo List')),
          children: _todos
              .map((task) => Container(
                    key: ValueKey(task),
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        border: Border.all(width: 1, color: Colors.green)),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(25),
                      leading: const Icon(Icons.lock_clock),
                      title: Text(
                        task,
                        style: const TextStyle(fontSize: 24),
                      ),
                      trailing: const Icon(Icons.drag_handle_outlined),
                    ),
                  ))
              .toList(),
          // The reorder function
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              final element = _todos.removeAt(oldIndex);
              _todos.insert(newIndex, element);
            });
          }),
    );
  }
}