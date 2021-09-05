import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/Components/Button.dart';
import 'package:todoapp/Components/EmptyMessage.dart';
import 'package:todoapp/Components/TodoItems.dart';
import 'package:todoapp/Components/fieldSheet.dart';
import 'package:todoapp/Model.dart';
import 'package:todoapp/favorite.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String title;

  TextEditingController controller = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  DateTime selectedDate = DateTime.now();

  Future<DateTime?> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    return picked;
  }

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<TodoProvider>().todo;
    final todoProvider = context.watch<TodoProvider>();
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                alignment: Alignment.center,
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.jpg'),
                  ),
                ),
              ),
            ),
            ListTile(
                tileColor: Colors.yellow,
                title: Text("Favorite todo"),
                leading: Icon(Icons.favorite),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Favorite(),
                    ),
                  );
                }),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("ToDo App"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10.0)),
              child: TextField(
                controller: controller,
                onChanged: (value) => setState(() => title = value),
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Enter todo',
                  filled: true,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          //Button
          Button(
            handleSubmit: handleSubmit,
            text: '',
            iconData: Icons.add,
          ),

          Expanded(
              child: todos.isEmpty
                  ? Message(text: 'Todo folder is empty')
                  : ListView(
                      children: todos
                          .map(
                            (todo) => ToDoItem(
                              todo: todo,
                              favoriteHandler: () {
                                todoProvider.handleLike(todo);
                              },
                              dateHandler: () async {
                                final date = await selectDate(context);
                                todoProvider.handleDate(date!, todo);
                              },
                            ),
                          )
                          .toList(),
                    )),
        ],
      ),
    );
  }

  handleSubmit() {
    final todos = Provider.of<TodoProvider>(context, listen: false);
    if (controller.text.isEmpty) {
      scaffoldKey.currentState!.showBottomSheet(
        (context) => FieldResponse(),
      );
    } else {
      todos.addTodo(title);
      controller.clear();
    }
  }
}
