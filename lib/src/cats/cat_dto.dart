import 'package:json_annotation/json_annotation.dart';

part 'cat_dto.g.dart';

@JsonSerializable()
class CatDTO {
  final String id;
  final String name;

  CatDTO({required this.id, required this.name});

  factory CatDTO.fromJson(Map<String, dynamic> json) => _$CatDTOFromJson(json);

  static List<CatDTO> fromList(List<dynamic> jsonList) => jsonList.map((entry) => CatDTO.fromJson(entry)).toList(growable: false);
}
