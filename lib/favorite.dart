import 'package:flutter/material.dart';
import 'package:todoapp/Components/EmptyMessage.dart';
import 'package:todoapp/Model.dart';
import 'package:provider/provider.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favProvider = context.watch<TodoProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: favProvider.favTodo.isEmpty
          ? Message(text:'Favorite Todo is Empty')
          : ListView(
              children: favProvider.favTodo
                  .map(
                    (todo) => Card(
                      color: Colors.yellow.withOpacity(0.6),
                      child: ListTile(
                        leading: Icon(Icons.date_range),
                        title: Text(todo['todo']),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            todo['endDate'] ?? '',
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
    );
  }
}
