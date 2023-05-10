// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Message extends _Message with RealmEntity, RealmObjectBase, RealmObject {
  Message(
    ObjectId id,
    int type,
    String content,
    int state,
    ObjectId userId,
    ObjectId chatId,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'content', content);
    RealmObjectBase.set(this, 'state', state);
    RealmObjectBase.set(this, 'user_id', userId);
    RealmObjectBase.set(this, 'chat_id', chatId);
  }

  Message._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  int get type => RealmObjectBase.get<int>(this, 'type') as int;
  @override
  set type(int value) => RealmObjectBase.set(this, 'type', value);

  @override
  String get content => RealmObjectBase.get<String>(this, 'content') as String;
  @override
  set content(String value) => RealmObjectBase.set(this, 'content', value);

  @override
  int get state => RealmObjectBase.get<int>(this, 'state') as int;
  @override
  set state(int value) => RealmObjectBase.set(this, 'state', value);

  @override
  ObjectId get userId =>
      RealmObjectBase.get<ObjectId>(this, 'user_id') as ObjectId;
  @override
  set userId(ObjectId value) => RealmObjectBase.set(this, 'user_id', value);

  @override
  ObjectId get chatId =>
      RealmObjectBase.get<ObjectId>(this, 'chat_id') as ObjectId;
  @override
  set chatId(ObjectId value) => RealmObjectBase.set(this, 'chat_id', value);

  @override
  Stream<RealmObjectChanges<Message>> get changes =>
      RealmObjectBase.getChanges<Message>(this);

  @override
  Message freeze() => RealmObjectBase.freezeObject<Message>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Message._);
    return const SchemaObject(ObjectType.realmObject, Message, 'Message', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('type', RealmPropertyType.int),
      SchemaProperty('content', RealmPropertyType.string),
      SchemaProperty('state', RealmPropertyType.int),
      SchemaProperty('userId', RealmPropertyType.objectid, mapTo: 'user_id'),
      SchemaProperty('chatId', RealmPropertyType.objectid, mapTo: 'chat_id'),
    ]);
  }
}
