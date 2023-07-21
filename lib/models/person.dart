import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 1)
class Person {
  Person({required this.name, required this.accountType, required this.userId});
  @HiveField(0)
  String name;

  @HiveField(1)
  String accountType;

  @HiveField(2)
  String userId;
}
