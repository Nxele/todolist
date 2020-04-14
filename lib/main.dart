import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Todo List',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.lime, //appbar color
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoList(title: 'My To-Do List'),
    );
  }
}

class TodoList extends StatefulWidget {
  TodoList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  TodoListState createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  List<String> _todoItems = [];

  //this will be called everytime the add button is called
  void _addToDoItem() {
    //setSate tells our app to re-render our list
    setState(() {
      int index = _todoItems.length;
      _todoItems.add('Item ' + index.toString());
    });
  }

  //Build the whole list of todp items
  Widget _buildToDoList() {
    return new ListView.builder(
      itemBuilder: (Context, index) {
        // ignore: missing_return
        if (index < _todoItems.length) {
          return _buildToDoItem(_todoItems[index]);
        }
      },
    );
  }

  //Build a single todo item
  Widget _buildToDoItem(String todoText) {
    return new ListTile(title: new Text(todoText));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildToDoList(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _addToDoItem,
          tooltip: 'Add task',
          child: Icon(Icons.add),
      ),
    );
  }
}
