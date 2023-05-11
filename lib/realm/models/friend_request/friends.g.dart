// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Friends extends _Friends with RealmEntity, RealmObjectBase, RealmObject {
  Friends(
    ObjectId id,
    String senderName,
    String receivedName,
    String state,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'senderName', senderName);
    RealmObjectBase.set(this, 'receivedName', receivedName);
    RealmObjectBase.set(this, 'state', state);
  }

  Friends._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get senderName =>
      RealmObjectBase.get<String>(this, 'senderName') as String;
  @override
  set senderName(String value) =>
      RealmObjectBase.set(this, 'senderName', value);

  @override
  String get receivedName =>
      RealmObjectBase.get<String>(this, 'receivedName') as String;
  @override
  set receivedName(String value) =>
      RealmObjectBase.set(this, 'receivedName', value);

  @override
  String get state => RealmObjectBase.get<String>(this, 'state') as String;
  @override
  set state(String value) => RealmObjectBase.set(this, 'state', value);

  @override
  Stream<RealmObjectChanges<Friends>> get changes =>
      RealmObjectBase.getChanges<Friends>(this);

  @override
  Friends freeze() => RealmObjectBase.freezeObject<Friends>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Friends._);
    return const SchemaObject(ObjectType.realmObject, Friends, 'Friends', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('senderName', RealmPropertyType.string),
      SchemaProperty('receivedName', RealmPropertyType.string),
      SchemaProperty('state', RealmPropertyType.string),
    ]);
  }
}
