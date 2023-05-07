// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Chat extends _Chat with RealmEntity, RealmObjectBase, RealmObject {
  Chat(
    ObjectId id, {
    Iterable<ObjectId> userIds = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set<RealmList<ObjectId>>(
        this, 'user_ids', RealmList<ObjectId>(userIds));
  }

  Chat._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  RealmList<ObjectId> get userIds =>
      RealmObjectBase.get<ObjectId>(this, 'user_ids') as RealmList<ObjectId>;
  @override
  set userIds(covariant RealmList<ObjectId> value) =>
      throw RealmUnsupportedSetError();

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
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('userIds', RealmPropertyType.objectid,
          mapTo: 'user_ids', collectionType: RealmCollectionType.list),
    ]);
  }
}
