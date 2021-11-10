import 'package:cloud_firestore/cloud_firestore.dart';

class EventDetail {
  late String id;
  late String _description;
  late String _date;
  late String _startTime;
  late String _endTime;
  late String _speaker;
  late bool _isFavorite;

  EventDetail(this.id, this._description, this._date, this._startTime,
      this._endTime, this._speaker, this._isFavorite);

  String get description => _description;
  String get date => _date;
  String get startTime => _startTime;
  String get endTime => _endTime;
  String get speaker => _speaker;
  bool get isFavorite => _isFavorite;

  // 동적 객체를 가져와서 EventDetail로 변환하는 생성자
  EventDetail.fromMap(dynamic obj) {
    id = (obj as QueryDocumentSnapshot).id; // obj['id']
    _description = obj['description'];
    _date = obj['date'];
    _startTime = obj['startTime'];
    _endTime = obj['endTime'];
    _speaker = obj['speaker'];
    _isFavorite = obj['is_favorite'];
  }

  // EventDetail 객체를 Map으로 변환하는 메서드
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};

    map['id'] = id;
    map['description'] = _description;
    map['date'] = _date;
    map['startTime'] = _startTime;
    map['endTime'] = _endTime;
    map['speaker'] = _speaker;
    map['is_favorite'] = _isFavorite;

    return map;
  }
}
