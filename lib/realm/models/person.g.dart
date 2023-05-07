// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Person extends _Person with RealmEntity, RealmObjectBase, RealmObject {
  Person(
    String nickName,
    String firstName,
    String lastName,
    DateTime birthdate,
  ) {
    RealmObjectBase.set(this, 'nickName', nickName);
    RealmObjectBase.set(this, 'firstName', firstName);
    RealmObjectBase.set(this, 'lastName', lastName);
    RealmObjectBase.set(this, 'birthdate', birthdate);
  }

  Person._();

  @override
  String get nickName =>
      RealmObjectBase.get<String>(this, 'nickName') as String;
  @override
  set nickName(String value) => RealmObjectBase.set(this, 'nickName', value);

  @override
  String get firstName =>
      RealmObjectBase.get<String>(this, 'firstName') as String;
  @override
  set firstName(String value) => RealmObjectBase.set(this, 'firstName', value);

  @override
  String get lastName =>
      RealmObjectBase.get<String>(this, 'lastName') as String;
  @override
  set lastName(String value) => RealmObjectBase.set(this, 'lastName', value);

  @override
  DateTime get birthdate =>
      RealmObjectBase.get<DateTime>(this, 'birthdate') as DateTime;
  @override
  set birthdate(DateTime value) =>
      RealmObjectBase.set(this, 'birthdate', value);

  @override
  Stream<RealmObjectChanges<Person>> get changes =>
      RealmObjectBase.getChanges<Person>(this);

  @override
  Person freeze() => RealmObjectBase.freezeObject<Person>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Person._);
    return const SchemaObject(ObjectType.realmObject, Person, 'Person', [
      SchemaProperty('nickName', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('firstName', RealmPropertyType.string),
      SchemaProperty('lastName', RealmPropertyType.string),
      SchemaProperty('birthdate', RealmPropertyType.timestamp),
    ]);
  }
}
