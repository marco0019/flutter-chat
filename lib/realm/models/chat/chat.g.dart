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
    RealmObjectBase.set(this, 'chat_name', chatName);
    RealmObjectBase.set(this, 'last_message', lastMessage);
    RealmObjectBase.set(this, 'last_date', lastDate);
    RealmObjectBase.set(this, 'type_message', typeOfMessage);
    RealmObjectBase.set(this, 'state_message', stateOfMessage);
    RealmObjectBase.set(this, 'sender_id', senderId);
  }

  Chat._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get chatName =>
      RealmObjectBase.get<String>(this, 'chat_name') as String;
  @override
  set chatName(String value) => RealmObjectBase.set(this, 'chat_name', value);

  @override
  String get lastMessage =>
      RealmObjectBase.get<String>(this, 'last_message') as String;
  @override
  set lastMessage(String value) =>
      RealmObjectBase.set(this, 'last_message', value);

  @override
  DateTime get lastDate =>
      RealmObjectBase.get<DateTime>(this, 'last_date') as DateTime;
  @override
  set lastDate(DateTime value) => RealmObjectBase.set(this, 'last_date', value);

  @override
  String get typeOfMessage =>
      RealmObjectBase.get<String>(this, 'type_message') as String;
  @override
  set typeOfMessage(String value) =>
      RealmObjectBase.set(this, 'type_message', value);

  @override
  int get stateOfMessage =>
      RealmObjectBase.get<int>(this, 'state_message') as int;
  @override
  set stateOfMessage(int value) =>
      RealmObjectBase.set(this, 'state_message', value);

  @override
  ObjectId get senderId =>
      RealmObjectBase.get<ObjectId>(this, 'sender_id') as ObjectId;
  @override
  set senderId(ObjectId value) => RealmObjectBase.set(this, 'sender_id', value);

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
      SchemaProperty('chatName', RealmPropertyType.string, mapTo: 'chat_name'),
      SchemaProperty('lastMessage', RealmPropertyType.string,
          mapTo: 'last_message'),
      SchemaProperty('lastDate', RealmPropertyType.timestamp,
          mapTo: 'last_date'),
      SchemaProperty('typeOfMessage', RealmPropertyType.string,
          mapTo: 'type_message'),
      SchemaProperty('stateOfMessage', RealmPropertyType.int,
          mapTo: 'state_message'),
      SchemaProperty('senderId', RealmPropertyType.objectid,
          mapTo: 'sender_id'),
    ]);
  }
}
