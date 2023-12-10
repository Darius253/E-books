import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:reader_app/shared/exports.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
  Hive.registerAdapter(FavGenresAdapter());
  boxPersons = await Hive.openBox<Person>('userDetails');
  boxGenres = await Hive.openBox<FavGenres>('favGenres');

  runApp(const App());
}
