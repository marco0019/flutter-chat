// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_chat.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class UsersChat extends _UsersChat
    with RealmEntity, RealmObjectBase, RealmObject {
  UsersChat(
    ObjectId id, {
    Iterable<ObjectId> userIds = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set<RealmList<ObjectId>>(
        this, 'user_ids', RealmList<ObjectId>(userIds));
  }

  UsersChat._();

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
  Stream<RealmObjectChanges<UsersChat>> get changes =>
      RealmObjectBase.getChanges<UsersChat>(this);

  @override
  UsersChat freeze() => RealmObjectBase.freezeObject<UsersChat>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(UsersChat._);
    return const SchemaObject(ObjectType.realmObject, UsersChat, 'UsersChat', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('userIds', RealmPropertyType.objectid,
          mapTo: 'user_ids', collectionType: RealmCollectionType.list),
    ]);
  }
}
