import 'package:realm/realm.dart';
part 'person.g.dart';

@RealmModel()
class _Person {
  @PrimaryKey()
  @MapTo('id')
  late int id;

  @MapTo('firstName')
  late String firstName;

  @MapTo('lastName')
  late String lastName;

  @MapTo('birthdate')
  late DateTime birthdate;
}
