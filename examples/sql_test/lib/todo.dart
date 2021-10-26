class Todo {
  int? id;
  String? title;
  String? content;
  int? done;

  Todo({this.id, this.title, this.content, this.done});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'active': done,
    };
  }
}
