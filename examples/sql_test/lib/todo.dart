class Todo {
  int? id;
  String? title;
  String? content;
  int? done;
  // sqllite 에는 boolean 타입이 없음 -> integer 사용

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
