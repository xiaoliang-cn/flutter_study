import 'dart:math';

import 'package:hive/hive.dart';
part 'hive_user.g.dart';

/// to be used do need register a user adapter
@HiveType(typeId: 1)
class User {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? age;
  @override
  String toString() {
    return this.name! + '=' + this.age!;
  }
}
