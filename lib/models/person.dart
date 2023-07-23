import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 1)
class Person {
  Person({
    required this.name,
    required this.accountType,
    required this.userId,
    required this.token,
    required this.country,
  });
  @HiveField(0)
  String name;

  @HiveField(1)
  String accountType;

  @HiveField(2)
  String userId;

  @HiveField(3)
  String token;

  @HiveField(4)
  String country;
}
