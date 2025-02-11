// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatDTO _$CatDTOFromJson(Map<String, dynamic> json) => CatDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      temperament: json['temperament'] as String,
      origin: json['origin'] as String,
      description: json['description'] as String,
      imageId: json['reference_image_id'] as String,
      image: json['image'] == null
          ? null
          : CatImage.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CatDTOToJson(CatDTO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'temperament': instance.temperament,
      'origin': instance.origin,
      'description': instance.description,
      'reference_image_id': instance.imageId,
      'image': instance.image,
    };

CatImage _$CatImageFromJson(Map<String, dynamic> json) => CatImage(
      url: json['url'] as String,
    );

Map<String, dynamic> _$CatImageToJson(CatImage instance) => <String, dynamic>{
      'url': instance.url,
    };
