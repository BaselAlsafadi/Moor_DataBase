// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Contact extends DataClass implements Insertable<Contact> {
  final String name;
  final int id;
  final String number;
  Contact({@required this.name, @required this.id, @required this.number});
  factory Contact.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return Contact(
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      number:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}number']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || number != null) {
      map['number'] = Variable<String>(number);
    }
    return map;
  }

  ContactsCompanion toCompanion(bool nullToAbsent) {
    return ContactsCompanion(
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      number:
          number == null && nullToAbsent ? const Value.absent() : Value(number),
    );
  }

  factory Contact.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Contact(
      name: serializer.fromJson<String>(json['name']),
      id: serializer.fromJson<int>(json['id']),
      number: serializer.fromJson<String>(json['number']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'id': serializer.toJson<int>(id),
      'number': serializer.toJson<String>(number),
    };
  }

  Contact copyWith({String name, int id, String number}) => Contact(
        name: name ?? this.name,
        id: id ?? this.id,
        number: number ?? this.number,
      );
  @override
  String toString() {
    return (StringBuffer('Contact(')
          ..write('name: $name, ')
          ..write('id: $id, ')
          ..write('number: $number')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(name.hashCode, $mrjc(id.hashCode, number.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Contact &&
          other.name == this.name &&
          other.id == this.id &&
          other.number == this.number);
}

class ContactsCompanion extends UpdateCompanion<Contact> {
  final Value<String> name;
  final Value<int> id;
  final Value<String> number;
  const ContactsCompanion({
    this.name = const Value.absent(),
    this.id = const Value.absent(),
    this.number = const Value.absent(),
  });
  ContactsCompanion.insert({
    @required String name,
    this.id = const Value.absent(),
    @required String number,
  })  : name = Value(name),
        number = Value(number);
  static Insertable<Contact> custom({
    Expression<String> name,
    Expression<int> id,
    Expression<String> number,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (id != null) 'id': id,
      if (number != null) 'number': number,
    });
  }

  ContactsCompanion copyWith(
      {Value<String> name, Value<int> id, Value<String> number}) {
    return ContactsCompanion(
      name: name ?? this.name,
      id: id ?? this.id,
      number: number ?? this.number,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContactsCompanion(')
          ..write('name: $name, ')
          ..write('id: $id, ')
          ..write('number: $number')
          ..write(')'))
        .toString();
  }
}

class $ContactsTable extends Contacts with TableInfo<$ContactsTable, Contact> {
  final GeneratedDatabase _db;
  final String _alias;
  $ContactsTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _numberMeta = const VerificationMeta('number');
  GeneratedTextColumn _number;
  @override
  GeneratedTextColumn get number => _number ??= _constructNumber();
  GeneratedTextColumn _constructNumber() {
    return GeneratedTextColumn(
      'number',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [name, id, number];
  @override
  $ContactsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'contacts';
  @override
  final String actualTableName = 'contacts';
  @override
  VerificationContext validateIntegrity(Insertable<Contact> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number'], _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Contact map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Contact.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ContactsTable createAlias(String alias) {
    return $ContactsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ContactsTable _contacts;
  $ContactsTable get contacts => _contacts ??= $ContactsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [contacts];
}
