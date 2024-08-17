// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bird.g.dart';

typedef BirdId = int;

@JsonSerializable()
class Bird extends Equatable {
  const Bird({
    required this.id,
    required this.myanmarName,
    required this.englishname,
    required this.description,
    required this.image,
  });

  @JsonKey(name: 'Id')
  final BirdId id;

  @JsonKey(name: 'BirdMyanmarName')
  final String myanmarName;

  @JsonKey(name: 'BirdEnglishName')
  final String englishname;

  @JsonKey(name: 'Description')
  final String description;

  @JsonKey(name: 'ImagePath')
  final String image;

  factory Bird.fromJson(Map<String, dynamic> json) => _$BirdFromJson(json);

  String get imagePath => 'assets/$image';

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}
