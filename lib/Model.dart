import 'package:flutter/cupertino.dart';

class TodoProvider extends ChangeNotifier {
  List<Map> todo = [];
  List<Map> favTodo = [];
  late String title;
  int id = 1;

  void addTodo(String title) {
    this.todo.add({'id': '$id', 'todo': title, 'like': false});
    id = id + 1;
    notifyListeners();
  }

  void handleLike(Map query) {
    //handling icon
    int index = todo.indexOf(query);
    todo[index] = {...todo[index]};
    todo[index]['like'] = !todo[index]['like'];
    //handling items
    //TODO: Handling ToDo is done boss
    List<Map> fav = [...todo.where((element) => element['like']).toList()];
    favTodo = fav;
    notifyListeners();
  }

  void handleDate(DateTime date, Map query) {
    int index = todo.indexOf(query);
    todo[index] = {...todo[index]};
    todo[index]['endDate'] = date.toLocal().toString().split(' ')[0];
    notifyListeners();
  }

  void addFavorite(Map query) {
    favTodo.add(query);
    notifyListeners();
  }

  void removeFavorite(Map query) {
    int index = favTodo.indexOf(query);
    favTodo.removeAt(index);
    notifyListeners();
  }
}
