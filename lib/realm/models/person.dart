import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
part 'person.g.dart';

@RealmModel()
class _Person {
  @PrimaryKey()
  @MapTo('nickName')
  late String nickName;

  @MapTo('firstName')
  late String firstName;

  @MapTo('lastName')
  late String lastName;

  @MapTo('birthdate')
  late DateTime birthdate;
}
