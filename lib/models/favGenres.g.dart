// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favGenres.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavGenresAdapter extends TypeAdapter<FavGenres> {
  @override
  final int typeId = 2;

  @override
  FavGenres read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavGenres(
      genres: (fields[0] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, FavGenres obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.genres);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavGenresAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
