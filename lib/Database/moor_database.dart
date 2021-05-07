import 'package:moor_flutter/moor_flutter.dart';
part 'moor_database.g.dart';

class Contacts extends Table {
  TextColumn get name => text()();
  IntColumn get id => integer().autoIncrement()();
  TextColumn get number => text()();
}

@UseMoor(tables: [Contacts])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: "db.sqlite", logStatements: true));
  int get schemaVersion => 1;

  Future<List<Contact>> getAllContact() => select(contacts).get();
  Stream<List<Contact>> watchAllContact() => select(contacts).watch();
  Future insertContact(Contact contact) => into(contacts).insert(contact);
  Future deleteOrder(Contact contact) => delete(contacts).delete(contact);
  Future updateOrder(Contact contact) => update(contacts).replace(contact);
}
