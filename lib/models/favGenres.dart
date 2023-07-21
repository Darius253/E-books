import 'package:hive/hive.dart';

part 'favGenres.g.dart';

@HiveType(typeId: 2)
class FavGenres {
  FavGenres({
    required this.genres,
  });
  @HiveField(0)
  List<String> genres;
}
