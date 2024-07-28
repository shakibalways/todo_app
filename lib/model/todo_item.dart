class TodoItem {
  String title;
  bool isDone;

  TodoItem({required this.title, this.isDone = false});
}

List<TodoItem> todoList = [
  TodoItem(title: 'Yes It is work'),
  TodoItem(title: 'No It is Not Work'),
];
