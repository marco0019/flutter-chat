// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Chat extends _Chat with RealmEntity, RealmObjectBase, RealmObject {
  Chat(
    ObjectId id,
    String chatName,
    String lastMessage,
    DateTime lastDate,
    String typeOfMessage,
    int stateOfMessage,
    ObjectId senderId,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'chatName', chatName);
    RealmObjectBase.set(this, 'lastMessage', lastMessage);
    RealmObjectBase.set(this, 'lastDate', lastDate);
    RealmObjectBase.set(this, 'typeOfMessage', typeOfMessage);
    RealmObjectBase.set(this, 'stateOfMessage', stateOfMessage);
    RealmObjectBase.set(this, 'senderId', senderId);
  }

  Chat._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get chatName =>
      RealmObjectBase.get<String>(this, 'chatName') as String;
  @override
  set chatName(String value) => RealmObjectBase.set(this, 'chatName', value);

  @override
  String get lastMessage =>
      RealmObjectBase.get<String>(this, 'lastMessage') as String;
  @override
  set lastMessage(String value) =>
      RealmObjectBase.set(this, 'lastMessage', value);

  @override
  DateTime get lastDate =>
      RealmObjectBase.get<DateTime>(this, 'lastDate') as DateTime;
  @override
  set lastDate(DateTime value) => RealmObjectBase.set(this, 'lastDate', value);

  @override
  String get typeOfMessage =>
      RealmObjectBase.get<String>(this, 'typeOfMessage') as String;
  @override
  set typeOfMessage(String value) =>
      RealmObjectBase.set(this, 'typeOfMessage', value);

  @override
  int get stateOfMessage =>
      RealmObjectBase.get<int>(this, 'stateOfMessage') as int;
  @override
  set stateOfMessage(int value) =>
      RealmObjectBase.set(this, 'stateOfMessage', value);

  @override
  ObjectId get senderId =>
      RealmObjectBase.get<ObjectId>(this, 'senderId') as ObjectId;
  @override
  set senderId(ObjectId value) => RealmObjectBase.set(this, 'senderId', value);

  @override
  Stream<RealmObjectChanges<Chat>> get changes =>
      RealmObjectBase.getChanges<Chat>(this);

  @override
  Chat freeze() => RealmObjectBase.freezeObject<Chat>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Chat._);
    return const SchemaObject(ObjectType.realmObject, Chat, 'Chat', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('chatName', RealmPropertyType.string),
      SchemaProperty('lastMessage', RealmPropertyType.string),
      SchemaProperty('lastDate', RealmPropertyType.timestamp),
      SchemaProperty('typeOfMessage', RealmPropertyType.string),
      SchemaProperty('stateOfMessage', RealmPropertyType.int),
      SchemaProperty('senderId', RealmPropertyType.objectid),
    ]);
  }
}
