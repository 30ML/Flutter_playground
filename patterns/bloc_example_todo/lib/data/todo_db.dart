import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'todo.dart';

class TodoDb {
  /* Singleton Pattern */
  // DB를 두 번 이상 여는 것은 합리적이지 않으므로 싱글톤이어야 한다.
  static final TodoDb _singleton = TodoDb._internal();

  /* private internal 생성자 */
  // 새 TodoDb 인스턴스가 호출될 때마다 반환할
  // _singleton이라는 static private TodoDb 객체를 만듦
  TodoDb._internal();

  /* _singleton 객체를 반환할 factory 생성자 */
  // 일반 생성자 -> 현재 클래스의 새 인스턴스를 반환
  // 팩토리 생성자 -> 현재 클래스의 단일 인스턴스만 반환할 수 있음
  //               싱글톤에서 팩토리 생성자가 자주 사용되는 이유
  factory TodoDb() {
    return _singleton;
  }

  /* DatabaseFactory 객체 생성 */
  // 1. DatabaseFactory 생성
  DatabaseFactory dbFactory = databaseFactoryIo;

  final store = intMapStoreFactory.store('todos');

  Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      await _openDb().then((db) {
        _database = db;
      });
    }
    return _database!;
  }

  Future _openDb() async {
    final docsPath = await getApplicationDocumentsDirectory()
  }
}
