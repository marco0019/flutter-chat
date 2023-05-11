import 'package:realm/realm.dart';
part 'person.g.dart';

@RealmModel()
class _Person {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  late String userId;

  late String nickName;

  late String firstName;

  late String lastName;

  late String email;

  late String password;
}
