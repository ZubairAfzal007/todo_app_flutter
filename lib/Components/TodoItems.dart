import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  final Map todo;
  final VoidCallback favoriteHandler;
  final VoidCallback dateHandler;

  const ToDoItem({
    required this.todo,
    required this.dateHandler,
    required this.favoriteHandler,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.yellow.withOpacity(0.7),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            onLongPress: () {},
            leading: IconButton(
                onPressed: dateHandler,
                icon: Icon(
                  Icons.date_range,
                  color: Colors.white,
                )),
            title: Text(todo['todo']),
            trailing: IconButton(
              onPressed: favoriteHandler,
              icon: todo['like']
                  ? Icon(Icons.favorite, color: Colors.white)
                  : Icon(Icons.favorite_border),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                todo['endDate'] ?? '',
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
