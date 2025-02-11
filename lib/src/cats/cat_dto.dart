import 'package:json_annotation/json_annotation.dart';

part 'cat_dto.g.dart';

@JsonSerializable()
class CatDTO {
  final String id;
  final String name;
  final String temperament;
  final String origin;
  final String description;

  @JsonKey(name: 'reference_image_id')
  final String imageId;

  final CatImage? image;

  const CatDTO({
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.description,
    required this.imageId,
    this.image,
  });

  factory CatDTO.empty() => const CatDTO(
        id: '',
        name: '',
        temperament: '',
        origin: '',
        description: '',
        imageId: '',
      );

  factory CatDTO.fromJson(Map<String, dynamic> json) => _$CatDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CatDTOToJson(this);

  static List<CatDTO> fromList(List<dynamic> jsonList) => jsonList.map((entry) => CatDTO.fromJson(entry)).toList(growable: false);
}

@JsonSerializable()
class CatImage {
  final String url;

  const CatImage({required this.url});

  factory CatImage.fromJson(Map<String, dynamic> json) => _$CatImageFromJson(json);
  Map<String, dynamic> toJson() => _$CatImageToJson(this);
}
