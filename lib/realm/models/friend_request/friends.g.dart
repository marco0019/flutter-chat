// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Friends extends _Friends with RealmEntity, RealmObjectBase, RealmObject {
  Friends(
    ObjectId id,
    ObjectId senderName,
    ObjectId receivedName,
    String state,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'sender_id', senderName);
    RealmObjectBase.set(this, 'received_id', receivedName);
    RealmObjectBase.set(this, 'state', state);
  }

  Friends._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  ObjectId get senderName =>
      RealmObjectBase.get<ObjectId>(this, 'sender_id') as ObjectId;
  @override
  set senderName(ObjectId value) =>
      RealmObjectBase.set(this, 'sender_id', value);

  @override
  ObjectId get receivedName =>
      RealmObjectBase.get<ObjectId>(this, 'received_id') as ObjectId;
  @override
  set receivedName(ObjectId value) =>
      RealmObjectBase.set(this, 'received_id', value);

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
      SchemaProperty('senderName', RealmPropertyType.objectid,
          mapTo: 'sender_id'),
      SchemaProperty('receivedName', RealmPropertyType.objectid,
          mapTo: 'received_id'),
      SchemaProperty('state', RealmPropertyType.string),
    ]);
  }
}
